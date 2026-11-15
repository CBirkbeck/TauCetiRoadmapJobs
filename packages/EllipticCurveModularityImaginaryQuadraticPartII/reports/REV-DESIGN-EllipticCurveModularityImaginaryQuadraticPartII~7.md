<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6894987700 -->
Review (claude) of f2a7bbb

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §6.1, second Check: the impossibility claim is too strong

   **Location:** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:1014–1016`: “every CM extension has isomorphic completions above `v` and `v^c` …, so `P'^c ∩ S' = ∅` could not be reached by preparation”.

   **Claim:** if `ρ` ramifies at both `v` and `v^c`, no CM extension reaches `P'^c ∩ S' = ∅` with `P'` still protected.

   **Witness:** let `ρ(I_{v^c})` have order 3. A CM `F' = F·F'⁺` with completion of ramification index 3 above `v̄` makes `ρ` unramified above `v^c`, and above `v` the index 3 is prime to 5, so protection survives (§3.3, third API bullet).

   **Repair:** replace the Check by: “If `ρ(I_{v^c})` has order divisible by five (for instance `ρ̄` protected at `v^c` too), a CM extension `F' = F·F'⁺` has the same completion above `v` and `v^c`, so making `ρ` unramified above `v^c` forces ramification index divisible by five above `v` and residual inertia `U^(5k) = 1` there: `P'^c ∩ S' = ∅` cannot be reached with `P'` protected. The preparation used here keeps `P ∪ P^c` completely split, so it needs `ρ` and `π` unramified at `v^c`.” Tested: order 3 is no longer claimed impossible; order 5 gives `U⁵ = 1` (README §3.3, fourth Check).

2. **F02** (P3) §8.1 *Needs* omits what the `ζ₅ ∈ K` branch uses

   **Location:** `design/README.md:1257–1262`: “base change `π_{A_t}` to `F = K(μ₃ₚ)` … to realize `V_η` as in Theorem 2.1(c)”; *Needs:* “Theorems 2.1–2.5 and 7.5; PotentialAutomorphyInfrastructure §2.3”. Also `design/plan.json`, target `8.1`, `prerequisites`.

   **Claim:** the listed needs cover the route.

   **Witness:** Theorem 2.1 assumes `ζ₅ ∉ K` (README line 392), so for `K = ℚ(ζ₅)` it is not applicable; its part (c) argument is re-run and uses Theorem 1.1 (`F` is CM) and FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3 (irreducibility on `G_F`), neither listed.

   **Repair:** add “Theorem 1.1; FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3” to the *Needs* line of §8.1 and `target:1.1`, `roadmap:FaltingsFinitenessAndIsogenyTheorems R28.6.2`, `… R28.6.3` to the plan's `8.1` prerequisites (or state Theorem 2.1(c) for every CM `K` with `A_t` modular and non-CM, and cite it). Tested on `K = ℚ(ζ₅)`: with the added items every step of the second branch has a listed input.

3. **F03** (P3) Letters with two meanings inside Layer 7

   **Location:** `design/README.md:1085` “`E/k: y² = h(x)`” against line 1095 “Tate parameter is `c s³ h(s)` with `c ≠ 0` and `h(0) = 1`” (again line 1124); line 1085 “`k` be a number field” and line 1120 “`v(Δ_min(A_t)) = 3k_v`, for a fixed integer `k_v`” against line 870 “characters `k_v× → O×`”.

   **Claim:** each symbol denotes one object.

   **Witness:** for `E: y² = x³ + x + 1` (README line 1234) the cubic has `h(0) = 1` by accident; for `y² = x³ − x`, `h(0) = 0`, contradicting “`h(0) = 1`” if read as the cubic. `k_v` is a residue field in §5.2 and an integer in §7.2. The same clash is in CaptainSude26 line 528.

   **Repair:** write the unit series as `u(s)` with `u(0) = 1` in §§7.1–7.2, the valuation as `m_v` (“`v(Δ_min(A_t)) = 3m_v`, `5 ∤ m_v`”; first Check of §7.2 unchanged in content), and the base field of §7.1 as `K` (as §7.2 already does). Tested: with `u`, the statement no longer constrains the cubic `x³ − x`.

