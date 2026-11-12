# Review of SchemeAndStackFoundations (pull request #1656 at 85395e0)

**Verdict:** needs changes

:robot: Independent AI review, an incremental re-review of the 62 lines changed in `TauCetiRoadmap/SchemeAndStackFoundations/README.md` since `31b1931`. `Suggested.lean` did not change. The §2.8 finding of the previous report (R02) is repaired, and the new route and Checks are correct. One P3 finding remains, carried from the previous report: the two generated description blocks are stale. Neither roadmap file needs an edit. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning.

## R01 (P3) — The two generated description blocks are still stale

**Location.** Pull-request description, `roadmap-summary` block: “The curve dichotomy drops quasi-compactness …” and “Quasi-compactness follows from the other curve hypotheses.” `merge-order` block: “#1276 (SchemeAndStackFoundations) → **this pull request** (#1656)” and “#1276 → **this pull request** → #1807 → #1808 → #1854”.

**Claim.** The summary says a hypothesis was dropped, but the head keeps it. The merge-order block lists a merged pull request as a predecessor.

**Witness.** `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:735` still has `[QuasiCompact (X ↘ Spec (.of k))]`. Commit `c20f72af` (#1276) is on `origin/main`. The description's own free text says the dichotomy “retains main's statement”.

**Repair.** Regenerate both blocks from this head. In `roadmap-summary`, replace the two sentences with: “The curve dichotomy retains main's statement; finite type is expressed by `LocallyOfFiniteType` together with `QuasiCompact`.” In `merge-order`, remove #1276 from both lines, leaving #1656 → #1807 → #1808 → #1854. No roadmap or Lean edit is needed.

## Previous findings

- R01 — not repaired: the description still reads “The curve dichotomy drops quasi-compactness” and “#1276 (SchemeAndStackFoundations) → **this pull request** (#1656)”, while `Suggested.lean:735` keeps `QuasiCompact`. Repeated as R01.
- R02 — repaired: “vanish in degrees different from `i`, and the augmentation is a quasi-isomorphism ([BCGP, Theorem 3.9.6] … its proof cites Kempf 1978, Theorem 10.9 …)”, followed by a depth route below `i` and an affine-strata induction above `i` (`README.md:4489–4522`). No new problem found.

## Verified sound

### Gate, dependency check, elaboration

- Folder diff `31b1931..85395e0`: `README.md` only, 53 insertions and 9 deletions; `Suggested.lean` is unchanged. No file changed outside the folder against `origin/main`, and the worktree is clean.
- Gate rerun, exit 0, every counter zero:

      gate SchemeAndStackFoundations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

  The worker's gate on this head also reports `build=0`.
- Dependency check (`--movable --pr 1656`), exit 0, with no UPWARD, CYCLE or `moved:` line:

      depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean`: exit 0, 48 warnings, all 48 “declaration uses `sorry`”.
- Carried from the previous report, because `Suggested.lean` is byte-identical: the `#check @name` binder audit (none lost a binder), the one-tactic padding probe (none of the 48 `sorry`s closes), the import list, and the headline list (11 stated; Keel–Mori, coherent duality, the Brauer class, Picard torsors, Schlessinger and GRR named as not statable). §2.8 has no Lean declaration, so the diff touches no Lean statement.

### The new §2.8 route, step by step (`README.md:4494–4522`)

1. *Below `i`.* `codim_X Z_i ≥ i` gives `dim O_(X,x) ≥ i` at every point of `Z_i`, so a maximal Cohen–Macaulay `F` has `depth F_x ≥ i` or `F_x = 0` there. Stacks 47.11.1 gives the pointwise vanishing, and Stacks 51.2.6 (1) with `I′ = A` passes it to `H^k_I(M)`: the source of `Ψ` is support in `V(A) = ∅`, hence zero, and `Ψ` is onto. The sequence `H^k_(Z_i) → H^k_(Z_i/Z_(i+1)) → H^(k+1)_(Z_(i+1))` then has both outer terms zero for `k < i`, the right one because `k + 1 < i + 1`.
2. *Above `i`.* The induction is well founded. The claim at `i`, on all Noetherian schemes with such a filtration, gives the vanishing of `H^m_(Z_i/Z_(i+1))` for `m ≥ i + 1` (through `R^(m−1) k_*` on `U_(i+1)`, where `m ≥ 2` holds because `i ≥ 1`; the case `i = 0` is direct). That vanishing and the claim at `i` on `X` give the claim at `i + 1`. The trace filtration on `U_(i+1)` has the same strata `S_p` for `p ≤ i`, each affine over `U_(i+1)` by base change, and its `j_i` is `k`. The exact sequence used is the long exact sequence of `Rj_(i+1,*)` applied to `RΓ_(S_i)(F) → F → Rk_* F`, whose first term computes `H^m_(Z_i/Z_(i+1))(F)` because `j_(i+1,*)` preserves injectives.
3. *Quasi-isomorphism.* The graded pieces of the support filtration of an injective resolution are `Γ_(Z_p/Z_(p+1))` of its terms, so `E_1^(p,q) = H^(p+q)_(Z_p/Z_(p+1))(F)`. Concentration leaves the row `q = 0`, the spectral sequence degenerates at `E_2`, and the filtration is finite.
4. *Needs.* §2.6 (direct images along affine morphisms, filtered colimits) is what (3.9.8) rests on: a quasi-coherent sheaf on `U_(i+1)` supported on `S_i` is a filtered colimit of sheaves pushed forward from thickenings of `S_i`, which are affine over `X`. §2.7 owns the three named targets (`README.md:4419, 4428, 4443`). Both are earlier subsections of the same layer.

### Sources read at their locators (changed passages)

| Passage | Locator | Text read | Result |
|---|---|---|---|
| §2.8 quasi-isomorphism | BCGP Theorem 3.9.6, printed p. 64 | boxer-calegari-gee-pilloni-2021 lines 3111–3119 (page 64 marker at 3094) | matches: Noetherian, `codim ≥ i`, affine `Z_i ∖ Z_(i+1) → X`, maximal Cohen–Macaulay coherent; the proof cites Kempf's Theorem 10.9 and his p. 358 notion, described as the Cousin complex resolving the sheaf |
| §2.8 formula for `H^m_(Z_i/Z_(i+1))` | BCGP (3.9.8), p. 64 | lines 3122–3127 | matches, under the assumption that `Z_i ∖ Z_(i+1) → X` is affine |
| §2.8 `cousinComplex_acyclic` (unchanged, adjacent) | BCGP Remark 3.9.7, p. 64 | lines 3120–3121 | matches |
| §2.8 below `i` | Stacks 47.11.1 (0AVZ) | Stacks book extraction, line 192637 | Noetherian `A`, finite `M`, `IM ≠ M`: depth equals the first nonvanishing local cohomology degree |
| §2.8 below `i` | Stacks 51.2.6 (0DWV), part (1) | line 204151–204163 | `I ⊆ I′` in a Noetherian ring, any module; pointwise vanishing on `V(I) ∖ V(I′)` makes `Ψ` onto; `I′ = A` is allowed |
| §2.7 targets the route names | Stacks 51.2.1 (0A6T); 20.34.5 | lines 204068, 89412 | the affine comparison and the localization triangle, as §2.7 states them |

The seeded sample of this round (§§0.4, 0.23a, 1.1, 1.4, 1.6, 1.12, 1.20, 1.25, 2.3, 2.18, 3.1, 3.7, 4.2, 4.9, 5.12) has no target in the changed passage. The README flags no locator as unverified.

### Consumers and ownership

- AutomorphicBundlesPartII §5.10 cites §§2.6–2.8 for the Kempf resolution. The statement and its hypotheses are unchanged, so the consumer is unaffected.
- The diff adds no target, no definition and no cross-roadmap citation, so the duplication audit of the previous report carries over (`roadmaps grep` for “Cousin complex” found no second owner).
- Overlaps: #1807, #1808 and #1854 change this folder, and the description's free text states the order #1656 → #1807 → #1808 → #1854. No cited id is dropped, none is defined only by an open revision, and this pull request drops none.

### Adversarial table

The first four rows are computed for the changed passage. Rows marked “r89” were recomputed in the previous report (head `31b1931`), and rows marked “r88, via r89” were carried by it; this diff leaves all of their statements untouched.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| §2.8 `relativeSupportCohomology_concentration`, below `i` (route new) | DVR `R`, `Z_1` closed point; `k[x,y]_{(x,y)}`, `Z_1 = V(x)`, `Z_2 = {𝔪}`; `k[x,y]/(xy,y²)`, `Z_1` origin (not MCM); Stacks 51.2.6(1) with `I′ = A` | `H⁰_𝔪(R) = 0`, depth 1 ≥ 1. `H⁰_{Z_1}(R) = 0` (domain), `H^k_𝔪(R) = 0` for `k < 2`, so `H⁰_{Z_1/Z_2} = 0` from `H⁰_{Z_1} → H⁰_{Z_1/Z_2} → H¹_{Z_2}`. Depth 0 at origin: `H⁰_{Z_1}(O) = k·y ≠ 0`, excluded by MCM. `V(A) = ∅`, `H^k_{V(A)} = 0`, `Ψ` onto, so `H^k_I(M) = 0` | Pass |
| §2.8 same, above `i` (route new): `R^n j_{i,*}F = 0` for `n ≥ i`, and `H^m_{Z_i/Z_{i+1}} = 0` for `m > i` | `i = 0`; `i = 1`; `i = 2` on `k[x,y]_{(x,y)}`; `𝔸²`, `Z_1 = {0}` (stratum not affine); index bookkeeping | `U_0 = ∅`. `j_1 = (S_0 → X)` affine, `R^{≥1} = 0`. `U_2 = D(x) ∪ D(y)`: `H^n(U_2, O) = 0` for `n ≥ 2`, `H¹(U_2,O) ≠ 0` allowed (`1 < 2`). `R¹j_{1,*}O` has sections `⟨x^{−a}y^{−b}⟩ ≠ 0`: claim fails at `i = 1`, excluded. `m ≥ i+1 ≥ 2` for `i ≥ 1`, so `H^m_{S_i} = R^{m−1}k_*` applies and `m−1 ≥ i` matches the claim on `U_{i+1}`, whose `j_i` is `k` | Pass |
| §2.8 `kempf_cousin_resolution` (route new: filtration spectral sequence) | DVR; `𝔸¹ ⊇ V(t)`; `k[x,y]/(xy,y²)`; `𝔸²`, `Z_1 = {0}`; `Z_1 = ∅` | `E_1`: `K` at `(0,0)`, `K/R` at `(1,0)`, zero elsewhere; `E_2 = R` at `(0,0)`. `k[t,t⁻¹] → k[t,t⁻¹]/k[t]`, kernel `k[t]`. `E_1^{1,−1} = H⁰_{Z_1}(O) = k·y ≠ 0`: row `q = 0` is not all, kernel of augmentation `k·y`. `E_1^{0,1} = R¹j_*O ≠ 0` and `E_1^{1,1} = H²_0(O) ≠ 0` cancel, `Cous = (O → 0)` still resolves. Single column `p = 0`, `Cous = F` | Pass |
| §2.8 Checks (three new or extended) | values recomputed | `k[x,y]_{(x,y)}`: `(R/x)[1/y] = k(y)`, one point, affine over `Spec R`; preimages under `k` of `D(x)`, `D(y)` are `D(x)`, `D(xy)`. `𝔸²`: `j_*O = O`, `H¹_0(O) = 0`, `H¹(𝔸²∖0,O) = ⟨x^{−a}y^{−b}⟩_{a,b≥1}`. Embedded point: `O[1/x] = k[x,x⁻¹]` (`y = 0` after inverting `x`), `ann` of powers of `(x,y)` is `k·y` | Pass; no Check contradicts the theorem |
| §1.23 `keel_mori` (r89) | `B(ℤ/2)` over `k = k̄`; `[𝔸¹/𝔾_m]` | Coarse space `Spec k`, `π` proper and quasi-finite. Inertia `𝔾_m` at `0` is not finite, so excluded; its categorical space `Spec k` has two geometric orbits against one point | Pass; locators verified |
| §1.23 `finite_quotient_coarse` (r89) | `G = 1`; `ℤ/2` on `k[x]`, `x ↦ −x`, `char k ≠ 2`; `ℤ/2` on `𝔽₂[x]`, `x ↦ x+1`; `ℤ/2` acting trivially on `k`; `ℤ[i]` with conjugation, mod 2 | `A^G = A`. `A^G = k[x²]`, fibre over `a²` is `{a, −a}`, one point over `0`. `A^G = 𝔽₂[x²+x]`, fibre `{a, a+1}`. `[Spec k/(ℤ/2)] = B(ℤ/2)`, coarse `Spec k`. Invariants `ℤ`; mod 2 the action is trivial on `𝔽₂[ε]/(ε²)` (dimension 2) against `ℤ ⊗ 𝔽₂ = 𝔽₂`: consistent, since “uniform” means flat base change and `ℤ → 𝔽₂` is not flat | Pass |
| §1.23 `IsTame` (r89) | `B(ℤ/p)` and `Bμ_p` over `𝔽_p`; `B(ℤ/ℓ)`, `ℓ ≠ p`; wrong model `ρ = 𝟙_X` | `0 → 𝔽_p → J₂ → 𝔽_p → 0`: invariants `𝔽_p → 𝔽_p → 𝔽_p` with the last map zero, not surjective, `H¹ = 𝔽_p`: not tame. `μ_p`: `ℤ/p`-graded, degree 0 exact: tame. Maschke: tame. `(𝟙)_*` exact on all three; excluded since `ρ_*` lands in `QCoh(M)` | Pass |
| §3.4 `picard_units_sequence` (r89) | `𝔸¹`, `r = 1`; `r = 2`, `D_1 = D_2 = {0}`; `r = 0`; `ℙ¹`, `D = {0}, {∞}` | `k^× → k^× × t^ℤ → ℤ → 0 → 0` exact. Kernel `ℤ²` against image `{(n,n)}`, now excluded. Identities, exact. `tⁿ ↦ (n, −n)`; `ℤ² → Pic ℙ¹ = ℤ`, `(a,b) ↦ a+b`, kernel `{(a,−a)}` = image, onto `ℤ`, `Pic 𝔾_m = 0` | Pass |
| §0.2 `relativeSpec_modulesEquiv` (r88, via r89) | `S = Spec k`, `A = k[t]`, `F = O`; `A = O_S`; `G = 0` | `p^*p_*F = A ⊗_k A`, `t ⊗ 1 − 1 ⊗ t ≠ 0` in the kernel of multiplication; over `p^*A` gives `A`. Identity. `0 ↦ 0` | Pass |
| §0.11 `unramified_criteria` (r88, via r89) | `𝔽_p(t^{1/p})/𝔽_p(t)`; `k[ε]/k`; separable `L/K` | `Ω = L·dt^{1/p} ≠ 0`, inseparable: both false. `Ω = k·dε`, not reduced: false. `Ω = 0`, open diagonal: true | Pass |
| §0.11 `absoluteIntegralClosure` (r88, via r89) | `Spec k̄`; `Spec ℝ`; `Spec k[t]` | `Spec k̄`. `Spec ℂ ≇ Spec ℝ`. `t^{1/n}` integral, not in `k[t]` | Pass |
| §0.14 henselian characterisations (r88, via r89) | `(ℤ_p, p)`; `(ℤ_(3), 3)`; `I = 0`; `(ℤ_p ⊗ ℤ_p, p)` | Henselian. `T² − 7`: simple root `1` mod 3, no root in `ℚ`: not henselian. `Tⁿ(T−1)` root `1`: all five hold. `Spec` disconnected | Pass |
| §0.27 annihilator formulas (r88, via r89) | `ℤ → ℤ[1/2]`, `(4) ∩ (6)`; `k[x,y] → k[x]`; `ℤ/4 → ℤ/2`, `m = 2`; `ℤ → ℤ/2`, `f = 2`; `⊕ℤ/n` over `ℚ` | `(12) ↦ (3)`. `(xy) ↦ (x²) ≠ (x)`. `(2) ↦ 0` against `(1)`. `Ann = (2) ↦ 0` on both. `0` against `ℚ` | Pass |
| §0.30 normality, ramification (r88, via r89) | `k[t², t³]`; `x ↦ x²`, `char ≠ 2`; `y − x²`, `y² − x³` in `k[x,y]_{(x,y)}` | `t` integral, not in ring. `e = 2` at `0`, `e = 1` at `1`. `∉ 𝔪²` regular; `∈ 𝔪²`, `dim 𝔪/𝔪² = 2` | Pass |
| §1.3 `IsAlgebraicSpace` (r88, via r89) | `h_{Spec L}/Gal`, `L/K` quadratic; constant presheaf `{0,1}` | Two classes on `Spec L ⊔ Spec L`, one on each component: not a sheaf. `F(∅) = 2 ≠ 1` | Pass |
| §1.16 contracted product (r88, via r89) | `Spec L ×^{ℤ/2} Spec L`; `P ×^G pt`; frame torsor of `O(1)` | `(L ⊗ L)^G = K × K`, two `K`-points; presheaf quotient `∅`. `pt`. Degree `+1` | Pass |
| §1.20 points, properness (r88, via r89) | `B(ℤ/2)`; `B𝔾_m`; `ℂ[[t]]`, `K(√t)` | One point, `Spec k ×_{BG} Spec k = G` two points. Diagonal fibre `𝔾_m` not proper. `v(t) = 1` odd, no lift; after `t = u²` trivial | Pass |
| §2.20 dualising complex (r88, via r89) | `𝟙_S`; `ℙ¹_S`; `k[x,y]/(x,y)²`; nodal cubic; two planes in `𝔸⁴`; `ℙ²` | `O_S[0]`. `O(−2)[1]`. Socle 2-dimensional, not invertible. `deg ω = 0`. Depth 1 < 2. `h²(O(−3)) = 1 = h⁰(O)` | Pass |
| §3.4 `picard_excision_sequence` (r88, via r89) | `𝔸¹ ⊇ {0}`; cone `xy = z²` | `ℤ → 0 → 0 → 0`. `Pic = 0 → Cl = ℤ/2` injective, not onto | Pass |
| §3.4 `gradedPicardGroupoid` (r88, via r89) | `Spec(k × k)`, `f = (0,1)`; `𝔸¹_ℚ`, `f = δ_0` | Symmetry `(1, −1)`. Would need a unit `−1` at `0` and `1` generically: none | Pass |
| `lineBundleClass_spec_equiv_pic` (r88, via r89) | field; `R = 0`; `ℤ[√−5]` | Trivial; trivial; `ℤ/2` on both, class of `(2, 1+√−5)~` | Pass |
| §3.5 `lineBundleNorm` (r88, via r89) | `z ↦ z²` on `ℙ¹`; hyperelliptic `C → ℙ¹`; `𝟙` | `Norm π^*O(1) = O(2)`. `det π_*O = O(−g−1)`. Identity | Pass |
| §4.2 `C_Λ` (r88, via r89) | `ℤ/p²`; `ℤ_p`; `k[ε] ×_k k[ε]`; `k[x]/(x³) → k`; `k[x]/(x²) × k` | Artinian local. Not Artinian. `dim 𝔪/𝔪² = 2`. Kernel `(x)`, `x² ≠ 0`, not small. Two maximal ideals | Pass |
| `hodge_index` (r88, via r89) | `ℙ¹×ℙ¹`, `H = (1,1)`, `D = (1,−1)`; `H = (1,0)`; `H = (1,−1)`; `ℙ² ⊔ ℙ²`; blow-up, `H = 2L + E`, `D = L + 2E` | `H² = 2`, `D·H = 0`, `D² = −2`. `H² = 0` excluded. `H² = −2` excluded. Not integral, excluded. `H² = 3`, `D·H = 0`, `D² = −3` | Pass |
| §5.10 reduction, adjunction, RR, Noether (r88, via r89) | `E = (D·A)H − (H·A)D`; plane curve of degree `d`; `O(a,b)`; `ℙ²`, `ℙ¹×ℙ¹` | `E·A = 0`. `g = (d−1)(d−2)/2`. `ab + a + b + 1`. `12 = 9 + 3`, `12 = 8 + 4` | Pass |
| `weil_bound` (r88, via r89) | `ℙ¹/𝔽_q`; `y² + y = x³` over `𝔽₂` | `0 ≤ 0`. `|3 − 3| = 0 ≤ 2√2` | Pass |
| `exists_linear_normalization` (r88, via r89) | `n = 0`; `𝔽₂[X,Y]/(XY(X+Y))` | `d = 0`. Every `𝔽₂`-linear form divides the relation: excluded by `Infinite k` | Pass |
| Nagata/Japanese headlines (r88, via r89) | `k[[x,y]]`; a field; `ℤ` | Nagata; Japanese; G-ring and J-2, Nagata | Pass |
| `artinBootstrap` (r88, via r89) | `a = 𝟙_U`; `Spec L → h_{Spec K}` | `U` a space. `F = h_{Spec K}` | Pass |
| `Torsor.trivial_iff_section`, `torsorRepresentability` (r88, via r89) | `P = G`; `Spec ℂ` over `ℝ`, `ℤ/2` | Unit section. No `ℝ`-point, nontrivial | Pass |
| `grothendieck_existence`, `algebraize_hom` (r88, via r89) | `Spec A`; same-support ideal; `X = ∅` | `M = lim M_n`. Same completion. Unique empty map | Pass |
| `alteration_theorem`, `semistable_alteration_theorem` (r88, via r89) | `𝔸¹`, `Z = {0}`, `∅`, `X`; `ℤ_p[x,y]/(xy − p²)` | `ℙ¹`, `B = {0, ∞}`; `{∞}`; excluded by `Z ≠ ⊥`. One blow-up, `uv = p` | Pass |
| Azumaya headlines (r88, via r89) | `A = 0`, `R ≠ 0`; `R = 0`; `M_n(R)`; `ι = ∅` | Both false; both true; rank `n²`; `A = 0` | Pass |
| `noetherianSpace_vanishing`, `isAffine_of_H1_vanishing` (r88, via r89) | `∅`; `ℙ¹`; `𝔸² ∖ 0` | `⊥ ≤ d`. `H¹(O(−2)) = k`. `H¹(O)` infinite-dimensional | Pass |
| `flat_over_dedekind`, `genus_of_finite_etale`, `vectorBundleDegree_pullback`, `CH_coprod` (r88, via r89) | `k[t,x]/(tx)`, `(x², tx)`; `[n]` on `E`; `z ↦ z²`; `I = ∅` | Excluded, excluded. `0 = n²·0`. `2 = 2·1`. Zero cycles | Pass |
| Keel–Mori, duality, Brauer class, `Pic^d`, Schlessinger, GRR (r88, via r89) | pins, by object | No carrier in either pin; named in the docstring | Pass |

## Not verifiable

- `kempf-1978` (Theorem 10.9, p. 358; Lemma 8.5(e) and Theorem 9.6, which BCGP cites for (3.9.8)): the manifest records it as uncertified, so it is settled and was not requested. The README now cites Kempf only through BCGP's report of it, which was read (lines 3117–3126), and the degree concentration no longer rests on it.
- `hartshorne-1977` and Fulton 1998: as in the previous report; no changed passage cites them.

## Source issues

- none
