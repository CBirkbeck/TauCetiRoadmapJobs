# Review of QuantumEnvelopingAlgebras (pull request #1125 at 349aa66)

**Verdict:** needs changes

Full review of the repaired head (2107 changed lines since 47df477). The gate passes, the dependency check shows no UPWARD or CYCLE line, `Suggested.lean` elaborates with `sorry` as the only warning, and the fifteen sampled targets check against the cached sources at their cited lines. One blocking finding remains: two classes of roots of unity still have no Frobenius target although Layer 5 claims every order. Five P3 notes follow.

**Status of the previous review's findings.** R01 (orders without a target): repaired for the normalized symmetrizer except the odd-order parameters of `G₂` named in R01 below; not repaired for non-normalized symmetrizers (README line 854–855 excludes them explicitly). R02 (braid and Lucas headlines): repaired, `exists_braidOperator`, `braid_relation` and `quantumLucas` are stated and elaborate. R03 (locators): partly repaired, McGerty, Lentner and Gros–Kaneda locators now carry theorem numbers and lines; §§1.5, 4.1, 4.2, 6.2, 7.1, 8.1, 8.2 still cite no text (R03 below). R04 (README shape): repaired, every section has API bullets, three or more Checks, `*Needs:*`, Examples and Dependencies. R05 (companion Lean file): not repaired, `QuantumPlaneLatticeTargets.lean` is byte-for-byte the file the previous review read (R02 below). R06 (Kostant-form carrier): repaired, the supplier contract names `Kostant/Form.lean` and the Hopf instances and the docstring names ReductiveGroups §9A as the missing carrier. R07 (commit-pinned link): repaired, README line 161–162 links the `#9a-the-full-reductive-integral-enveloping-form` anchor, which exists on main at `TauCetiRoadmap/ReductiveGroups/README.md:1109`.

