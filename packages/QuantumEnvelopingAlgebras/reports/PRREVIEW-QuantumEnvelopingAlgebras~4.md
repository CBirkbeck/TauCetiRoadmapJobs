# Review of QuantumEnvelopingAlgebras (pull request #1125 at d8e092b)

**Verdict:** accepted

Full review of the repaired head (311 changed lines since 349aa66). The gate passes, the dependency check shows no UPWARD or CYCLE line, `Suggested.lean` elaborates with `sorry` as the only warning, the fifteen sampled targets check against the cached sources at their cited lines, and the sign comparison and the symmetrizer reduction that answer the previous blocking finding are recomputed below and hold. No P1 or P2 finding remains; three P3 notes follow.

**Status of the previous review's findings.** R01 (two classes of roots of unity without a Frobenius target): repaired. Witness 1 (`G₂`, `ζ` of order `9`) is now reached by 5.3 setting (ii) through the sign comparison `Ψ` (README lines 892–894, 940–943) and Witness 2 (`B₂`, `d = (2, 4)`, `ζ²` of order `4`) by the reduction to the normalized symmetrizer (lines 793–802, 969–974, 1008–1013); both are Checks, and the coverage sentence (lines 976–982) is now true (enumerated below). R02 (companion Lean file): not repaired, `QuantumPlaneLatticeTargets.lean` is byte-for-byte the file of 47df477 (R01 below). R03 (locators): repaired for 1.5, 4.1, 4.2, 6.2, 7.1, 8.1, 8.2 and for the RootSystems Layer 1 citation; 6.1 still cites no text (R03 below). R04 (braid normalization): repaired, the `(−1)^n` is gone, the formulas are now Lusztig's `T″_(i,−1)` (Jantzen's `Tᵢ`), the inverse formulas and the convention witness at lines 562–565 are stated and recomputed below. R05: all four passages repaired (ratio formula, `[2]₁` factor, QuantumGroups consumer bullet deleted, Gaussian-polynomial owner named at lines 67–71).

## R01 (P3) — The companion Lean file is unchanged for the third round

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/QuantumPlaneLatticeTargets.lean:5–7` (three `Mathlib.*` submodule imports), `:19` (namespace without the `TauCetiRoadmap.` prefix), `:27`, `:93` (`gaussian`, `specialize` declared a second time with the bodies of `Suggested.lean:120`, `:133`), `:38–51`, `:74` (undocumented `def`s), `:100–108` (`gaussian_at_one`, `gaussian_first_root` compute values that README §0.3 and §8.2 state as Checks), `:61` (`comparison_injective`, a boundary statement).

**Claim:** The brief's Lean form rules apply to every `.lean` file in the folder; this file breaks the import, namespace, docstring, no-padding and README–Lean agreement rules (none of its twenty names occurs in the README), and the module docstring of `Suggested.lean:40–41` says Layer 8 is not statable at the pins while this file states it through `Matrix` stand-ins.

**Witness:** `git diff 47df477 d8e092b --stat -- TauCetiRoadmap/QuantumEnvelopingAlgebras` lists only `README.md` and `Suggested.lean`; the gate's import and readme-ids checks read `Suggested.lean` only, which is why it passes.

**Repair:** Delete the file. The README keeps 8.1–8.2 as targets and Checks. If a Layer 8 headline is judged statable through `Matrix` carriers, state it in `Suggested.lean` under the single `import Mathlib`, in the `TauCetiRoadmap.QuantumEnvelopingAlgebras` namespace, reusing `gaussian` and `specialize`, and name it in the README.

## R02 (P3) — `Ψ` is compatible with `Fr` only up to a sign automorphism of the target

**Location:** `README.md:931–932` ("`Ψ` is an isomorphism … it is compatible with `Fr` on both sides"), `:893–894` ("the map at `ζ^c` is the map at `−ζ^c` composed with `Ψ`"), `:1006–1007` ("the two maps agree on the positive half").

**Claim:** When `Fr` exists at both `ζ` and `−ζ` (setting (i) with `L` even, since then `−ζ` also has order `2L`), the two Frobenius maps are intertwined by `Ψ` only after composing with the automorphism `θ` of the target modified algebra, `θ(eᵢ^(k)1_λ) = (−1)^(dᵢ k L(L−1)/2) eᵢ^(k)1_λ`, `θ(fᵢ^(k)1_λ)` likewise, which is not the identity when `L ≡ 2 (mod 4)` and some `dᵢ` is odd.

**Witness:** `A₁`, `d = 1`, `L = 2`, `R = ℤ[i]`, `v ↦ ζ = i`; `−ζ = −i` also has order `4`, so McGerty2006 Theorem 2.6 (line 208) gives `Fr_ζ` and `Fr_(−ζ)` with the same formulas. For `λ ∈ X*`: `Ψ(E^(2)1_λ) = (−1)^(2⟨λ,h⟩ + 1·2·1/2) E^(2)1_λ = −E^(2)1_λ` (the formula at line 910), so `Fr_ζ(Ψ(E^(2)1_λ)) = −e1_λ`; while `Fr_(−ζ)(E^(2)1_λ) = e1_λ` and the target comparison `Ψ*` (datum `(X*, Y*)`, `d* = 4`, `h* = h/2`) multiplies `e1_λ` by `(−1)^⟨λ, 4·h/2⟩ = (−1)^(2⟨λ,h⟩) = 1`. The two sides differ by `−1`; in general by `(−1)^(dᵢ k L(L−1)/2)` on `eᵢ^(k)` and `fᵢ^(k)` (exponent difference `dᵢ[kL(kL−1)/2 − L²k(k−1)/2] = dᵢ k L(L−1)/2`), and that sign is an automorphism of the target presentation (constant on every relation of McGerty2006 Lemma 2.2). For `L ≡ 0 (mod 4)` it is the identity.

**Repair:** State the bullet as `Fr_ζ ∘ Ψ = θ ∘ Ψ* ∘ Fr_(−ζ)` with `θ` as above, or absorb `θ` into the definition of the odd-order map; write the odd-order definition at lines 893–894 as `Ψ* ∘ Fr_(−ζ^c) ∘ Ψ⁻¹` with `Ψ*` the comparison of the target datum (for odd `L` the target parameters `(−ζ)^(L²dᵢ) = (−1)^(dᵢ)` and `ζ^(L²dᵢ) = 1` differ, so a target comparison is needed, not only `Ψ`); and say in the 5.4 Check at line 1007 that the two maps agree on the positive half up to this sign normalization of the primitive generators.

## R03 (P3) — Two locator loose ends

**Location:** `README.md:1029–1039` (6.1 cites only "Layers 4–5; 0.3"); `:1252–1256` (HeckenbergerDoubles2010 "Theorem 5.8 (line 1578)" is listed in References but cited nowhere in the body).

**Claim:** 6.1's `Fr^*L(λ) ≅ L_ζ(Lλ)` and the simple-head statements are the only Layer 6 theorems still without a literature locator (the previous review's table flagged 6.1). AndersenWen1992 line 206–208 contains it as the case `λ⁰ = 0` of the tensor-product theorem (`L_k(lλ¹) ≅ L(λ¹)^([1])`, mixed case; line 209 for characteristic zero after Lusztig). Theorem 5.8 of Heckenberger (line 1578–1580: the induced skew-Hopf pairing of the halves is nondegenerate on `U⁺ × U⁻`) is exactly the nondegeneracy claimed at line 445–446 of §1.4.

**Repair:** Cite AndersenWen1992 §1.9 (line 206) at 6.1 for the pullback identification, and attach "HeckenbergerDoubles2010 Theorem 5.8, line 1578" to the nondegeneracy sentence of §1.4 (or drop it from References).

## Verified sound

**Head, tree, gate, build.** Head `d8e092bd6a2ce39547246f8c49447a65d1e35043`; worktree clean; `git diff --stat origin/main...HEAD` outside the folder is empty. The worker's gate at this head: every check passed, `build=0`. Rerun of the plain gate in this review: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. `lake env lean TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean` at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) finishes in 2 min 11 s with exactly 11 `declaration uses sorry` warnings and nothing else. No `set_option`, no `lemma`, no `Mathlib.*` import in `Suggested.lean`, no sorry'd data, no process words or pull-request numbers in the folder's README or `Suggested.lean`.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. QuantumEnvelopingAlgebras is entry 284 of the merge order, KacMoody entry 3; ArithmeticStatisticsPartIV (entry 100) is named as the Gaussian-polynomial owner and not consumed; HabiroNahmSeries (entry 315) consumes §0.3. RootSystems, LieHighestWeight, ReductiveGroups, QuantumGroups and SchubertGeometry are on main (`929496d4`, unchanged since the previous review). No declared gaps.

**Signatures.** All 47 declarations of `signatures.md` compared with their README statements; the five flagged for dropped binders (`dividedPower`, `genE`, `genF`, `genK`, `counitGenerator`) act on free generators and scalars and need none of the lattice or finiteness instances. On a scratch copy, `#check @braidImageFree`, `@braid_relation`, `@exists_braidOperator`, `@quantumLucas`, `@exists_antipode`, `@triangular_bijective` re-elaborated; the changed `braidImageFree` carries `((-1)^r * ((q^dᵢ)^r)⁻¹) • Eᵢ^(n−r) Eⱼ Eᵢ^(r)` and `((-1)^r * (q^dᵢ)^r) • Fᵢ^(r) Fⱼ Fᵢ^(n−r)`, exactly README lines 519–520. No change needed.

**Padding probe.** A scratch copy with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done)` fails with `unsolved goals` on all 11 sorried theorems (`quantumLucas`, `comul_relations`, `counit_relations`, `comul_coassoc`, `counit_comul_left`, `counit_comul_right`, `exists_antipode`, `triangular_bijective`, `Ktorus_linearIndependent`, `exists_braidOperator`, `braid_relation`). No declaration of `Suggested.lean` restates a definition, mirrors a Check or computes a value; the padding is in the companion file (R01).

**Headline inventory.** Summary end theorems: Hopf structure on the full-`Y` presentation (stated: `bialgebra`, `exists_antipode`), braid relations (stated: `exists_braidOperator`, `braid_relation`), quantum Lucas (stated: `quantumLucas`), integral PBW, `v = 1` comparisons, Frobenius maps and the sign comparison, contraction comparisons (each named in the module docstring with its missing carrier: a reduced word of `w₀`, the `ℤ[v, v⁻¹]`-form, ReductiveGroups §9A's pinned Lie algebra, the weight-module category, Yetter–Drinfeld modules). No statable headline is absent and none is forced through a stand-in in `Suggested.lean`.

**Cross-roadmap citations resolved** (main `929496d4`; KacMoody at the head of its open pull request):

| Citation | Where read | Result |
| --- | --- | --- |
| KacMoody §0.1 (symmetrizers proportional) | KacMoody open head, `TauCetiRoadmap/KacMoody/README.md:214–226` | bullet "every symmetrizer of an indecomposable `A` is a positive rational multiple of any other"; with `d_short = 1` the multiple is the integer `c = d_short`, as 5.1 uses |
| KacMoody §§0.2–0.3, §2.1, Part II | same file `:236–303`, `:484–500`, `:52–60`, `:1273–1275` | realization, lattices, Coxeter matrix `mᵢⱼ = 2,3,4,6`; names QuantumEnvelopingAlgebras as consumer of Layer 0 and Part II as consumer of Layers 1–4 here |
| RootSystems Layer 1 (inversion sets, exchange step, `sᵢ` permutes `Φ⁺ ∖ {αᵢ}`) | main, `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:177–180`, `:218–237` | all three statements are Layer 1 targets (`inversions`, `inversions_ncard_mul_ofIdx`, `Base.IsPos.reflectionPerm`), as the repaired contract says |
| RootSystems Layers 3–4 | same file `:264–289`, `:270–271` | strong exchange, Matsumoto; length equals inversions, `w₀` |
| LieHighestWeight Layers 3–6 | main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405–870` | Verma, `L(λ)`, classification, Weyl's theorem, characters |
| ReductiveGroups §9A, §10B | main, `TauCetiRoadmap/ReductiveGroups/README.md:1109` (anchor `#9a-…`), `:1602–1603` | full-`Y` Kostant form and highest-generated lattices; integral Weyl modules |
| QuantumGroups Q8 item 1 | main, `TauCetiRoadmap/QuantumGroups/README.md:593` | `U_q(sl₂)` as `RingQuot`, PBW, Hopf structure in the Conventions' normalization |
| SchubertGeometry S4, S7 | main, `TauCetiRoadmap/SchubertGeometry/README.md:54–61`, `:93` | LS chains, bonds, Chevalley divisors; consumed as a boundary only |
| ArithmeticStatisticsPartIV §3.2 | open head via `roadmaps show`, lines 129–152 | Gaussian polynomial in `ℕ[t]` with the recursion `[n+1 k+1]_t = [n k]_t + t^(k+1)[n k+1]_t` quoted at README line 67; the relation `[n choose r]_v = v^(−r(n−r))[n r]_(v²)` checked at `n = 2, r = 1`: `v⁻¹(1 + v²) = v⁻¹ + v` |