4. **F04** (P3) A dangling reference and one manifest field

   **Location:** `design/README.md:1319–1320`: “Lemma A.5, p. 86 (line 3979), replaced in this case by Lemma 4.2's route”; `packages/EllipticCurveModularityImaginaryQuadraticPartII/sources.toml`, entry `LeHung26`, `cited_for`.

   **Claim:** the reference names a result of this roadmap; the manifest lists where each work is cited.

   **Witness:** the roadmap has no Lemma 4.2; §4.2 is meant (README line 768), while CaptainSude26's Theorem 4.2 (line 410) is the lifting theorem, a different result. README line 333 cites LeHung26 Lemma 5.1 in §1.1, but `cited_for` has no `"1.1"`.

   **Repair:** write “replaced in this case by §4.2”; add `"1.1"` to `cited_for` of `LeHung26`.

Both findings of round 6 are repaired. No P1 or P2 finding. Four P3 findings (R01–R04), each with a repair, so the verdict asks for changes. The declared supplier gap `acc-torsion-inertial-comparison` is precise, minimal and declared in both files; it is not a finding. This is a design: there is no `Suggested.lean`, and this lane does not elaborate.

## Verified sound

### Round-6 findings

- **R01 (source-following sentence): repaired.** `design/README.md:93–96` now reads “CaptainSude26, an unrefereed pseudonymous manuscript, is cited for the protected local condition, … LeHung26, a discussion draft, is cited for making the auxiliary curve modular …; the parent cites OpenAI26.” No remaining sentence says a layer follows a source (searched `follow`: four hits, all mathematical; “How to read the build”, lines 304–314, describes layers by content). `plan.json` `summary` likewise.
- **R02 (Taylor–Wiles places and `P^c`): repaired.** §5.2 (line 871): “a Taylor–Wiles datum `Q` from §4.2 with `Q ∩ (S ∪ S^c) = ∅`”; §5.3 (lines 897–898, 910–915): “Since `P^c ∩ S = ∅` and `Q ∩ S^c = ∅`, no place of `P^c` lies in `S ∪ Q`, so `K^P(Q)` is hyperspecial on `P^c`”; §5.4 (lines 946–947): “forbidden set `B = S^c`”; new Check, lines 930–936; plan targets 5.2 and 5.3 carry the hypothesis and the test `hecke_Q_meets_Pc`. §4.2 is unchanged and general. Pattern search: the only other uses of Taylor–Wiles sets are §4.3 (no level claim) and §5.4 (repaired). CaptainSude26 lines 301–302 and 307–314 support the repaired text.