## R01 (P2) — Two classes of roots of unity still have no Frobenius target

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/README.md:801–803` ("for every `L` that is nondivisible … or at which the datum satisfies Lusztig's conditions …, and every `R` over `A_ℓ`"), `:846–855` ("the orders not covered by 5.3 are exactly … For a non-normalized symmetrizer the roadmap's Frobenius theorems are those of 5.2–5.3"), with the Conventions at `:84–86`.

**Claim:** Layer 5 is titled "quantum Frobenius at every root of unity" and the Summary (line 10) promises the map "at every root of unity", but as written 5.2–5.4 leave two classes with no target, and the "exactly" sentence of 5.4 is false for the first of them.

**Witness 1.** `G₂` (`d = (1, 3)`), `ζ = e^(2πi/9)`: `ζ²` has order `L = 9`, so `ℓ = (9, 3)`. 5.2 needs `L` coprime to `d₂ = 3`: excluded. 5.3 needs `R` over `A_ℓ = A/(Φ₁₈(v))` (Conventions line 85: `v` of order `2ℓ`), but `Φ₁₈(ζ) = Φ₉(−ζ) ≠ 0`, so `ℤ[ζ]` with `v ↦ ζ` is not an `A_ℓ`-algebra: excluded, although Lusztig's conditions hold (`ℓ₂ = 3 ≥ 2 = 1 − a₂₁`, `ℓ₁ = 9 ≥ 4 = 1 − a₁₂`). 5.4 covers only `𝓁 = 3, 6`. The same happens for every odd `L` with `3 ∣ L`, `L ≥ 9`, and `ζ` of order `L` rather than `2L`. (For `B_n, C_n, F₄` odd `L` is always nondivisible, so 5.2 covers it; this class is `G₂` only.)

**Witness 2.** `B₂` with the admissible symmetrizer `d = (2, 4)` (`2·(−2) = −4 = 4·(−1)`) and `ζ` with `ζ²` of order `4`: `ℓ = (4/gcd(4,2), 4/gcd(4,4)) = (2, 1)`; not nondivisible; Lusztig's condition fails at `(i, j) = (2, 1)` (`ℓ₂ = 1 < 2`); `L` even so 5.2 does not apply; 5.4 is restricted to the normalized symmetrizer. No target. Yet the positive half of this algebra is the normalized `B₂` half at `ζ²` (its Serre relations and divided powers use only `vᵢ = v^(dᵢ) = (v²)^(dᵢ/2)`), where Lentner2014 line 1130 (`B_n`, `𝓁 = 4`: kernel `A₁^(×n)`, quotient `C_n`) applies verbatim.

**Repair.** (a) State 5.3 for every `ζ` with `ζ²` of order `L`, not only for `R` over `A_ℓ`: either cite Lusztig1993 Chapter 35 with its hypothesis on `ζ²` alone if that is what it assumes, or add the target comparing the specializations of the modified form at `v ↦ ζ` and `v ↦ −ζ` (the sign-twist of the presentation of 5.3, which exists in finite type by the no-odd-cycle argument of McGerty2006 Theorem 2.9, line 288) and compose. Then the 5.4 sentence at line 846–847 becomes true. (b) Drop the normalized-symmetrizer restriction of 5.4: for an indecomposable datum every symmetrizer is `c · d_norm` with `c ∈ ℤ_(>0)` (KacMoody §0.1), and the half-algebra sequence for `(A, c · d_norm)` at `ζ` is the sequence for `(A, d_norm)` at `ζ^c`, componentwise; state that reduction as the target and recompute the list of uncovered orders from it. Add Witness 1 and Witness 2 as Checks (regression: `G₂`, `L = 9`, `ζ` of order `9`, and `B₂`, `d = (2, 4)`, `ζ²` of order `4`, each with the branch that now covers it).

## R02 (P3) — The companion Lean file still breaks every Lean form rule it broke before

**Location:** `TauCetiRoadmap/QuantumEnvelopingAlgebras/QuantumPlaneLatticeTargets.lean:5–7` (three `Mathlib.*` submodule imports), `:19` (`namespace QuantumEnvelopingAlgebras.QuantumPlaneLattice`, no `TauCetiRoadmap.` prefix), `:27`, `:93` (`gaussian`, `specialize` declared a second time, with the same bodies as `Suggested.lean:120`, `:133`), `:38–51`, `:74`, `:96` (undocumented `def`s).

**Claim:** This is R05 of the previous review, untouched. The brief's Lean form rules apply to every `.lean` file in the folder; the gate's import, namespace and readme-ids checks run only on `Suggested.lean`, which is why it passes. None of the file's twenty names occurs in the README (grep for `QuantumPlaneLattice`, `hopfDualComparison`, `monomialE`, `comparison_intertwines`, `specializedComparison`, `gaussian_at_one`, `gaussian_first_root`, `weylE`: no hits), so the README–Lean correspondence rule fails, and the roadmap now owns two definitions of the same Gaussian binomial and the same specialization map.

**Witness:** `git diff 47df477 349aa66 --stat -- TauCetiRoadmap/QuantumEnvelopingAlgebras` lists only `README.md` and `Suggested.lean`.

**Repair:** Delete the file; the README keeps 8.1–8.2 as targets and Checks (the module docstring of `Suggested.lean:40–41` already records Layer 8 as not statable at the pins). If a headline of Layer 8 is judged statable through `Matrix`-valued carriers, state it in `Suggested.lean` under the single `import Mathlib`, in the `TauCetiRoadmap.QuantumEnvelopingAlgebras` namespace, with docstrings, reusing `gaussian` and `specialize`, and name it in the README.

## R03 (P3) — Targets without a literature locator, and two supplier citations to sharpen

**Location:** `README.md:444–460` (1.5, the Borel pairing and the double), `:655–662` (4.1, `V_A(λ)` free of rank `dim V(λ)`), `:674–694` (4.2, `Φ_λ`), `:906–911` (6.2, Steinberg), `:933–943` (7.1, contraction), `:993–1037` (8.1–8.2); `:146–147`; `:496–498`.

**Claim:** These theorems cite only supplier roadmaps or nothing. The brief requires a locator at every claim. Separately: (i) line 146–147 attributes "the enumeration of positive roots `β_k = s_(i₁) ⋯ s_(i_(k−1))(α_(i_k))`" to RootSystems Layer 4, whose text on main (`RepresentationTheory/RootSystems/README.md:296–319`) supplies `w₀` and `ℓ(w₀) = |Φ⁺|` only; the enumeration along a reduced word is the inversion-set combinatorics of its Layer 1 (`:232`). (ii) Line 496–498 cites "Lusztig1993 Chapter 37" for the braid formulas, but see R04.

**Witness:** 4.2 is the seeded sample "Integral specialization at `v = 1`"; the only sources attached to it are ReductiveGroups §9A item 5 and LieHighestWeight, neither of which states a quantum lattice. The route given (complete reducibility, then `U₁⁻ · (1 ⊗ v_λ) ↦ U_ℤ⁻ · v_λ^cl`) is sound, and I recomputed its rank-one instance (table below), but a route is not a locator.

**Repair:** Attach locators, for example Lusztig1993 Chapter 3 for the pairing and the double (or Lentner2014 §3 where it states them), Lusztig1993 §19.3 and §33.1 (or Andersen–Polo–Wen, *Representations of quantum algebras*, Invent. Math. 104 (1991), §1, recorded `uncertified` if not readable) for 4.1–4.2, Lusztig, *Modular representations and quantum groups*, Contemp. Math. 82 (1989), Theorem 7.4 for 6.2, and GrosKaneda2013 §6.7 (line 1842) for 7.1. Point the RootSystems citation at Layer 1 (inversion sets) and Layer 4 (`w₀`).

## R04 (P3) — The braid formulas are a rescaling of Lusztig's operators; say which

**Location:** `README.md:490–498`, `Suggested.lean:370–388`.

**Claim:** `Tᵢ(Eⱼ) = Σ_(r=0)^n (−1)^(r+n) qᵢ^(−r) Eᵢ^(n−r) Eⱼ Eᵢ^(r)` is none of Lusztig's four operators `T′_(i,±1)`, `T″_(i,±1)`: it equals `(−1)^n` times `T″_(i,−1)(Eⱼ)` (the operator with `Tᵢ(Eᵢ) = −FᵢKᵢ`, `Tᵢ(Fᵢ) = −Kᵢ⁻¹Eᵢ`, also Jantzen's `Tᵢ`), and equals `qᵢ^(−n) T′_(i,1)(Eⱼ)`. Both signs give automorphisms satisfying the braid relations, so nothing is false; but a reader checking the locator "Lusztig1993 Chapter 37" finds a different normalization, and KacMoody, Part II will import "the braid automorphisms" by name.

**Witness:** `A₂`, `n = 1`: README `T₁(E₂) = q⁻¹E₂E₁ − E₁E₂` (its own Check, line 545); `T″_(1,−1)(E₂) = E₁E₂ − q⁻¹E₂E₁`; `T′_(1,1)(E₂) = E₂E₁ − qE₁E₂`. On all generators the README's `Tᵢ` is `T′_(i,1) ∘ Ad(Kᵢ)`: `Ad(Kᵢ)` scales `Eⱼ` by `qᵢ^(aᵢⱼ) = qᵢ^(−n)` and `Fⱼ` by `qᵢ^n`, and `T′_(i,1)(qᵢ²Eᵢ) = −qᵢ²KᵢFᵢ = −FᵢKᵢ`. The alternating composite of `m` such operators is `T′_i T′_j T′_i ⋯ ∘ Ad(K_(Σ))` with `Σ = Σ_(β>0) d_β h_β` of the rank-two subsystem on either side (`A₂`: `2h₁ + 2h₂` both ways; `B₂`, `d = (1,2)`: `4h₁ + 6h₂` both ways), so the braid relation transfers.

**Repair:** State in 2.1 which of Lusztig's operators is meant and the rescaling (`Tᵢ = T′_(i,1) ∘ Ad(Kᵢ)`, equivalently `(−1)^(−aᵢⱼ) T″_(i,−1)` on `Eⱼ, Fⱼ`), or adopt `T″_(i,−1)` verbatim (drop the `(−1)^n`) and change the Check at line 545–548 to `E_(α₁+α₂) = E₁E₂ − q⁻¹E₂E₁`.

## R05 (P3) — Small misstatements in Checks, a bullet and the consumer list

**Location:** `README.md:740–741`, `:547–548`, `:1070`, `:60–63`.

**Claim and witnesses:**
- Line 740–741: "the ratio of the `ℓᵢ` is `gcd(L, d_long)`" holds only for `d_short = 1`. `B₂`, `d = (2, 4)`, `L = 4`: `ℓ = (2, 1)`, ratio `2`, but `gcd(4, 4) = 4`. The correct ratio is `gcd(L, d_long)/gcd(L, d_short)`, which is `1` or `d_long/d_short` (for `d_long = r d_short`, `r` prime: `gcd(L′, r)` with `L′ = L/gcd(L, d_short)` coprime to `d_short/gcd`); the type-or-dual-type conclusion survives.
- Line 547–548: "`E_(α₁+α₂)E₁ − q⁻¹E₁E_(α₁+α₂)` is `q⁻¹` times the Serre element". Expanding with `E_(α₁+α₂) = q⁻¹E₂E₁ − E₁E₂` gives `q⁻¹(E₂E₁² − (q + q⁻¹)E₁E₂E₁ + E₁²E₂) = q⁻¹[2]₁ · (E₁^(2)E₂ − E₁E₂E₁ + E₂E₁^(2))`: `q⁻¹[2]` times the divided-power Serre element. "Hence `0`" is unaffected.
- Line 1070: "QuantumGroups consumes the rank-one comparison of Layer 1 §1.1". QuantumGroups is a supplier (merge order, main) and its README cites nothing of this roadmap; a supplier listed as a consumer reads as a cycle. Delete the bullet or move the comparison to §1.1 only.
- Lines 60–63: the Gaussian polynomial `[n k]_t ∈ ℕ[t]` is already a target of ArithmeticStatisticsPartIV §3.2 (open head, earlier in the merge order), which QSeriesPartitionsAndMockModularForms and HabiroRings consume. The symmetric Laurent variant here is a genuine variant (`[n choose r]_v = v^(−r(n−r)) [n r]_(v²)`, so the signed extension and the symmetric Lucas power do not live in `ℕ[t]`), but the Scope must name that owner and give that one-clause relation, as the house rule for kept variants requires. (HabiroNahmSeries, at its open head line 127, cites this material as "§QEA6" with "odd-order hypotheses": its author will want to repoint to §0.3 once this merges; not a defect here.)

**Repair:** Fix the four passages as stated.

## Verified sound

**Head, tree, gate, build.** Head `349aa668a6605abb5464480076a1a47e78b90627`; worktree clean; `git diff --stat origin/main...HEAD` outside the folder is empty. The worker's gate: every check passed (`blob=0`, `depcheck=0`, `build=0`). `lake env lean TauCetiRoadmap/QuantumEnvelopingAlgebras/Suggested.lean` at the manifest pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`; main's manifest already pins `f6090c70`/`358314d4`, the review is at the pull request's pins as the brief directs) finishes in 4 s with exactly 11 `declaration uses sorry` warnings and nothing else. No `set_option`, no `lemma`, no `Mathlib.*` import, no sorry'd data, no `#eval`/`#print axioms`, no process words or pull-request numbers in the folder's README or `Suggested.lean`.