**Pinned library declarations opened** (paths relative to each library): `Mathlib/RingTheory/Binomial.lean:379` (`Ring.choose`), `:434` (`choose_neg`); `Mathlib/Algebra/Polynomial/Laurent.lean:531` (`eval₂`), `:551` (`eval₂_T`); `Mathlib/RingTheory/Bialgebra/Basic.lean` (`Bialgebra.ofAlgHom`); `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean:124` (`kostantForm (e : ι → L) (h : κ → L)`, no root-datum assertion); `Kostant/HopfAlgebra.lean:176`, `:303` (`instBialgebraKostantForm`, `instHopfAlgebraKostantForm`); `Kostant/Comultiplication.lean:232` (`kostantFormComul_dividedPower`, `kostantFormComul_ringChoose`); `Kostant/BaseChange.lean:68` (`kostantFormBaseChange`); `Kostant/Weight/Basis.lean:94`, `:52–62` (`jointWeightSpace`, `weightSublattice`, `isInternal_weightSublattice`, `kostantWeightBasis`). All exist at the pins with the signatures the contracts describe.

**Ownership.** `roadmaps grep` over main and the 440 open heads: "quantum Frobenius" occurs outside this roadmap only in SchubertGeometry (main line 67 and its revision, a boundary mention) and HabiroNahmSeries (consumer); "Drinfeld–Jimbo" only in KacMoody (as this roadmap's algebra) and the QuantumGroups revision #1705 (a revision, so main's Q8 is the supplier); "quantum plane", "braid automorphism", "modified algebra"/"dot U" (apart from PadicLocalLanglandsForGL2Qp's unrelated use) only here. No other roadmap builds the full-root-datum algebra, the braid automorphisms, quantum Frobenius, the sign comparison or the quantum plane. Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep`/`show`.

**Sources at their locators** (seeded sample and the new citations; `<id> line N` in the cache):

| Target | Source lines | Finding |
| --- | --- | --- |
| 0.2, 0.3 quantum Lucas | McGerty2006 215–235 (Lemma 2.7) | hypothesis `ψ(v^(2l)) = 1`, `ψ(v^(2t)) ≠ 1` for `0 < t < l`; part (1) vanishing; part (2) exponent `l(k₁s − m₁t) + (m₁+1)k₁l²` for `m ≥ k`; signed case is the roadmap's, verified below |
| 1.1 presentation | McGerty2006 96–108; Lentner2014 387–394 (Def. 3.2) | full-`Y` torus `K_μ`, `μ ∈ Y`; equivalence of Lusztig's and the Serre definitions by [L93, Ch. 33] at line 106–108 |
| 1.2 Hopf structure | Lentner2014 425–430 (Thm 3.3); LusztigJAMS1990 1222–1230 (Prop 4.8) | Lentner's `Δ(E) = E⊗K + 1⊗E`, `S(E) = −EK⁻¹`: the flip gives the Conventions' `Δ` and `S⁻¹` gives the Conventions' `S` (`−K⁻¹E`); Lusztig's `Δ(E^(N)) = Σ v^(b(N−b)) E^(N−b)K^b ⊗ E^(b)` and `Δ(F^(N)) = Σ v^(−a(N−a)) F^(a) ⊗ K^(−a)F^(N−a)`; with `K^(−a)F^(b) = v^(2ab)F^(b)K^(−a)` the second is the README's `qᵢ^(ab)Fᵢ^(a) ⊗ Fᵢ^(b)Kᵢ^(−a)` |
| 1.3 | Lentner2014 430–436, 460 | triangular decomposition, `U⁰ ≅ k[Λ]` for `Λ_R ⊆ Λ ⊆ Λ_W` |
| 1.4 braided halves, pairing | McGerty2006 80–95; HeckenbergerDoubles2010 815–826 (Prop 4.3), 866–869 (Rmk 4.4) | `(x₁⊗x₂)(y₁⊗y₂) = v^(|x₂|·|y₁|)(x₁y₁⊗x₂y₂)`, `r(θᵢ) = θᵢ⊗1 + 1⊗θᵢ`, `(θᵢ,θⱼ) = δᵢⱼ/(1 − vᵢ²)`, radical = Serre ideal; skew-Hopf pairing with `η(Eᵢ,Fⱼ) = −δᵢⱼ`, `η(Kᵢ,Lⱼ) = qᵢⱼ`; Remark 4.4 allows `η(Eᵢ,Fⱼ) = aᵢδᵢⱼ` |
| 1.5 double | HeckenbergerDoubles2010 739–741 (§4.1), 874–882 (Def 4.5), 898–904 (Prop 4.6, relation (4.22) `EᵢFⱼ − FⱼEᵢ = δᵢⱼ(Kᵢ − Lᵢ)`), 1039–1042 (Prop 4.14) | as cited; `LᵢEⱼLᵢ⁻¹ = qⱼᵢ⁻¹Eⱼ` (line 902) so identifying `Lᵢ` with `Kᵢ⁻¹` needs `qᵢⱼ = qⱼᵢ`, which holds for `qᵢⱼ = v^(dᵢaᵢⱼ)` |
| 2.1 braid operators | Lentner2014 462–465 (Def 3.4); LusztigJAMS1990 179 (§1 heading, braid group action) | existence and `K`-reflection; formulas are Lusztig 37.1.3 / Jantzen 8.14 (recomputed below) |
| 2.2 root vectors | Lentner2014 466–470, 474–480 (Thm 3.5); LusztigJAMS1990 1098–1099 (Prop 4.1) | `β = s_(i₁)⋯s_(i_(k−1))α_(i_k)`, `E_β = T_(i₁)⋯T_(i_(k−1))E_(α_(i_k))`; PBW basis |
| 3.1 toral basis | Lentner2014 515–520 (Def 3.6), 549–567 (Thm 3.8) | `k[Λ/2Λ_R] ⊗ ⊗ᵢ ⊕ K^(r)_(αᵢ)`: simple-coroot binomials only; the full-`Y` basis is the roadmap's extension (route by the Vandermonde identity of 0.3 with `K`-twists, checked at rank two below) |
| 3.2 integral PBW | Lentner2014 549 (Thm 3.8); LusztigJAMS1990 1204–1208 (Thm 4.5) | `A`-basis of `U_A` with toral part `Kᵢ^(±1)[Kᵢ; 0 choose n]` in the simply-laced simply connected case |
| 3.3 `v = 1` | LusztigJAMS1990 1495–1526 (§6.7); AndersenWen1992 125–135 (§1.2); McGerty2006 278–281 | `U_ℤ/(Kᵢ − 1) ≅` Kostant form, `binom(Hᵢ,t) ↔ [Kᵢ; 0 choose t]` (line 1515–1518); AW quotes it; comparison with the `v = 1` specialization |
| 4.1 `V_A(λ)` | AndersenPoloWen1991 457–473 (§1.20), 500–513 (Prop 1.22) | `D(λ)` = universal `𝒜`-finite quotient of the Verma module, free with Weyl's character; `U_A·v_λ = U_A^-·v_λ` (toral part acts by `A`-scalars on weight vectors) and `D(λ) → V(λ)` is injective since `D(λ)` is free and the rationalization is an isomorphism of equal dimension |
| 4.2 `Φ_λ` | APW 500 (Prop 1.22); LusztigJAMS1990 1495–1526 | freeness and character; `U₁/(Kᵢ − 1) ≅ U_ℤ`; `Φ_λ` itself is the roadmap's |
| 5.1 order data | McGerty2006 335–339; Lentner2014 192–196 (Def 2.3) | `lᵢ` least with `lᵢ(i·i) ∈ 2ℓℤ`; Lentner's `𝓁ᵢ = 𝓁/gcd(𝓁, 2dᵢ)` = order of `q^(2dᵢ)`; conditions (1), (2) |
| 5.2 odd Frobenius | GrosKaneda2013 28–34, 57–84 (§1.3–1.4); Lentner2014 1102–1105 | `l > 1` coprime to the Cartan entries, `B = ℤ[1/2][v]/(Φ_l)`; `E^(n) ↦ X^(n/l)` or `0`, `K^(±1) ↦ 1`; splittings `Fr′^±` on the nilpotent halves [15, 8.6]; Lusztig1990 Thm 8.10 "`𝓁` odd, for `G₂` not divisible by 3" |
| 5.3 modified algebra | McGerty2006 109–112, 155–172 (Lemma 2.2), 176–179 (Def 2.4, nondivisibility), 186 (`ρ`), 208–212 (Thm 2.6), 288–291 (Thm 2.9), 292–296, 307–331 (Lemma 2.11), 332–345 | presentation; `R` over `A_ℓ`; `v♯ᵢ = (−1)^(ℓdᵢ)` (line 326) = README's `ζ^(dᵢℓ²)` for `ζ` of order `2ℓ`; quasiclassical identification under no odd cycles |
| 5.4 half-algebra sequences | Lentner2014 106–114 (Thm 5.4 table), 1116–1137 (Thm 6.1 table), 1162 | rows used: `B_n`, `𝓁 = 4`: `A₁^(×n) → C_n` (line 1130); `B_n`, `4 ∣ 𝓁 ≠ 4`: kernel `B_n` (line 1129); `G₂`, `3 ∣ 𝓁 ≠ 3, 6`: `G₂ → G₂` (line 1135); `G₂`, `𝓁 = 3, 6`: `A₂ → G₂`, braided for `𝓁 = 6` (1136); `G₂`, `𝓁 = 4`: `A₃` (1137); trivial `𝓁 = 1, 2` (1120–1121) |
| 6.1 | no text | R03 |
| 6.2 Steinberg | AndersenWen1992 86–91 (setup), 205–210 (§1.9 theorem, printed p. 40) | `k` a field with `v ↦ ζ` a primitive `l`-th root, `l` odd and prime to 3 for `G₂` (the README's odd nondivisible case), simply connected torus `Kᵢ`; `L_k(λ) ≅ L_k(λ⁰) ⊗ L(λ¹)^([1])` with `L_k(λ⁰)` simple over the small quantum group; line 209 attributes characteristic zero to Lusztig |
| 7.1, 7.2 contraction | GrosKaneda2013 53–56, 1724–1729 (§6.1), 1792–1823 ((6.4.4)), 1842–1847 (§6.7, Lemma 6.8) | contraction through the modified algebra for weight modules; `binom(Hᵢ, m)` acts on `lλ₁` by `binom(⟨λ₁,α∨ᵢ⟩, m)`; `(V ⊗ M^Fr)^φ ≃ V^φ ⊗ M ≃ (M^Fr ⊗ V)^φ` for `V` integrable type 1, `M` finitely generated with weights |
| 8.1 quantum plane | Kassel1995 Ch. VII §3 (uncertified) | cited by locator |
| 8.2 lattices | AndersenPoloWen1991 500 (Prop 1.22), 570–571 (Remark: `D′(−λ)* ≅ H⁰(λ)`, Prop 3.3) | Weyl lattice; induced module as dual of a Weyl module |

**Adversarial table** (values computed in this review; Laurent polynomials in `v`, numerics at exact roots of unity in `ℂ`):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.3 `quantumLucas` | `l = 1..6`, `N ∈ {l (odd), 2l}`, `m ∈ [−12, 12]`, `r ∈ [0, 14]` | 3375 instances of `specialize ζ (signedGaussian m r)` against `ζ^(l(r₁m₀ − m₁r₀) + (m₁+1)r₁l²)·[m₀ choose r₀]_ζ·Ring.choose m₁ r₁` with Euclidean `m₁, m₀, r₁, r₀` | all agree (one instance at `l = N = 1`, `m = −12`, `r = 14` differs by `1.7·10⁻⁷` on a value `4457400`, floating-point only); no change |
| 0.3 product formula, Vandermonde | `m ∈ [−8, 8]`, `r ≤ 6`; `m, m′ ∈ [−5, 5]`, `r ≤ 5` | `signedGaussian m r · ∏[j] = ∏[m−j+1]` on every instance; `[m+m′ choose r] = Σ v^(m′a−mb)[m choose a][m′ choose b]` on every instance | hold |
| 0.3 Checks | `gaussian 2 1`, `gaussian 4 2`, `signedGaussian (−1) r`, `(−2) 1`; `ζ₃`, `i`, `−1`, `ζ₅` | `v⁻¹ + v`; `v⁻⁴ + v⁻² + 2 + v² + v⁴`; `(−1)^r`; `−v⁻¹ − v`; `[−3 choose 3]_ζ₃ = −1 = −[5 choose 3]_ζ₃`; `[3 choose 2]_i = −1 = i^10`; `[2 choose 1]_(−1) = −2`; `[5]_ζ₅ = 0`; `Ring.choose (−5) 3 = −35 = signedGaussian (−5) 3` at `v = 1` | all hold |
| 0.2 `qInt` | `q = 2, r = 3` | `(8 − 1/8)/(2 − 1/2) = 21/4` | holds |
| 1.2 antipode transport from Lentner | `E` | Lentner `S(E) = −EK⁻¹`; co-opposite antipode `S⁻¹(E) = −K⁻¹E` = Conventions | consistent |
| 1.4 pairing recursion | `p(E², F²)`, `d = 1` | `r₋(F²) = F²⊗1 + (1 + v⁻²)F⊗F + 1⊗F²` (braided product `(1⊗F)(F⊗1) = v^(−2)F⊗F`), so `(1 + v⁻²)c²` | matches Check |
| 1.5 cross rule | rank one, `a = E`, `b = F`; `a = K_y`, `b = F`; `a = E`, `b = K_z` | `cK⁻¹ + EF = FE + cK`, so `EF − FE = c(K − K⁻¹)`; `K_yF = v^(−⟨α,y⟩)FK_y`; `K_zE = v^⟨α,z⟩EK_z` | matches Check line 495–496 |
| 1.5 `b` consistency | `B₂`, `d = (1, 2)` | `⟨α₁, 2h₂⟩ = 2a₂₁ = −2 = a₁₂ = ⟨α₂, h₁⟩` | consistent |
| 2.1 normalization | `A₂`, `n = 1` | README `T₁(E₂) = E₁E₂ − q⁻¹E₂E₁` = Jantzen `T_α(E_β) = Σ(−1)^i q_α^(−i) E_α^((r−i))E_βE_α^((i))` = Lusztig `T″_(i,−1)`, whose `T″_(i,−1)(Eᵢ) = −FᵢKᵢ`, `T″_(i,−1)(Fᵢ) = −Kᵢ⁻¹Eᵢ` | R04 repaired |
| 2.1 inverse | rank one; `A₂` | `T(T⁻¹(E)) = T(−K⁻¹F) = −K(−K⁻¹E) = E`; `T(T⁻¹(F)) = T(−EK) = −(−FK)K⁻¹ = F`; `T₁(E₂E₁ − q⁻¹E₁E₂) = −XF₁K₁ + q⁻¹F₁K₁X = (F₁X − XF₁)K₁` using `K₁X = qXK₁`; `[F₁, X] = [F₁,E₁]E₂ − q⁻¹E₂[F₁,E₁] = (q − q⁻¹)E₂K₁⁻¹/(q − q⁻¹) = E₂K₁⁻¹`, so the composite returns `E₂` | Check line 562–565 holds |
| 2.1 variants | `A₂` | `−1·(E₁E₂ − q⁻¹E₂E₁) = q⁻¹E₂E₁ − E₁E₂`; `−q·(…) = E₂E₁ − qE₁E₂` | as stated |
| 2.2 straightening | `A₂`, word `121` | `E₂E₁ − qE₁E₂ = −q(E₁E₂ − q⁻¹E₂E₁)`; `E_(α₁+α₂)E₁ − q⁻¹E₁E_(α₁+α₂) = −q⁻¹(E₁²E₂ − (q+q⁻¹)E₁E₂E₁ + E₂E₁²) = −q⁻¹[2]·(E₁^(2)E₂ − E₁E₂E₁ + E₂E₁^(2))`; on the standard representation `e₁₂e₂₃ − q⁻¹e₂₃e₁₂ = e₁₃` | Checks and Example hold |
| 3.1 full-`Y` toral span | `Y = ℤy ⊕ ℤz`, `m = 1` | `[K_(y+z); 0 choose 1] = K_y[K_z; 0 choose 1] + K_z⁻¹[K_y; 0 choose 1]` and `K_z⁻¹ = K_z − (v − v⁻¹)[K_z; 0 choose 1]`; in general `[K_(y+z); 0 choose m] = Σ_(a+b=m) K_z^a K_y^(−b)[K_y; 0 choose a][K_z; 0 choose b]` by the Vandermonde identity of 0.3 on every weight | route sound |
| 3.3 Check | `⟨ν,y⟩ = −1`, `m = 2` | `binom(−1, 2) = 1` | holds |
| 4.1 identification | symbolic | `U_A v_λ = U_A^- U_A^0 U_A^+ v_λ = U_A^- v_λ`; `D(λ)` free of rank `dim V(λ)` maps onto `U_A^- v_λ` and injectively | sound |
| 4.2 rank one | `λ = 2ω` | `F, E` at `v = 1` on `b₀, b₁, b₂`: `(1, 2)`, `(2, 1)`; `Φ = I₃`; monomial comparison `diag(1, 2, 1)`, determinant `2` | agrees with Checks |
| 5.1 `ℓᵢ` and modified data | `G₂` `L = 3, 9, 2`; `B₂ (1,2)` `L = 2`; `B₂ (2,4)` `L = 4`; `G₂ (2,6)` `L = 4` | `(3,1)`, `(9,3)`, `(2,2)`; `(2,1)`; `(2,1)`; `(2,2)`; `A*` for `G₂` at `L = 3` and `L = 9`: `[[2,−1],[−3,2]]` with `d* = (9,3)`, resp. `(81,27)`; `B₂` both: `[[2,−1],[−2,2]]`, `d* = (4,2)`, resp. `(8,4)` | all Checks hold |
| 5.1 reduction identity | `L ≤ 60`, `c ≤ 6`, `d ≤ 3` | `gcd(L, c·d) = gcd(L, c)·gcd(L/gcd(L,c), d)` on every instance; hence `ℓᵢ(L, d) = ℓᵢ(L′, d_norm)` | holds |
| 5.1 ratio bullet | `(d, L)` = `((2,4),4)`, `((1,2),2)`, `((1,2),4)`, `((1,3),3)`, `((1,3),9)`, `((2,6),4)`, `((3,9),6)` | `ℓ_short/ℓ_long` = `2, 2, 2, 3, 3, 1, 1` = `gcd(L,d_long)/gcd(L,d_short)` = `gcd(L/gcd(L,d_short), d_long/d_short)` in every case; the old `gcd(L, d_long)` gives `4, 2, 2, 3, 3, 2, 3` | repaired formula holds, old one fails at three instances |
| 5.1 Lusztig's conditions | `G₂ L = 3, 2, 9`; `B₂ L = 2` | fail `1 < 2` at `(2,1)`; fail `2 < 4` at `(1,2)`; hold (`3 ≥ 2`, `9 ≥ 4`); fail `1 < 2` | as stated |
| 5.3 `[m]` under `v ↦ −v` | `m ≤ 8`; `[n]ᵢ!`, `d = 1,2,3`, `n ≤ 6` | `[m]_(−v) = (−1)^(m−1)[m]_v`; `[n]ᵢ!` changes by `(−1)^(d n(n−1)/2)` | holds |
| 5.3 `Ψ` on the same-root relation | `d ∈ {1,2,3}`, `a, b ≤ 4`, `m = ⟨λ,h⟩ ∈ [−7, 7]`, every `t` (2337 terms) | left sign `(−1)^(adm + da(a−1)/2 + bd + db(b−1)/2)` equals right sign `(−1)^((b−t)d + d(b−t)(b−t−1)/2 + (a−t)d(m+2b) + d(a−t)(a−t−1)/2)` times the Gaussian ratio `[m+a+b choose t]_(−vᵢ)/[…]_(vᵢ) = (−1)^(d t(m+a+b−t))` on every term | `Ψ` respects the relation |
| 5.3 rank-one Check | `d = 1`, `a = b = 1`, `m ∈ [−4, 4]` | with the weight sign: relation preserved for every `m`; without it (`Ψ(E1_λ) = E1_λ`): preserved exactly for `m` even | Check holds |
| 5.3 `Ψ` on the Serre relation | `aᵢⱼ ∈ {−1,−2,−3}`, `dᵢ ∈ {1,2,3}`, `N = 1 − aᵢⱼ` | term `r` sign from divided powers `dᵢ(r(r−1)/2 + s(s−1)/2)` plus weight sign `r dᵢaᵢⱼ`: constant in `r` for all nine pairs; without the weight sign it is constant only when `dᵢaᵢⱼ` is even (`(−1,1)`, `(−1,3)`, `(−3,1)`, `(−3,3)` fail) | the bipartite weight sign is needed and suffices |
| 5.3 `Ψ` on the cross relation `i ≠ j` | bipartition cases | exponent difference `ab(⟨αⱼ, yᵢ⟩ + ⟨αᵢ, y′ⱼ⟩)` = `2ab dᵢaᵢⱼ` (`i ∈ I₀, j ∈ I₁`), `0` (`i ∈ I₁, j ∈ I₀`), `ab dᵢaᵢⱼ = 0` (same part) | preserved |
| 5.3 `Ψ` on divided powers | `n`, `i ∈ I₀` | `Π_k (−1)^⟨λ+kαᵢ, dᵢhᵢ⟩ = (−1)^(n⟨λ,dᵢhᵢ⟩)` (since `⟨αᵢ, dᵢhᵢ⟩ = 2dᵢ`), times `(−1)^(dᵢn(n−1)/2)` from `[n]ᵢ!` | formula at line 910 holds |
| 5.3 odd order via `−ζ` | `ζ` of odd order `L` | `Φ_(2L)(x) = Φ_L(−x)` for `L` odd, so `Φ_(2L)(−ζ) = 0` and `ℤ[ζ]` with `v ↦ −ζ` is an `A_L`-algebra; `ζ` of even order `N`: `ζ²` has order `N/2 = L` and `ζ` order `2L` | Conventions line 94–95 and 5.3 hold |
| 5.3 compatibility bullet | `A₁`, `d = 1`, `L = 2`, `ζ = i` | `Fr_ζ(Ψ(E^(2)1_λ)) = −e1_λ`; `Ψ*(Fr_(−ζ)(E^(2)1_λ)) = +e1_λ` | R02 |
| 5.3 target parameters | `v` of order `2ℓ` | McGerty `φ(v♯ᵢ) = (−1)^(ℓdᵢ)` (line 326); README `ζ^(dᵢℓ²) = (−1)^(ℓdᵢ)`; for odd `L`, `(−ζ)^(L²dᵢ) = (−1)^(dᵢ)` against `ζ^(L²dᵢ) = 1` | agree; target comparison needed (R02) |
| 5.4 coverage | `B₂` `(1,2)`, `G₂` `(1,3)`, `A₂`, `L′ ≤ 60` | pairs with `L′` divisible and Lusztig's conditions failing: `B₂`: `{2}`; `G₂`: `{3}`; `A₂`: none | "exactly" sentence holds |
| 5.4 Checks | `G₂`, `𝓁 = 9`; `B₂ (2,4)`, `ζ` of order `8` | `𝓁ᵢ = 9/gcd(9,2), 9/gcd(9,6) = (9, 3)`, Lentner row `3 ∣ 𝓁 ≠ 3,6`: `G₂ → G₂`; `ζ^c = ζ²` of order `4`, `L′ = 2`, row `𝓁 = 4`: `A₁ × A₁ → C₂`; the wrong `𝓁 = 8` row has kernel `B₂` | hold |
| 5.2 `Fr([K; 0 choose L]) = H` | `L = 3, 5`, weight `Lk`, `k ∈ [−3, 3]` | `[Lk choose L]_ζ = k` on every instance | holds |
| 7.1 toral binomials | `L = 3`, `κ ∈ {−2, 1, 2}`, `n ≤ 6` | `[3κ choose n]_ζ₃ = binom(κ, n/3)` for `3 ∣ n` (`1, −2, 3`; `1, 1, 0`; `1, 2, 1`) and `0` otherwise | holds |
| 8.2 `T_n` equivariance | general `n`, `c_j = (−1)^j v^(j(j+1−n))` | dual action `E·φ_k = −[n−k]v^(2k−n)φ_(k+1)`, `F·φ_k = −[k]v^(n−2k+2)φ_(k−1)`, `K·φ_k = v^(2k−n)φ_k`; needs `c_(j−1)/c_j = −v^(n−2j)` and `c_(j+1)/c_j = −v^(2j+2−n)`, both true; `n = 3`: `c = (1, −v⁻¹, 1, −v³)` | Example line 1218 holds |
| 8.2 `C_L`, kernel, quotient | `L = 3, 5`; `L` odd general | diagonal `[L choose j]_ζ = 1, 0, …, 0, 1`; `[3 choose 3]_ζ₃ = 1`, `[−3 choose 3]_ζ₃ = −1`; `a_k ↦ [k+1]b_(k+1)` intertwines `E` since `[L−1−k][k] = [k+1][L−k]` (`[L−k] = −[k]` at `ζ^L = 1`); `a_k ↦ (−1)^k w_(k+1)` likewise; `C₂ = diag(1, v + v⁻¹, 1)` → `(1, 2, 1)` at `v = 1` | Checks hold |
| Lean `braidWord` | `n = 1, 2, 3` | `Tᵢ`, `Tᵢ ∘ Tⱼ`, `Tᵢ ∘ Tⱼ ∘ Tᵢ` | "`n` factors" |
| Lean `quantumLucas` | signature | Euclidean `m / l`, `m % l` on `ℤ`, `(m % l).toNat`, unit power `ζ ^ (… : ℤ)` | matches README 0.3 |

## Not verifiable

- Lusztig1993 (uncertified): §1.2, §33.2, Chapters 34, 35 (Theorem 35.1.9), 37 (§37.1.3), 39, 41, §23.2, §31.1.3 are cited by locator only; the normalization of `T″_(i,−1)` was checked against Jantzen's `Tᵢ` (Lectures on Quantum Groups, 8.14) from the reviewer's knowledge, not from a text; the exact hypothesis of Theorem 35.1.9 on the order of `v` versus `v²` could not be read (the `Ψ` route makes 5.3 independent of it).
- Lusztig1990 (uncertified): Theorem 8.10 and 8.6 are cited through GrosKaneda2013 lines 33, 84 and Lentner2014 line 1102.
- Kassel1995 (uncertified): Chapter VII §3 cited by locator only.
- AndersenPoloWen1991 and AndersenWen1992 are OCR of image-only GDZ scans; the statements at the cited lines are legible, but formulas inside proofs (e.g. APW lines 476–483) are partly garbled and were not relied on.
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep`/`show` (ArithmeticStatisticsPartIV and HabiroNahmSeries read that way).

## Source issues

- **Misprint** in McGerty2006 at Lemma 2.2, printed p. 4 (lines 165–166): the two same-root commutation relations carry the index `j` on the left-hand `F^(b)` and `E^(b)` while their right-hand sides use `i`; it should be `i` on both sides; affects nothing (the roadmap states them with `i = j`).