### Adversarial table (computed; `scratch/calc/c.py`, `scratch/calc/d.py` and by hand)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §5.3 repaired: no place of `P^c` in `S ∪ Q` | `v ∈ P`; `v^c ∈ S`? `v^c ∈ Q`? | `P^c ∩ S = ∅` (§5.1); `v^c ∈ Q ⇒ v^c ∈ Q ∩ S^c`, excluded | true with the new hypothesis |
| §5.3 repaired: conjugates of `R ∪ P ∪ Q` outside it are outside `S ∪ Q` | `u ∈ R`: `u^c ∈ S₅` / `P` / `Q`; `w ∈ Q`: `w^c ∈ S` | `u^c ∤ 5`; `u^c ∈ P ⇒ u ∈ P^c ∩ S = ∅`; `u^c ∈ Q ⇒ Q ∩ S^c ≠ ∅`; `w^c ∈ S ⇒ w ∈ S^c` | true; `S_aux ∖ (R_aux^c ∖ R_aux) = S ∪ Q` as CaptainSude26 line 311 |
| §5.3 new Check | `q_w = 11`, `diag(2,3)`, `𝔽₅[ε]` | `11 ≡ 1`; `det = 6 ≡ 1`; `2 ≠ 3`; Iwahori index `12`, diamond kernel `60`; `(1+ε)¹¹ = 1+ε`; `det diag(1+ε,1−ε) = 1` | Check correct |
| §5.3 ACC conditions outside `S_aux` | prime `l` below `S ∪ Q`; `l` ramified in `F` | splits in an imaginary quadratic subfield by §5.1(i) and §4.2 | ACC23 lines 2317–2320 met |
| §2.1 | `K₆₀`: fixer `{1,29} ⊂ (ℤ/60)ˣ` | `29² = 841 ≡ 1`; `29 ≡ 1 mod 4`, `≡ −1 mod 15`, `≡ 4 mod 5`, `≡ 2 mod 3`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)`; (c) does not use `ζ₅ ∉ F` |
| §1.2 (used by 2.1, 7.5) | `1 ⊕ 1` over `𝔽₃`; `ℚ ⊂ ℚ(ζ₃)` | at `2`: ratio `1 ≠ 2`; split primes of `ℚ(ζ₃)` are `≡ 1 mod 3`, ratio `1 = q` | descent true, converse false, as stated; definition is CN23 line 1235–1239 (ratio `≠ ℓ` only) |
| §2.3 | `q = 4, a = 4`; `z = i`; `ℚ(ζ₈)` | `T² − 4T + 4 = (T−2)²`, roots `/√4 = 1, 1`; `diag(i, −i)`: trace 0, det 1; `[K⁺:ℚ] = 2` complex places | shift `s − 1/2` and parameter consistent |
| §2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`: sum; `ℚ(√−3) ⊄ ℚ(ζ₈)`: induction, `Gal(KM/K)` acts on `M` nontrivially, so `θ^σ ≠ θ` at infinity | both branches occur |
| §2.5 | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)` | `ζ₅ ∈ K`: no, no, yes | first two covered, third excluded |
| §3.1 | `X = [[a,b],[c,−a]]` | `UX − XU = [[c,−2a],[0,−c]]`, `UᵀX − XUᵀ = [[−b,0],[2a,b]]`; char 2: `1 ∈ ad⁰` fixed; `diag(2,3)`: `2·3⁻¹ = 4`, `3·2⁻¹ = 4` | invariants `0` iff `2 ∈ kˣ` |
| §3.2 (used by 4.1) | `D = Ad(U)` at `p = 3, 5, 7` | norm `Σ D^i`: `p=3` rank 1 (`f ↦ e`), `p=5` zero, `p=7` zero; `D^p = 1` in all three | as the Checks say |
| §3.3 third Check | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅` | `M³ = 1`; `ΦMΦ⁻¹ = [[4,1],[4,0]] = M²`; `Φ² = 1` | correct |
| §3.4 | `ρ(φ) = [[qδ,z],[0,δ]]`; `(1+εf)U`, `(1+εh)U` | `q·((q+1)δ)² = (1+q)²·qδ²`; `11·12² = 1584`; traces `2+ε`, `2`; `det(Ne₂, e₂) = b`, a unit | equivalences and Frobenius relation hold; three free parameters `a, b−1, z−[z̄]` |
| §3.5 (used by 4.2, 4.3) | `M^(I_v)`, `q ≡ 1`, `q ≡ 2 mod 5` | `(D−1)(αh+βf) = −2αe + β(h−e)`, kernel `ke`; `φ` scales `e` by `q`; cocycles `3+1`, coboundaries `2` | `h⁰ ∈ {1,0}`, `h¹ = 2`, `dim L_v = 3 − (3 − h⁰)` |
| §4.2 | `diag(2,3)` on `ad⁰`; framing `P` | eigenvalues `(4,1,4)`, coinvariants of dimension 1; inflated class is a coboundary on `⟨g⟩`, `g` of order prime to 5 | detection works; second Check correct |
| §4.3 (changed context) | `(d,t,r) = (2,1,6)`, `(2,3,10)`, `(40,10,111)` | `g = 0, 6, 0`; `dim = 8, 20, 111` against `10, 22, 151` | deficit `d` each time; independent of `B` |
| §5.1 | five-adic local degrees, multiples of 4, `≥ 8` | enumeration: no admissible tuple for `d ≤ 36`; `d = 40`: only `(8,8,8,8,8)`; `(8,8,24)`: `8 < 20` at the large place | Checks correct; “smallest configuration” is forced |
| §5.2 | `d = 40`, `t = 10`, `R = ∅`; `Q = ∅` | `1 + 10·(3+8) = 111 = 1 + 3t + 2d`; `Δ_∅ = 1` | correct |
| §5.4 | same | `g = r − 111`; `r = 111`: `dim R_∞ = 111`, `dim S_∞ = 151` | deficit `40 = l₀` |
| §6.1 second Check | `ρ(I_{v^c})` of order 3; of order 5 | index-3 completion: unramified above `v^c`, protected above `v`; order 5: `U⁵ = 1` | R01 |
| §6.2 | `⟨SL₂(𝔽₅), μh⟩ ⊂ GL₂(𝔽₂₅)`, `μ² = 2`, `h = diag(1,2)` | order `240`, determinants `{1,4}`, scalars `2`, projective order `120`; `(μh)² = diag(2,3)`; `det(2g) = 4·(−1) = 1` | first Check correct; `ζ₅ ∈ F` is a real hypothesis. In the protected case image is `SL₂(𝔽₅)`: an index-2 subgroup of a perfect group does not exist |
| §7.2 | `v(s) = 1, 5, 7` | `v(Δ_min) = 3, 15, 21`, residues `3, 0, 1 mod 5` | protection lost exactly at `5 ∣ v(s)` |
| §7.3 | split, non-split, good | inertia `[[1,3],[0,1]]` for `v(q) = 3`, trivial for `15`; twist changes Frobenius diagonal to `−1`, inertia unchanged | correct; Frobenius entry `b ∈ 𝔽₅`, so a tame-lift change removes it |
| §7.4 | `Σ = ∅`; `w` split | parent's `switch_five` (no `ζ₅ ∉ F` hypothesis there); `L_{w'} = F_w` | kept variant differs by `Σ` only |
| §7.5 | `[[1,3],[0,1]]`, `[[1,0],[3,1]]` over `𝔽₅` | generated group of order `120`; one transvection: order `5` | image `SL₂(𝔽₅)` when `μ₅ ⊂ K`; `v ≠ v^c` since `q` splits completely |
| §8.1 | `ℚ(ζ₅)`, `K₆₀`, `ℚ(i, √5)` | `ζ₅ ∈ K`: yes, no, no (`(ℤ/2)²` against `ℤ/4`); `K₆₀(μ₅) = ℚ(ζ₆₀)` | branches exhaustive; R02 on the *Needs* line |
| CN23 Lemma 5.6.5 control | `⟨[[0,1],[6,0]], [[2,3],[3,5]], [[4,2],[0,1]]⟩ ⊂ GL₂(𝔽₇)` | order `24`, determinants `{1,2,4}`, `(5.6.1)` holds, determinant kernel of order `8` nonabelian | see Source issues; not used at `p = 5` with `ζ₅ ∈ F` |

Rows of round 6 with computed values were relied on for the targets no repair touched and outside the sample (1.1, 1.3, 2.2, 4.1, 7.1); 1.1's argument and Checks were read again and hold (`{1,9,13,17}` cyclic of order 4; `ι` central, nontrivial on `E ⊇ K`).

### Sources: the seeded sample

No locator is flagged unverified by the author. All eight manifest texts were read in the sources cache; nothing was fetched and nothing is missing.

| Target | Checked at |
|---|---|
| 2.1 | LeHung26 lines 336, 342–355 (§4.5(1), §4.6, Remark 4.2); CN23 line 4513 (Theorem 6.1, p. 87, `ζ₅ ∉ F` for the base). Supported. |
| 2.3 | OpenAI26 lines 1192–1199 and 1216–1225 (§9.4, pp. 27–28); CN23 lines 4545–4555 (Lemma 6.1.3, p. 88, any CM field). Supported. |
| 2.4 | OpenAI26 lines 1200–1215 (states `M = K`; the roadmap's `M ⊆ K` is its own generalisation, argued); LeHung26 lines 364–366; CaptainSude26 lines 676–683. Supported. |
| 2.5 | LeHung26 lines 86–88 (Theorem 1.1, p. 2, conditional on geometric inputs the parent supplies), 342–360. Supported. |
| 3.1 | CaptainSude26 lines 187–193 (Lemma 3.1, p. 4: the action of `Ad(U)`). The invariant statement is the roadmap's own, proved in the text. |
| 3.4 | CaptainSude26 lines 184–220 (scalar Frobenius, `μ₅ ⊂ F_v`); the roadmap's general protected case is argued in §3.4 and checked above. |
| 4.2 | CaptainSude26 lines 242–263 (Lemma 3.4, pp. 5–6); AKT23 lines 3979–3986 (Lemma A.5, p. 86). Supported. |
| 5.1 | CaptainSude26 lines 264–289; CN23 lines 4226–4260 (pp. 81–82). Conditions (i)–(vii) match. |
| 5.2 | CaptainSude26 lines 285–289, 301–302 (Taylor–Wiles places outside `S ∪ S^c`). Supported. |
| 6.2 | CN23 lines 3849–3872 (Theorem 5.2, pp. 73–74), 4562–4572 (Lemma 6.1.4); CaptainSude26 lines 264–498, `μ₅ ⊂ F` at 267. Theorem 4.2 there is the prepared case; the general statement is §6.1 plus descent. |
| 7.2 | CaptainSude26 lines 520–532 (p. 11). Supported. |
| 7.3 | CaptainSude26 lines 533–536. Supported. |
| 7.4 | CaptainSude26 lines 538–603; CN23 line 4574 (Proposition 6.1.5, p. 88); CHT08 line 5723 (Lemma 4.1.2). Supported. |
| 7.5 | CaptainSude26 lines 120–125, 604–609. Supported. |
| 8.1 | CaptainSude26 lines 26–33, 671–683; LeHung26 lines 125–128. Supported. |

Also read: MilneCM lines 273–295 (p. 10) for 1.1; ACC23 lines 2309–2355 (pp. 57–58) against the gap text; LeHung26 lines 308–321 for 1.2.

### Library, suppliers, order

- Pins: Mathlib `1b1ccf4b…`, Tau Ceti `2fd255d9…` (`lake-manifest.json`). Opened: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `isConj_complexConj` (:148), `ofCMExtension` (:510), `of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:564, needs some `n ∈ S`, `2 < n`); `NumberField.isTotallyComplex_of_algebra` (`…/InfinitePlace/TotallyRealComplex.lean:229`); `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`); `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, hypotheses `a ≠ 0`, `a² ≠ 1`, satisfiable iff `#k ≥ 4`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`…/GroupCohomology/FiniteCyclic.lean:114`); `Representation.linHom` (`Mathlib/RepresentationTheory/Basic.lean:655`); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`); `tateDualityPairing_perfect_mixed` (`…/Local/Duality/Perfect.lean`). All exist.
- Headlines: Theorems 2.5, 6.2, 8.1. A search of both pinned libraries for automorphic representations, Weil–Deligne representations, potentially semistable representations and Hodge–Tate weights returns nothing, so none is statable; the README's *Lean* paragraph names all three and what each lacks. No `Suggested.lean`, so no padding probe and no `#check` pass apply. Elaboration: not available (this lane does not elaborate).
- The README attributes no backticked Lean name to this roadmap. The four leads of `scratch/citations.md` are source keys read as roadmap names and `ResidualImage.adZeroRep`, which ArithmeticGaloisRepresentations §7.9 defines (its README line 5249): no defect.
- Supplier sections resolved now, at the open heads or on main: all 25 parent sections (headings or bold paragraph titles `4.2`, `4.4`, `5.3`, `6.3`, `6.6`, `7.2`, `7.4`, `8.3`, `8.5`) and all 41 parent names cited; CrystallineLocalGlobalCompatibilityCM §§7.5, 8.1–8.7, 9.1, 9.3–9.12 (§9.1 clauses (5)–(15), §8.7 with `ζ_p ∈ F`, §9.3 count `q − 3[F⁺:ℚ] − 1 + |S|`, §9.11 read); PotentialAutomorphyInfrastructure §§2.1, 2.3 (CM or totally real, soluble, both directions), 2.5; AutomorphicGaloisRepresentationsPartII AG2.0, AG2.5, AG2.7 (`IsDecomposedGenericPrime`, `decomposedGenericPrime_local`; genericity excludes ratio `q` only); AutomorphicGaloisRepresentations §3.13; AbelianSchemesAndArithmeticModuli A6; PotentialModularityAndCompatibleSystems §§2.12–2.16; GL2ModularityLifting §1.7; GL2AutomorphicRepresentationsAndTransfer R16.3.2, R17.4.16; GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1, 5.5, 5.6; LocalGaloisDeformationRings §§1.10, 2.3, 2.5, 2.6, 2.8, 2.15, 2.16, 2.21, 3.14, 4.14, 4.15, 6.6; DeformationAndDerivedPatchingAlgebra §§8.1–8.5; ArithmeticGaloisDuality R02.2, R02.4.2; ArithmeticGaloisRepresentations Layer 1, §§4.3, 6.3, 7.2, 7.7, 7.9; FaltingsFinitenessAndIsogenyTheorems R28.6.2–3; NeronModelsAndSemistableAbelianVarieties §§3.1, 3.12, 5.1; EllipticCurves Layers 4–5, ClassFieldTheory Layers 5 and 11, SchemeAndStackFoundations §§4.13, 4.18, Chebotarev Layer 10 (main). No drift. Consumers ModularityAndLanglandsExtensions §§2.29–2.30 and BianchiModularForms resolve and are not suppliers.
- Gap `acc-torsion-inertial-comparison`: same slug in `plan.json` (`gaps`, prerequisite of 5.3) and README (“Supplier obligations”, §5.3); supplier AutomorphicGaloisRepresentationsPartII AG2.5; its hypotheses and conclusion match ACC23 lines 2309–2355; AG2.5 at its head has no torsion statement (PotentialAutomorphyInfrastructure cites AG2.5 for it, its README line 210), so it asks for nothing already provided. Precise and minimal.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2245 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