**Dependency check** (`gate --depcheck … --movable`):

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. QuantumEnvelopingAlgebras is entry 284 of the merge order, KacMoody entry 3; every other supplier (RootSystems, LieHighestWeight, ReductiveGroups, QuantumGroups, SchubertGeometry) is on main. No declared gaps.

**Signatures.** All 47 declarations of `signatures.md` compared with their README statements; `#check @quantumLucas`, `@exists_braidOperator`, `@braid_relation`, `@braidImageFree` re-elaborated on a scratch copy and agree with README §§0.3, 2.1. The five declarations flagged for dropped binders (`dividedPower`, `genE`, `genF`, `genK`, `counitGenerator`) act on free generators and scalars and need none of the lattice or finiteness instances; every `theorem` keeps `hq` and `hfac` where the README assumes genericity. No change needed.

**Padding probe.** A scratch copy with each `sorry` replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done)` fails on all 11 sorried theorems (`quantumLucas`, `comul_relations`, `counit_relations`, `comul_coassoc`, `counit_comul_left`, `counit_comul_right`, `exists_antipode`, `triangular_bijective`, `Ktorus_linearIndependent`, `exists_braidOperator`, `braid_relation`). No declaration restates a definition, mirrors a Check or computes a value. The definitions present are exactly those the headlines need (datum, quantum integers, Gaussians, presentation, coproduct and counit as algebra maps, braid images).

**Headline inventory.** End theorems named in the Summary: Hopf structure on the full-`Y` presentation (stated: `bialgebra`, `exists_antipode`), braid relations (stated: `exists_braidOperator`, `braid_relation`), quantum Lucas (stated), integral PBW, `v = 1` comparisons, Frobenius maps, contraction comparisons (each named in the module docstring with the missing carrier: reduced words of `w₀`, the `ℤ[v, v⁻¹]`-form, ReductiveGroups §9A's pinned Lie algebra, the weight-module category, Yetter–Drinfeld modules). No statable headline is absent and none is forced through a stand-in in `Suggested.lean` (the stand-ins are in the companion file, R02).

**Cross-roadmap citations resolved** (main `929496d`; KacMoody at the head of its open pull request):

| Citation | Where read | Result |
| --- | --- | --- |
| KacMoody Layer 0 §§0.1–0.3, Layer 2 §2.1, "Part II" | KacMoody at its open head, `TauCetiRoadmap/KacMoody/README.md:212–303`, `:484–513`, `:52–60`, `:1273–1275` | Same row convention `a_ij = α_j(h_i)`, symmetrizer, independent roots/coroots, full lattices `P`, `Y`, Cartan centre; `m_ij = 2,3,4,6`; KacMoody names QuantumEnvelopingAlgebras as consumer of Layer 0 and Part II as consumer of Layers 1–4 here. Direction consistent. |
| RootSystems Layers 3–4 | main, `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:274–319`, `:232` | Strong exchange, Matsumoto; `w₀` with `ℓ(w₀) = |Φ⁺|`; the reduced-word enumeration is Layer 1 (R03). |
| LieHighestWeight Layers 3–6 | main, `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405–870` | Verma, `L(λ)`, classification, Weyl's theorem, characters. |
| ReductiveGroups §9A items 1–5, §10B | main, `TauCetiRoadmap/ReductiveGroups/README.md:1109–1604`, `:1759–1775` | Full-`Y` Kostant form with `binom(H_y, m)`, PBW, base change, Hopf via `instHopfAlgebraKostantForm`, highest-generated lattices; Weyl modules `Δ(λ)` with simple heads. Anchor `#9a-…` exists. |
| QuantumGroups Q8 item 1 | main, `TauCetiRoadmap/QuantumGroups/README.md:593–640` | `RingQuot` on `E, F, K, K⁻¹`, PBW `F^aK^bE^c`, `ΔE = E⊗1 + K⊗E`, `ΔF = F⊗K⁻¹ + 1⊗F`, `S(E) = −K⁻¹E`, `S(F) = −FK`: identical to the Conventions. |
| SchubertGeometry S4, S7 | main, `TauCetiRoadmap/SchubertGeometry/README.md:54–68`, `:93` | LS chains, bonds `⟨yλ, β∨⟩`, Chevalley divisors; consumed as a boundary only. |

**Pinned library declarations opened** (paths relative to each library):

| File and line | Declaration | What it gives |
| --- | --- | --- |
| `Mathlib/RingTheory/Binomial.lean:379`, `:434` | `Ring.choose`, `Ring.choose_neg` | integer-upper binomials; `Ring.choose (−5) 3 = −35` agrees with `signedGaussian (−5) 3` at `v = 1` (computed) |
| `Mathlib/Algebra/Polynomial/Laurent.lean:531`, `:551` | `LaurentPolynomial.eval₂`, `eval₂_T` | evaluation at a unit, `T n ↦ x ^ n` for `n : ℤ` |
| `Mathlib/RingTheory/Bialgebra/Basic.lean:180` | `Bialgebra.ofAlgHom` | the three coalgebra laws exactly as `comul_coassoc`, `counit_comul_left/right` state them |
| `Mathlib/GroupTheory/Coxeter/Basic.lean:154` | `CoxeterSystem` | consumed through KacMoody §2.1 |
| `Mathlib/RingTheory/Polynomial/Pochhammer.lean:33` | TODO comment only | confirms "no q-binomial at the pins" (line 111–112) |
| `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/Form.lean:124` | `kostantForm (e : ι → L) (h : κ → L)` | subring generated by divided powers and `Ring.choose (h j) n`; no root-datum assertion, as the contract says |
| `Kostant/HopfAlgebra.lean:176`, `:303` | `instBialgebraKostantForm`, `instHopfAlgebraKostantForm` | integral Hopf structure |
| `Kostant/Comultiplication.lean:232`, `:252` | `kostantFormComul_dividedPower`, `kostantFormComul_ringChoose` | sum coproducts consumed in 7.2 |
| `Kostant/BaseChange.lean:68`; `Kostant/Weight/Basis.lean:94`, `:105`, `:183`, `:214` | `kostantFormBaseChange`; `jointWeightSpace`, `weightSublattice`, `isInternal_weightSublattice`, `kostantWeightBasis` | as cited in the Tau Ceti contract |