Searched the open heads and main by object: protected or unipotent-inertia conditions, width-three degeneration, the two manuscripts' keys, CM-ness of intermediate cyclotomic fields, ACC Theorem 3.1.1. No other roadmap states the Layer 3–7 constructions or Theorem 1.1. ModularityAndLanglandsExtensions §2.29 consumes the parent's `switch_five` unchanged; §7.4 here differs by the retained places `Σ` and says so. `scratch/overlaps.md`: no other pull request changes this roadmap, no cited id dropped, none defined only by a revision. The board index lists two packages (AnalyticNumberTheory, LawrenceVenkateshMethod), unrelated.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (no closest roadmap on main or by results is listed); nothing shared: the totally real roadmap owns the reflection descent and totally real endpoint, the parent the cover family and imaginary quadratic endpoint, the other three polarized, prepared-CM and dyadic lifting, all imported or disjoint.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1, 5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems with hypotheses and locators; 92 plan tests. No LaTeX delimiters, pull-request numbers, machine paths, target tables or algorithms. Layer order 3 → 4 → 5 → 6 → 7 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs 5.4; 7.5 needs 6.2; 8.1 needs 7.5); Layers 1–2 are independent of 3–7.

### Copyright and arrangement

Wording: 21 passages put beside their sources (the fifteen sampled targets and §§1.1, 1.2, 3.3, 3.5, 4.1, 4.3 and the gap text). None reproduces a sentence; shared material is formulae and hypothesis lists (CN23 §5.6 data, the `N = [[a,b],[−a²/b,−a]]` normal form). Arrangement: CaptainSude26 has sections 2 (congruence construction), 3 (local and finite-group lemmas with Taylor–Wiles primes), 4 (prepared lifting), 5 (auxiliary curve with preparation), 6 (proof). The roadmap puts §6's assembly first (Layer 2, with LeHung26), splits §3 into Layers 3 and 4 and moves the presentation out of §4's proof into Layer 4, separates a general preparation and lifting theorem (Layer 6) that the manuscript has only for elliptic curves inside §5, and adds Layer 1: not a one-to-one run. Reuse: no table, figure or data taken over.

Source independence: 21 passages compared with 7 sources, none shared; largest share CaptainSude26, 26 of 69 source citations; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and there is no Lean file at the design stage.
- The truth of the global lifting argument of CaptainSude26 (patching, Lemma 4.1's passage between Hecke algebras, lines 315–408) beyond its hypotheses, counts and local computations: no refereed source states it, and it is not re-proved here.
- CHT08 Lemma 4.1.2: the statement was located (line 5723); its printed page was taken from the extraction's page markers.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition (CN23 lines 1235–1239) excludes only ratio `ℓ`; affects nothing.
- **Error** in CN23 at Lemma 5.6.5, printed pp. 85–86 (lines 4442–4450): the source says the determinant kernel is reducible when the projective image is `A₄` and `d = 3`; it should except that case, where the kernel is a nonabelian group of order 8 (computed above in characteristic 7); affects a stated result.
- **Misprint** in CN23 at the end of the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous manuscript, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft); the parent on OpenAI26. No refereed source states these theorems; `sources.toml` records all three as unrefereed.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`); the README cites it by locator only. OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "f2a7bbb9be68367495b59da38d45284273611b88", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~7", "model": "fable", "worker": "chris-x79"} -->