**Ownership.** `roadmaps grep` over main and the 440 open heads for "quantum Frobenius", "Drinfeld–Jimbo", "quantum plane", "quantum Lucas", "braid automorphism", "Steinberg tensor", "Gaussian binomial / q-binomial": no other roadmap builds the Drinfeld–Jimbo algebra on a full root datum, the braid automorphisms, quantum Frobenius or the quantum plane; KacMoody (open) and QuantumGroups revisions #1649/#1705 (revisions of an existing roadmap, so not suppliers; main's Q8 was used) mention the algebra only as this roadmap's. The Gaussian polynomial owner is ArithmeticStatisticsPartIV §3.2 (R05). HabiroNahmSeries consumes §0.3 (as "§QEA6"). Ownership against open pull requests whose files the brief does not give was checked only through `roadmaps grep`/`show`.

**Sources at their locators** (seeded sample; `<id> line N` in the cache):

| Target | Source lines | Finding |
| --- | --- | --- |
| 0.2, 0.3 quantum Lucas | McGerty2006 215–232 (Lemma 2.7, p. 5), 217–221 (part 1) | hypothesis `ψ(v^(2l)) = 1`, `ψ(v^(2t)) ≠ 1` for `0 < t < l` = "`ζ²` primitive `l`-th root"; exponent `l(k₁s − m₁t) + (m₁+1)k₁l²` = README's; stated for `m ≥ k ≥ 0`; the signed extension is the roadmap's, verified below |
| 1.1 presentation | McGerty2006 96–108 (p. 3); Lentner2014 387–392 (Def. 3.2, p. 10–11) | full-`Y` torus `K_μ`, `μ ∈ Y`; Lusztig's definition via the radical of the form, equivalence by [L93, Ch. 33] at line 106–108 |
| 1.2 Hopf structure | Lentner2014 425–430 (Thm 3.3, p. 12) | `Δ(E) = E⊗K + 1⊗E`: the flipped convention, as the Conventions say |
| 1.3 triangular decomposition, torus | Lentner2014 430–436, 460 | `U⁺ ⊗ U⁰ ⊗ U⁻ ≅ U`, `U⁰ ≅ k[Λ]` for `Λ_R ⊆ Λ ⊆ Λ_W` ("intermediate lattices", as cited) |
| 1.4 braided halves, pairing | McGerty2006 80–95 | `(x₁⊗x₂)(y₁⊗y₂) = v^(|x₂|·|y₁|)(x₁y₁⊗x₂y₂)`, `r(θᵢ) = θᵢ⊗1 + 1⊗θᵢ`, `(θᵢ,θⱼ) = δᵢⱼ/(1 − vᵢ²)`, radical = Serre ideal |
| 1.5 double | no source cited | R03 |
| 2.1 braid operators | Lentner2014 462–465 (Def. 3.4) | existence and `K`-reflection only; formulas are Lusztig Ch. 37 (uncertified), R04 |
| 2.2 root vectors, PBW | Lentner2014 466–478 (Thm 3.5) | `β = s_(i₁)⋯s_(i_(k−1))α_(i_k)`, `E_β = T_(i₁)⋯T_(i_(k−1))E_(α_(i_k))` |
| 3.1 toral basis | Lentner2014 515–518 (Def. 3.6), 549–566 (Thm 3.8) | `k[Λ/2Λ_R] ⊗ ⊗ᵢ ⊕_r K^(r)_(αᵢ)`: simple-coroot binomials only, as the README's "for the simple-coroot directions" says; the full-`Y` basis is the roadmap's extension |
| 4.1, 4.2 | no text cited | R03; rank-one instance recomputed below |
| 5.1 order data | McGerty2006 335–339; Lentner2014 192–196 (Def. 2.3) | `lᵢ` least with `lᵢ(i·i) ∈ 2ℓℤ` = `L/gcd(L, dᵢ)` = Lentner's `𝓁/gcd(𝓁, 2dᵢ)` (checked for `𝓁` odd and even); conditions (1), (2) as quoted |
| 5.2 odd Frobenius | GrosKaneda2013 57–84 (§1.3–1.4, p. 2–3); Lentner2014 1102–1105 | `E^(n) ↦ X^(n/l)` or `0`, `K^(±1) ↦ 1`; splittings `Fr′^±` on the nilpotent halves only [15, 8.6]; Lusztig Thm 8.10 "`𝓁` odd, for `G₂` not divisible by 3" |
| 5.3 modified algebra | McGerty2006 109–172 (p. 3–4), 176 (Def. 2.4), 186, 208–212 (Thm 2.6), 278–291 (Thm 2.9), 292 (Rmk 2.10), 307–312 (Lemma 2.11) | Lemma 2.2's same-root relation with `1_(−ζ)` and `a + b − ⟨α̌ᵢ, ζ⟩` is the README's `⟨λ, hᵢ⟩ + a + b` at `λ = −ζ`; Theorem 2.6 is for `R` over `A_ℓ` (R01); target parameters `(−1)^(ℓ dᵢ)` = `ζ^(dᵢ ℓᵢ²)` |
| 5.4 half-algebra sequences | Lentner2014 106–114 (Thm 5.4 table), 1116–1137 (Thm 6.1 table), 1162 | `B_n`/`C_n`/`F₄` at `𝓁 = 4`: kernels `A₁^(×n)`, `D_n`, `D₄`, quotients `C_n`, `B_n`, `F₄` (braided "yes" for `F₄`); `G₂` at `𝓁 = 3, 6`: `A₂ → G₂`, braided for `𝓁 = 6`; `G₂` at `𝓁 = 4`: `A₃`; trivial cases `𝓁 = 1, 2`: kernel `0` |
| 6.1 | no text cited beyond Layer 5 | R03 |
| 7.1, 7.2 contraction | GrosKaneda2013 1842–1874 (6.7, Lemma 6.8, p. 23–24) | `(V ⊗ M^Fr)^φ ≃ V^φ ⊗ M ≃ (M^Fr ⊗ V)^φ` for `V` integrable type 1, `M` finitely generated with weights; the displayed computation uses only the coproduct of `E^(rl)` on weight vectors, as the README says |
| 8.1, 8.2 quantum plane | no text cited | R03; identities recomputed below |

**Adversarial table** (values computed in this review; `q = 2`, `d = 1` unless stated; `ζ₃` a primitive cube root, `ζ₃² + ζ₃ + 1 = 0`):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.3 `quantumLucas`, exact in `ℤ[v]/Φ_N(v)` | `l = 1..7`, `N ∈ {l (odd), 2l}`, `m ∈ [−16, 16]`, `r ∈ [0, 16]` | 6171 instances: `specialize ζ (signedGaussian m r)` versus `ζ^e · [m₀ choose r₀]_ζ · Ring.choose m₁ r₁` with Euclidean `m₁, m₀, r₁, r₀` | all equal; no change |
| 0.3 Lucas algebra for `m ≥ 0` | symbolic | with `[m choose r]_v = v^(−r(m−r))(m choose r)_(v²)` and q-Lucas at `q = ζ²`: exponent `−l[r₁(m₁−r₁)l + r₁m₀ + r₀m₁ − 2r₁r₀]`; README's exponent differs by `2l·m₁r₀ + l²r₁(r₁+1) + 2l·r₁r₀ ≡ 0 mod 2l` | agrees |
| 0.3 Checks | `(l, m, r) = (3, −3, 3)`, `(2, 3, 2)` at `ζ = i`, `(1, 2, 1)` at `ζ = −1`, `(5, 5, 1)` | `−1 = ζ⁰·1·binom(−1,1)`; `[3]_i = −1 = i^10`; `[2]_(−1) = −2 = (−1)³·2`; `[5]_(ζ₅) = 0` | all four hold |
| 0.3 signed product formula | `m ∈ [−8, 8]`, `r ≤ 7`, `v = 2` | `signedGaussian m r` = `∏_(j≤r)[m−j+1]/[j]` on every instance; `[−2 choose 1] = −5/2 = −(v + v⁻¹)` | holds |
| 0.3 signed Vandermonde | `m, m′ ∈ [−6, 6]`, `r ≤ 6`, `v = 2` | `[m+m′ choose r]` = `Σ_(a+b=r) v^(m′a−mb)[m choose a][m′ choose b]` on every instance; e.g. `m = −1, m′ = 1, r = 1`: `0 = −v + v` | holds |
| 0.3 `gaussian 4 2` | `v = 2` | `357/16` = `v⁴ + v² + 2 + v⁻² + v⁻⁴` | holds |
| 0.2 `qInt`, `qFactorial` | `q = 2, r = 3`; `q = 1`; `q = i` | `21/4`, `105/8`; `qInt 1 1 = 0` (Lean `0/0`), so `hfac` at `n = 1` forces `qᵢ² ≠ 1` and every denominator `qᵢ − qᵢ⁻¹` in `Relation.commutator` is nonzero; `[2]_i = 0` | boundary excluded by `hfac` |
| 0.1 `braidLength` | `aᵢⱼaⱼᵢ = 0,1,2,3,4` | `2,3,4,6,6`; the `4` case is excluded by `hm` in `braid_relation` | junk value harmless |
| 0.1 `reflect` | `A₁` adjoint `ϖ`; wrong model `y + ⟨α,y⟩h` on `h` | `ϖ ↦ ϖ − ϖ·2… = −ϖ`; `h ↦ 3h` | Check discriminates |
| 1.1 `serreE` | `aᵢⱼ = 0`; `B₂` `a₁₂ = −2` | `EⱼEᵢ − EᵢEⱼ`; `[3]!·Serre` has coefficients `1, −[3], [3], −1` | agrees with Check |
| 1.2 `Δ(Eᵢ^(2))`, `Δ(Fᵢ^(2))` | `n = 2` | middle terms `(1+q²)EK⊗E = q[2]EK⊗E`, `(1+q²)F⊗FK⁻¹` | coefficient `q^(1·1)` as displayed |
| 1.2 antipode squares | `E², F²` | `S(E)² = K⁻¹EK⁻¹E = q²K⁻²E²`; `S(F)² = q⁻²F²K²` | `(−1)^n q^(±n(n−1))` as displayed |
| 1.2 normalized `e, f` | `e = K⁻¹E`, `f = FK` | `Δ(e) = e⊗K⁻¹ + 1⊗e`; `Δ(f) = f⊗1 + K⊗f` | as displayed |
| 1.4 pairing recursion | `p(E², F²)` both ways | `(1 + v⁻²)c²` via `r₋(F²) = F²⊗1 + (1+v⁻²)F⊗F + 1⊗F²`; `v⁻²(1+v²)c²` via `r₊(E²)` | both rules agree with the Check |
| 1.5 `b` consistency | `B₂`, `d = (1,2)` | `⟨α₁, 2h₂⟩ = 2a₂₁ = −2 = a₁₂ = ⟨α₂, h₁⟩` | consistent |
| 2.1 README `Tᵢ` versus Lusztig | `A₂`, `n = 1, 2` | `T′_(i,1)(Eⱼ) = (−qᵢ)^n T″_(i,−1)(Eⱼ)`; README `= (−1)^n T″_(i,−1)(Eⱼ) = qᵢ^(−n)T′_(i,1)(Eⱼ)`; `T′_(i,1)(qᵢ²Eᵢ) = −FᵢKᵢ` | R04 |
| 2.1 braid relation transfers under `Ad(Kᵢ)` | `A₂`; `B₂` `d = (1,2)` | `Σ` for `(1,2,1)`: `h₁ + (h₁+h₂) + h₂ = 2h₁+2h₂`; for `(2,1,2)`: same. `B₂` `(1,2,1,2)`: `h₁ + (2h₁+2h₂) + (h₁+2h₂) + 2h₂ = 4h₁+6h₂`; `(2,1,2,1)`: `2h₂ + (h₁+2h₂) + (2h₁+2h₂) + h₁ = 4h₁+6h₂` | symmetric, relation holds |
| 2.1 rank-one Check | `T(E) = −FK`, `T(F) = −K⁻¹E` | `[T(E), T(F)] = FE − K⁻¹EFK = FE − EF = (K⁻¹ − K)/(q−q⁻¹) = T(RHS)`; `K⁻¹(−FK)K = −q²FK = q²T(E)` | holds |
| 2.1 `Tᵢ(Kⱼ)` | `B₂` | `K_(s₁(2h₂)) = K_(2h₂ + 2h₁) = K₂K₁²`; transposed entry would give `K₂K₁` | Check discriminates |
| 2.2 straightening | `A₂`, word `121` | `E₂E₁ − qE₁E₂ = q(q⁻¹E₂E₁ − E₁E₂) = qE_(α₁+α₂)`; `E_(α₁+α₂)E₁ − q⁻¹E₁E_(α₁+α₂) = q⁻¹[2]·Serre` | R05 (factor `[2]`) |
| 3.1 toral binomial | weight `n`, `m = 1`; `v = 1` | `[K;0 choose 1] ↦ [n]_v ↦ n` | holds |
| 3.3 Check | `⟨ν,y⟩ = −1`, `m = 2` | `binom(−1, 2) = (−1)(−2)/2 = 1` | holds |
| 4.1/4.2 rank one | `λ = 2ω`, basis `b₀, b₁ = Fb₀, b₂ = F^(2)b₀` | `Eb₁ = [2]b₀`; at `v = 1`: `F, E` matrices `(1,2)`, `(2,1)` on both lattices, `Φ = I₃`; monomial comparison `diag(1, 2, 1)`, determinant `2` | agrees with Checks |
| 4.2 route | symbolic | f.d. module generated by a weight-`λ` highest vector is a quotient of `M(λ)`, indecomposable, hence simple under Weyl's theorem, hence `L(λ)`; `V₁(λ)` torsion-free embeds | route sound; locator missing (R03) |
| 5.1 `ℓᵢ` | `G₂ L = 3`; `B₂ L = 2`; `G₂ L = 2`; `A₁ d = 2, L = 2` | `(3,1)`, `A* = [[2,−1],[−3,2]]`, `d* = (9,3)`, `−9 = −9`; `(2,1)`; `(2,2)`; `ℓ₁ = 1`, `ζ₁* = ζ² = −1` | all Checks hold |
| 5.1 `a*ᵢⱼ` integral in general | symbolic | `a*ᵢⱼ = gcd(L,dᵢ)/gcd(L,dⱼ) · aᵢⱼ`; `gcd(L,dⱼ) ∣ dᵢaᵢⱼ` and `gcd(L, dᵢaᵢⱼ) ∣ gcd(L,dᵢ)·aᵢⱼ` | holds |
| 5.1 ratio bullet | `B₂`, `d = (2,4)`, `L = 4` | ratio `2 ≠ gcd(4,4) = 4` | R05 |
| 5.1 Lusztig's conditions | `G₂ L=3`, `B₂ L=2`, `G₂ L=2`, `G₂ L=9` | fail at `(2,1)`: `1 < 2`; fail `1 < 2`; fail `2 < 4` at `(1,2)`; hold (`3 ≥ 2`, `9 ≥ 4`) | README's three; fourth is R01 |
| 5.2 `Fr([Kᵢ;0 choose L]) = Hᵢ` | weight `Lν`, `l = L` odd | `[L⟨ν,h⟩ choose L]_(ζᵢ) = ζᵢ^((⟨ν,h⟩+1)L²)·[0 choose 0]·binom(⟨ν,h⟩, 1) = ⟨ν,h⟩` | holds |
| 5.3 target parameters | `v` of order `2ℓ`, `ℓᵢ = ℓ` | McGerty `φ(v♯ᵢ) = (−1)^(ℓdᵢ)` (line 326); README `ζ^(dᵢℓ²) = (v^ℓ)^(ℓdᵢ) = (−1)^(ℓdᵢ)` | agree |
| 5.3 same-root relation | `λ = −ζ` in McGerty's notation | `a + b − ⟨α̌ᵢ, ζ⟩ = a + b + ⟨λ, hᵢ⟩`; idempotent `1_(−ζ+(a+b−t)αᵢ) = 1_(λ+(a+b−t)αᵢ)`; Lusztig's `E^(a)F^(b)1_μ = Σ[a−b+⟨μ,h⟩ choose t]…` at `μ = λ + bα` gives the same | agree |
| 5.3 even-order obstruction | `A₂`, `ζ^L = −1` | `KᵢEⱼ^(L)Kᵢ⁻¹ = ζ^(−L)Eⱼ^(L) = −Eⱼ^(L)` versus `Fr(Kᵢ) = 1` | Check holds |
| 5.4 uncovered orders, normalized | `d ∈ {1,2}`, `L` even; `G₂`, `3 ∣ L` | conditions reduce to `L/2 ≥ 2`, resp. `L/3 ≥ 2`; uncovered `L = 2` (`𝓁 = 4`), `L = 3` (`𝓁 = 3, 6`) | agrees for `v` of order `2L`; `v` of odd order `L`, `3 ∣ L ≥ 9` uncovered (R01) |
| 5.4 non-normalized | `B₂`, `d = (2,4)`, `ζ²` of order `4` | `ℓ = (2,1)`; 5.2 no (even), 5.3 no (`gcd = 2`, condition fails), 5.4 excluded by line 854 | R01 |
| 6.1 Check | `A₁`, `L = 3`, weight `3ω` | `[3 choose 3]_ζ = 1`, `K = ζ³ = 1` | holds |
| 6.2 Check | `λ = 4ω = ω + 3ω` | `2·2 = 4`; `dim Δ_ζ(4ω) = 5` | holds |
| 7.2 antipode sign | `S(E^(Lm))` on weight `Lν`, `L` odd | `(−1)^(Lm) = (−1)^m`; `ζᵢ^(Lm(Lm−1)) = 1`; `Kᵢ^(−Lm)` acts by `ζ^(−dᵢL²m⟨ν,h⟩) = 1` | holds |
| 8.1 module algebra | `E(y²)`, `E(xy − vyx)`, `F(xy − vyx)`, opposite rule | `xy + v⁻¹yx = [2]yx`; `vx² − v·x² = 0`; `vy² − vy² = 0`; `x² − v²x² ≠ 0` | Checks hold |
| 8.2 monomial and Weyl actions | `E^(r)wⱼ`, `F^(r)bⱼ` | `[j choose r]w_(j−r)`; `[j+r choose r]b_(j+r)`; `E^(r)bⱼ = [n−j+r choose r]b_(j−r)` | standard `sl₂` formulas |
| 8.2 `C_n` equivariance | `F^(r)` | `[n choose j][n−j choose r] = [n choose j+r][j+r choose r]` (both `[n]!/([j]![r]![n−j−r]!)`) | holds |
| 8.2 `C_L` at `ζ_L` | `L = 3` | diagonal `[3 choose j]_ζ = 1, 0, 0, 1`; `[K;0 choose 3]` on `w₀, w₃`: `[3 choose 3] = 1`, `[−3 choose 3] = −1` | Checks hold |
| 8.2 exact sequences | `L = 3` | ranks `2 → 4 → 2` twice; `Fb₀ = b₁ ≠ 0`, `Ew₁ = w₀ ≠ 0` | nonsplit as stated |
| Lean `signedGaussian` | `Int.negSucc a` | `m = −(a+1)`, `(−1)^r[(a+1)+r−1 choose r] = (−1)^r gaussian (a+r) r` | matches README |
| Lean `braidWord` | `n = 1, 2, 3` | `Tᵢ`, `Tᵢ∘Tⱼ`, `Tᵢ∘Tⱼ∘Tᵢ` (`trans` applies the right factor first) | matches "`n` factors" |

## Not verifiable

- Lusztig1993 (uncertified by the manifest): Chapters 34, 35, 37, 39, 41 and §§23.2, 31.1.3 are cited by locator only; the braid-operator normalization of Chapter 37 (R04) is quoted from the reviewer's knowledge of 37.1.3, not from the text, and the hypothesis of Chapter 35 on the order of `v` versus `v²` (R01 repair (a)) could not be read.
- Lusztig, *Quantum groups at roots of 1* (1990), Theorem 8.10 and 8.6: cited through GrosKaneda2013 lines 66–67, 84 and Lentner2014 line 1102; not in the manifest and not fetched (the review edits no manifest).
- The standard locators proposed in R03 (Andersen–Polo–Wen 1991; Lusztig, Contemp. Math. 82 (1989)) were not fetched; they are suggestions for the author, who should record them as `uncertified` if no legal text is found.
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep`/`show` (ArithmeticStatisticsPartIV read that way).

## Source issues

- **Misprint** in McGerty2006 at Lemma 2.2, printed p. 4 (lines 165–166): the two same-root commutation relations carry the index `j` on the left-hand `F^(b)` and `E^(b)` while their right-hand sides use `i`; it should be `i` on both sides; affects nothing (the roadmap states them with `i = j`).
