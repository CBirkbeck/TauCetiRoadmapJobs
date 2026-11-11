<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12941#issuecomment-6789660593 -->
Review (claude) of 86b96ea

Verdict: needs_changes

1. **F01** (P2) 2.1–2.3 use `Y^{[0,h],τ}(R)` and eigenbases over rings on which nothing defines them

   **Location.** `packages/LocalGaloisDeformationRingsPartII/README.md` line 247 (2.1): "Let `R` be a `p`-adically complete `𝒪`-flat `𝒪`-algebra that is either topologically of finite type or complete Noetherian local with residue field `𝔽` … For `𝔐 ∈ Y^{[0,h],τ}(R)`". Lines 263 and 277 (2.2, 2.3) inherit it.

   **Claim.** For `R` of either kind there is a category `Y^{[0,h],τ}(R)` with eigenbases `β`, matrices `A^(j)` and `N^(j′)_{𝔐,β}`.

   **Witness.** `R = 𝒪⟨T⟩` (not local). Line 180 (1.1) and line 77 (gap:rank-two-descent-kisin-modules) define `Y^{[0,h],τ}(R)` and eigenbases only for complete Noetherian local `R` with residue field `𝔽`; `BHHMS23 line 805` and `LLHL19 line 713` do the same.

   **Repair.** In 2.1, after the sentence ending "(BHHMS23, Proposition 3.1.7, p. 20, after Kisin06, Corollary 1.3.15).", insert:

   > For `R` of the second kind, `Y^{[0,h],τ}(R)` and its eigenbases are those of 1.1. For `R` of the first kind, `Y^{[0,h],τ}(R)` denotes the Kisin modules of height `≤ h` over `𝔖_{L′,R} = (W(k′) ⊗_{ℤ_p} R)⟦u′⟧` with tame descent data of type `τ` that gap:relative-monodromy-criterion takes as input, defined by the conditions of 1.1 with this `R`; such a module need not have an eigenbasis, and the statements of 2.1–2.3 about `N^(j′)_{𝔐,β}` and `A^(j)` concern those `𝔐` that have one. Layers 5–7 apply 2.1–2.3 only to rings of the second kind.

   Tested on the refuting instance: over `R = 𝒪⟨T⟩` the category is now named (modules over `(W(k′) ⊗ R)⟦u′⟧` with the descent data the gap takes as input), the derivation of 2.1 is asserted for all of them, and the matrix statements only where a basis `β` exists; over `R_j = 𝒪⟦x₁,…,x₈⟧` nothing changes.

2. **F02** (P3) the new non-gauge Check of 1.3 gives a wrong value at `f = 1`

   **Location.** README line 220 (1.3, Checks): "multiplying the first vector of `β̄` at the summand `j + 1` (and its translates by `f`) by `1 + v` … its entry `v²(1+v)^{−1}` or `v(1+v)^{−1}` is not a polynomial."

   **Claim.** For every `f`, the rescaled eigenbasis has a non-polynomial entry in `A^(j)`.

   **Witness.** `f = 1`, `s = 1`: the summands `j` and `j + 1` coincide, so by `LLHL19 line 765` the matrix is `I A φ(I)^{−1}`-twisted: `diag((1+v^p)/(1+v), 1) · diag(v², v) = diag((1+v)^{p−1}v², v)` over `𝔽`, a polynomial.

   **Repair.** In that Check replace "gives an eigenbasis whose `A^(j)` is … is not a polynomial." by:

   > gives, for `f ≥ 2`, an eigenbasis whose `A^(j)` is `diag((1+v)^{−1}, 1)` or `diag(1, (1+v)^{−1})` times `diag(v², v)`; its entry `v²(1+v)^{−1}` or `v(1+v)^{−1}` is not a polynomial. For `f = 1` the rescaled vector also enters through `φ*β̄`, and the change-of-eigenbasis formula (LLHL19, Proposition 3.2.9, pp. 20–21) multiplies on the right by the conjugate of `diag(1 + v^p, 1)`: for `s = 1` the matrix is `diag((1+v)^{p−1} v², v)`, a polynomial of degree `p + 1 > 2`, so the degree condition fails instead; for `s = w` the entry `v²(1+v)^{−1}` remains.

   Add "Proposition 3.2.9, pp. 20–21" to the `locator` of `LLHL19` in `sources.toml`. Tested on the refuting instance: `(1+v^p) = (1+v)^p` in characteristic `p`, so the entry is `(1+v)^{p−1}v²` of degree `p + 1`, above the bound `ν_{j,1} = 2`; the conclusion of the Check (the basis is not gauge, and over `R = 𝔽` nothing lifts it) stands for every `f`. The Check of 4.2 that refers to "the `1 + v` rescaling of 1.3" needs no change.

3. **F03** (P3) the `BHHMS23` manifest locator omits four cited remarks

   **Location.** `packages/LocalGaloisDeformationRingsPartII/sources.toml`, entry `BHHMS23`, `locator`: "… Remarks 2.3.5, 2.3.6, 4.2.5; …".

   **Claim.** The locator lists the numbered statements of BHHMS23 that the README cites.

   **Witness.** README line 157 cites Remark 2.4.5(iv), p. 17 (`BHHMS23 line 764`); line 180 cites Remarks 3.1.2–3.1.3 (`BHHMS23 lines 833–841`); line 299 cites Remark 3.2.2 (`BHHMS23 line 1014`). None is in the locator.

   **Repair.** Replace "Remarks 2.3.5, 2.3.6, 4.2.5" by "Remarks 2.3.5, 2.3.6, 2.4.5, 3.1.2, 3.1.3, 3.2.2, 4.2.5". Tested: a script that extracts every numbered BHHMS23 statement cited in the README then finds each one in the locator.

Three findings: one P2 and two P3. Two are in `README.md` and one is in `sources.toml`; `Suggested.lean` and `metadata.toml` need no change. Both findings of round 4 are repaired. R01 is a residue of the round-4 repair of 2.1 (the hypothesis was widened, the objects were not); R02 is a wrong value in a Check that the last repair added; R03 is a manifest locator.

## Round-4 findings

| Id | Status | Repaired passage (`packages/LocalGaloisDeformationRingsPartII/README.md`) |
| --- | --- | --- |
| F01 (P2), 1.3–1.4 fix an arbitrary residual eigenbasis | repaired | line 209: "Fix a residual module `𝔐̄` with a **residual gauge basis** `β̄`, that is, an eigenbasis of `𝔐̄` whose matrices `A^(j)` satisfy over `𝔽` the two conditions below"; line 225: "a gauge basis lifting the residual gauge basis `β̄` of 1.3 exists"; line 466: "which is a residual gauge basis in the sense of 1.3"; line 514: "with its monomial residual gauge basis" |
| F02 (P2), 2.1–2.3 stated only for rings topologically of finite type | repaired for the hypothesis, see R01 for the objects | line 247: "that is either topologically of finite type or complete Noetherian local with residue field `𝔽`"; line 69 (gap:relative-monodromy-criterion) carries the same words, and `design/plan.json` agrees word for word |

Pattern search. "residual eigenbasis" and "supplier's extension" occur nowhere in the README now. The repaired patterns were then looked for in the rest of the package: a statement whose ring class is wider than the class on which its objects are defined (found once: R01), and a Check whose value was computed for `f ≥ 2` only (found once: R02).

## Verified sound

**Principles.** Every statement keeps the full profile set `{(3,0),(2,1)}^f`, both the reducible and the irreducible `ρ̄`, and ramified `𝒪` (the `p` versus `ϖ` distinction is stated where it matters, 5.4 and 7.5). The base roadmap is imported by section. No copied passage, no algorithm, no sorried data, no `set_option`. The layers are named by their mathematics; their order is forced by the *Needs:* lines (1 needs 0; 2 needs 1; 4 needs 0, 1, 3; 5 needs 1–4; 6 needs 5; 7 needs 3–6).

**Elaboration.** `lake env lean` on `packages/LocalGaloisDeformationRingsPartII/Suggested.lean`, from the content checkout: one message, `47:8: warning: declaration uses 'sorry'`. Import header: `import Mathlib` only.

**Binder check.** `#check @crossing_prime` (worker's `signatures.md`, compared with README 5.3): `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n + 2)) O`, conclusion `Prime (X 0 * X 1 + C (ϖ ^ d) * ↑u)`. Same generality as 5.3 (`n + 2 ≥ 2` variables, any complete discrete valuation ring). Nothing changed.

**Padding probe** on the one sorried theorem, in a scratch copy elaborated the same way: `simp` leaves the goal, `rfl` fails, `infer_instance` fails ("type class instance expected"), `exact?` finds nothing, `aesop` fails; `UniqueFactorizationMonoid (MvPowerSeries (Fin (n + 2)) O)` is not an instance at the pins. Not padding.

**Headlines.** From the Summary: 6.1 (single-type presentation), 6.2 (`2^f` components), 6.3 (special fibres), 7.3 (multiple-type presentation, `4^f` components), 7.5 (`p ∈ (Q₁ ∩ Q₂) + P`), with 4.3, 3.6, 3.9 and 5.3 as the deep intermediate results. Only 5.3 is statable at the pins and it is stated; the module docstring names each of the others with the missing carrier. Checked at the pins: no file of Mathlib or Tau Ceti contains `DeformationRing`, `FramedDeformation`, `SerreWeight`, `KisinModule` or `EtalePhiModule`. The only backticked name of this roadmap's own is `crossing_prime`, declared in the file.

**Pinned declarations** (each elaborated with `#check` in one scratch file, and opened at its file):

- Mathlib: `MvPowerSeries.C`, `MvPowerSeries.X` (`RingTheory/MvPowerSeries/Basic.lean` 334, 374); `MvPowerSeries.isEmptyEquiv`, `MvPowerSeries.finSuccEquiv` (`RingTheory/MvPowerSeries/Equiv.lean` 54, 169; the latter is `MvPowerSeries (Fin (n + 1)) R ≃ₐ[R] PowerSeries (MvPowerSeries (Fin n) R)`); `IsRegularLocalRing`, `IsRegularLocalRing.of_ringEquiv` and the instance for a local principal ideal domain (`RingTheory/RegularLocalRing/Defs.lean` 52, 69, 80); `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod`, `PowerSeries.exists_isWeierstrassFactorization` (`RingTheory/PowerSeries/WeierstrassPreparation.lean` 561, 814; both need `IsAdicComplete (maximalIdeal A) A` and a nonzero reduction); `IsLocalRing.notMem_maximalIdeal`, `Ideal.span_le`, `Ideal.minimalPrimes`, `Matrix.det_fin_two`, `Matrix.adjugate`, `Polynomial.derivative`, `Field.absoluteGaloisGroup`, `modularCyclotomicCharacter`, `LaurentSeries`.
- Tau Ceti: `TauCeti.PowerSeries.isRegularLocalRing` (`RingTheory/RegularLocalRing/PowerSeries.lean` 157), `TauCeti.IsRegularLocalRing.uniqueFactorizationMonoid` (`RingTheory/RegularLocalRing/UniqueFactorization.lean` 59, hypothesis `ringKrullDim R ≤ 2`, as the README says), `TauCeti.inertiaTameCharacter`, `TauCeti.quotientWildInertiaSubgroupEquiv` (`NumberTheory/LocalField/Tame/Character.lean`).

All 20 exist with the stated meaning. `inferInstance : IsRegularLocalRing O` for a discrete valuation ring elaborates.

**Dependency check** (the brief's command):

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: PadicLocalLanglandsForGL2Qp 33, FiniteFlatGroupsAndIntegralPadicHodgeTheory 66, DeformationAndDerivedPatchingAlgebra 79, LocalGaloisDeformationRings 87, PurityForFlatCohomology 221, ModpRepresentationsOfGL2OverLocalFields 264, this roadmap 353; ClassFieldTheory and LocalFieldsRamification are on main.

**Supplier citations resolved now** (main and the open heads of the index of 2026-11-11; the board package for ModpRepresentationsOfGL2OverLocalFields).

- LocalFieldsRamification "Layer 4: the tame quotient of the absolute Galois group" (line 1154 on main, 1155 at its open revision; the heading is unchanged). It has no Kummer-tower statement, so the gap is not redundant.
- ClassFieldTheory "Layer 7: the absolute local Artin map, its normalizations, and conductors" (1205).
- PadicLocalLanglandsForGL2Qp §0.3 (268; its second half builds the fundamental characters at every niveau from the Kummer character, with Teichmüller lift, norm compatibility, `ω₁^{e_K} = ω|_{I_K}` and `q`-power conjugation; no Artin-map formula), §0.4 (292), §4.4 (1473).
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, .2, .5, .6, .24, .36, .39 (5483, 5559, 5684, 5715, 6528, 7307, 7412).
- LocalGaloisDeformationRings §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 (1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810). §6.9 is the `GL₃` construction over complete local `R` with `r ∈ {1,2,3}`, as line 76 says; §8.10 is the reducible case over `ℚ_p`, as line 78 says.
- ModpRepresentationsOfGL2OverLocalFields §§3.1, 3.2, 3.4, 5.5 (938, 963, 1008, 1373).
- DeformationAndDerivedPatchingAlgebra §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 4.6, 4.7, 6.8 (213, 233, 262, 282, 305, 325, 991, 1006, 1327). It contains no Hamann or power-invariance statement.
- PurityForFlatCohomology §7.4 (2299), with `isRegularLocalRing_uniqueFactorizationMonoid`.

**Gaps.** A script compared `design/plan.json` with the README's "must provide" lines: 9 and 9, same slugs, every `needs` word for word equal, every supplier a named roadmap with a section. Each `needs` is one statement with its hypotheses. The acceptance, once R01–R03 are applied, is conditional on the nine gaps.

**Ownership and overlaps.** `scratch/overlaps.md` lists no pull request changing this roadmap, no dropped id and no id only an open revision defines. Searched by object on main, at the 438 open heads and in the board's packages: `crossing_prime`, "gauge basis", "monomial étale", the ring `R□_{ρ̄|G_{K∞}}` and "cyclotomic free" (one hit, in StableHomotopyKTheoryPartII, about the cyclotomic free-loop spectrum, unrelated) have no other owner. No declaration of another `Suggested.lean` has the name `TauCetiRoadmap.LocalGaloisDeformationRingsPartII.crossing_prime`.

**Remark for the maintainer (no change here).** HilbertModularVarietiesAndShimuraCurvesPartII (open) cites this roadmap by `T.0–T.7` and declares on it the gaps `tame-types`, `single-type-rings` and `breuil-mezard-pbt` (its lines 14, 71–75), which are potentially Barsotti–Tate statements outside this roadmap's scope (README line 9). It also asks DeformationAndDerivedPatchingAlgebra for the same Hamann theorem under another slug (`power-series-cancellation`, its line 91). Both are points for that roadmap's review.

**Sources, seeded sample**, each read at its locator in the cached text.

| Target | Locator read | Result |
| --- | --- | --- |
| 0.2 | BHHMS23 Definition 2.3.3 (lines 653–659, pp. 14–15), Definition 2.3.4 (661–664, p. 15) | matches; `η` sits in the type input, as the README says |
| 0.3 | lines 668–674 (p. 15): orientation, Remark 2.3.6, equation (13) | matches |
| 0.4 | LLHL19 Proposition 2.2.16 (lines 508–512, p. 14); also Proposition 2.2.15 (491–494); BHHMS23 Remark 2.3.5 (665–667), §4.1 (1143–1147, p. 25) | matches: 2.2.16 at `n = 2` gives `d − 1` for `d ≥ 2`, and 2.2.15 gives it for `d ≥ 1` |
| 1.4 | BHHMS23 Proposition 3.1.5 (863–872, p. 19), lines 855–860; LLHL19 Proposition 3.2.22 (917–922, p. 25), Definition 3.2.23 (975–976, p. 26), lines 981–983 | matches: `(h+1)`-generic, periodic `ker(T(R) → T(𝔽))`, residual torus `T(𝔽)^f` |
| 2.2 | Definition 3.1.8 (913–917, p. 20) | matches |
| 3.4 | Definition 3.2.5 (1048–1052, p. 22); LLHL19 §3.1 (573–580) and Proposition 3.1.2 (596–599, p. 16) | matches |
| 3.6 | Proposition 3.2.7 and (19) (1075–1093, p. 23) | matches; the README's coefficient extension is needed (Source issues) |
| 3.8 | Lemma 3.2.8 (1097–1103, pp. 23–24); LLHLM18 Lemma 3.10 (1130, p. 29), Lemma 3.11 (1184, p. 30; the `H⁰` bijection at 1220), Proposition 3.12 (1223–1236, p. 31); LLHLM23 Lemma 7.2.10(1)–(3) (4806–4814, p. 107) | matches |
| 3.9 | Corollary 3.2.9 (1104–1116, p. 24) | matches, including the route through the tame quotient |
| 4.2 | Lemma 4.1.1 (1201–1215, pp. 25–26); line 1348 (p. 28) for the gauge basis; LLHL19 Remark 3.2.25 (984–989, p. 26) | matches |
| 4.3 | Lemma 4.1.2, (20)–(21) (1216–1284, pp. 26–27) | matches: `θ_Σ(ω)_j = t^(1,2)` when `ω_{f−1−j} = 0`; the count `2^f` for `P̃_σ[1/p]` |
| 5.3 | Lemma 3.3.1 (1118–1134, p. 24) | matches; the source proves irreducibility, the README adds primality with its own route |
| 5.6 | lines 1523–1536 (p. 32), equation (26); GHLS17 Theorem D (174–177, p. 4), Theorem 3.1.5 (1041–1043, p. 21) | matches |
| 5.8 | lines 1517–1558 (p. 32), Lemma 4.2.4 (1539–1554) | matches: `N ≥ 9` suffices for the automorphism |
| 7.3 | Proposition 4.3.1 and proof (1644–1897, pp. 34–38) | matches: variables at 1704–1711, tangent bound at 1764–1766, `p ∈ I_{w̃} + I_{w̃′}` at 1872–1887, dimensions at 1890–1893 |

Also read for the repaired passages: BHHMS23 lines 800–823 (p. 18), 878–971 (pp. 20–21), 1345–1417 (pp. 28–29), Table 1 (1955–2016, p. 41), the notes of Tables 4–5 (2247, 2324), lines 5068–5107 (pp. 101–102); LLHL19 Definition 3.2.8 and Proposition 3.2.9 (713–782, pp. 19–21); LLHLM18 §5.1 and Theorem 5.6 (1815–1844, p. 48), Proposition 5.11 and Theorem 5.12 (2068–2074, p. 53), Definition 3.8 and Proposition 3.9 (1114–1129, p. 29); Hamann75 Theorem 4 (line 101, p. 155). All eight cited works are in `sources.toml`; it has no local path. The author flagged no locator as unverified.

**Adversarial table** (values computed this round; rows cover the passages the last repair changed, the sampled targets, the headlines and the findings; for the unchanged Tables 2–5 transcriptions and the rows of 3.1–3.3, 5.5, 5.7 and 7.4 I rely on the computed rows of round 4).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.3 residual gauge basis against LLHL19 Definition 3.2.23 | the three shapes over `𝔽` | `t^(2,1)`: `X₁₂ = 0`, `X₂₁ = yv`, so `A = [[xv²,0],[yv²,zv]]`; `w t^(2,1)`: both ranges empty, `A` monomial; `t^(1,2)`: `X₁₂ = y`, `A = [[xv,yv],[0,zv²]]`. The README's conditions with the double coset give the same three sets (e.g. for `w t^(2,1)`: entries of `I w̃ I` lie in `v²`, val 1, val 2, `v²`, and the degree bounds `1,1,2,1` leave `[[0,d₁v],[d₂v²,0]]`) | definitions agree | none |
| 1.3 Check, normal form | `[[v²,0],[v,v]]` | `[[1,−v],[0,1]] · A · [[1,−1],[0,1]] = [[0,−v²],[v,0]]`, in `I · w t^(1,2) · I` | holds | none |
| 1.3 Check, `1 + v` rescaling | `f ≥ 2`; `f = 1, s = 1`; `f = 1, s = w` | `diag((1+v)^{−1},1)·diag(v²,v)`; `diag((1+v)^{p−1}v², v)`, polynomial of degree `p + 1`; `diag((1+v)^{−1}v², (1+v^p)v)` | stated value false at `f = 1`, `s = 1` | R02 |
| 1.4 at `R = 𝔽` and `𝔽[ε]` | ambiguity groups | trivial with `β̄` fixed; `T(𝔽)^f` without; `(1+ε𝔽)²` per embedding, dimension `2f` | consistent with 5.7 | none |
| 2.1 ring classes | `𝒪⟦x⟧`; `𝒪⟨T⟩`; `𝒪_{E′}` with residue field `𝔽′ ⊋ 𝔽` | second kind only; first kind only, not local; first kind only | 1.1 and line 77 define `Y^{[0,h],τ}` on none of the last two | R01 |
| 2.1 Check, `𝒪^rig_R` | `Σ p^{−i}(u′)^i` at `n = 1, 2` | exponents `c + i − i` bounded below; `c + ⌊i/2⌋ − i → −∞` | in level 1, not in the limit | none |
| 2.1 Frobenius rule | `u′e`, trivial module | `−p(u′)^pλ` and `−E(u′)^pφ(λ)`, equal by `λ = (E/p)φ(λ)` | holds | none |
| 2.2 | `h = 1`; `h = 3` | order 0: no condition; value and first derivative | holds | none |
| 0.2 | `N = 12`; `p = 23` | `12 < d < p − 12` needs `p ≥ 26`, so `p ≥ 29`; `12 < d < 11` empty | holds | none |
| 0.3 | `f = 1`, `s = w`, `p = 5`, `μ = (1,0)` | `s′_or = (w, 1)`; `α′ = ((2,0),(0,2))`; `a′^(0) = (2,10)`, `a′^(1) = (10,2)`; `w(2,10) = (10,2)` dominant; `s′_{or,1} = s_τ s′_{or,0} = w·w = 1` | holds | none |
| 0.4 | LLHL19 2.2.16 at `n = 2`, `d = 13`; `d = 1` | `d − n + 1 = 12`; outside 2.2.16, covered by the definition (and by 2.2.15) | holds | none |
| 3.4 / 3.5 | rank one, `φ = α`; `λ = (c,…,c)`; `f = 2`, `λ = (c, c^{−1})` | Frobenius acts by `α`; `nr(c^f)`; trivial twist | holds | none |
| 3.6 | `s′ = 1`, `μ′ = (a,a)`, `𝔽 = 𝔽_p` | `ω^a ⊗ U` with `U` unramified irreducible over `𝔽` is semisimple with that inertia and is no `V(w̃,D)` over `𝔽`; it is one over the quadratic extension | coefficient extension needed and present | none |
| 3.7 | 2-deep digits; `ω ⊕ 1` at `p ≥ 5`; `p = 7`, `ω³ ⊕ 1` | `|δ_i ∓ 1| ∈ [2, p−2]`, sum nonzero and `≤ (p−2)(p^{f′}−1)/(p−1) < p^{f′}−1`; root coordinates `1` and `p − 2`, so depth 0 and 1, not 2; `ω³` of order 2 against `ω` of order 6 | holds; depth 2 sharp | none |
| 3.8 | `ρ₁ = ρ₂ = 1`; `W = ω`, `K = ℚ_p` | `𝔽` on both sides; the Kummer cocycle of `−p` is nonzero on `G_K` and zero on `G_{K∞}` | hypothesis needed and present | none |
| 3.9 | `ρ₂` with another semisimplification | both sets empty, by the tame-quotient step | holds | none |
| 3.10 | `Γ = ℤ_p`, `n = 1`; `T ↦ T²` | terms `𝒪[T]/((1+T)^{p^m} − 1)`, limit `𝒪⟦T⟧`; tangent map zero, image `𝒪⟦T²⟧ ∌ T` | (ii) and (iv) consistent | none |
| 4.1 depth | `μ(τ)_j + η = (r_j,0)`, `(r_j+1,−1)` | coordinates `r_j`, `r_j + 2`, both in `(N−1, p−N+1)` | `(N−1)`-deep | none |
| 4.2 | `D w t^(2,1)` | `[[0,d₁v],[d₂v²,0]]`: pivots of degree `1 = ν₂`, `2 = ν₁`, zero diagonal within bound 1 | gauge | none |
| 4.3 | `f = 1`; `f = 2` | `θ(0) = U₃`, `θ(η) = U₁`; `θ(σ)_0` read from `ω_1`; `|X(σ)| = 4` | matches (21) | none |
| 5.2 chart 1 against Table 1 | the five generators | `d₁₁ + (a−2)c₁₂d₂₁/d₂₂*`, `c₂₂ − (a−1)c₁₂d₂₁/e₁₁*`, `c₂₁ + (a−1)(a−2)c₁₂d₂₁²/(a e₁₁* d₂₂*)`, `c₁₁ − …`, `c₁₂((a−1)(a−2)x − 2p)`: identical to lines 1996–2007 without tails | matches | none |
| 5.2 chart 2, `G₅` | `κ = (a−2)(a+1)/(a(a−1))` | `(t+p)(t/κ + p) = κ^{−1}(xy+p)(xy+κp)`; `κ − 1 = −2/(a(a−1))` | holds | none |
| 5.3 / `crossing_prime` | `d = 0`; `u = x₁`; `u₁ = 1`, `u₂ = 1 + x₁x₂` | unit; `x₁(x₂ + ϖ^d)` reducible; difference `ϖx₁x₂`, and `x₁x₂ + ϖ` divides none of `ϖ`, `x₁`, `x₂` | hypotheses needed and present; converse fails as the Check says | none |
| 5.4 identity | expanded by hand in `s = xy` | `κ·LHS`: `s³` terms cancel; `s²p[(κ+1)² + (κ−1)² − 2κ² − 2] = 0`; `sp²(κ+1)[2κ + (κ−1)² − κ² − 1] = 0`; constant `κ(κ−1)²p³` | `LHS = p³(κ−1)²` | none |
| 5.6 | `λ_j = (3,0)`, `(2,1)` | `λ_j − (1,0) = (2,0)`, `(1,1)`: the middle summand `(a+1,b+1)` of `L(a,b) ⊗ L(2,0)` and `det` | matches (26) | none |
| 5.8 | `ψ(X_i) = X_i + p^{N−8}ε_i`, `N = 9` | identity modulo `(𝔪², p)` | automorphism | none |
| 6.1–6.3 | `f = 1`; `f = 3`; `m ≤ f` | 2 components of relative dimension 5; 8 of dimension 7; `f + 4 + m − m = f + 4` | holds | none |
| 7.3 | tangent bound; dimensions | `p k_j ≤ k_{j−1} + r_j + 3 < k_{j−1} + p − 1` gives `max k_j < 1`; `(f+4) + 2f = 3f + 4` | holds | none |
| 7.5 | elimination in Table 4 | `t + p = (1−κ)p = 2p/(a₂(a₂−1))`; `c₂₁ + (a₂−1)d₂₁* · 2p/(a₂(a₂−1)) = c₂₁ + (2p/a₂)d₂₁*`; bracket a unit for `p > 2`, `N ≥ 10` | holds | none |
| gaps | plan against README | 9 slugs, 9 equal `needs` strings | agree | none |

**Shape and style.** Every definition has its API and at least three Checks; every theorem has its hypotheses and a locator; every layer ends with Examples and Dependencies. No LaTeX delimiter, pull-request number, date, machine path, HTML anchor or process word in the README; `theorem` only, one module docstring, no `#eval`, no `set_option` in the Lean file.

## Not verifiable

- Kisin06, Corollary 1.3.15: recorded `uncertified`; it is cited behind BHHMS23 Proposition 3.1.7, which states the result used.
- LLHLM18, LLHL19 and LLHLM23 were read in their arXiv versions; their numbering was compared with the published versions only through BHHMS23's own citations.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at the heads of the index of 2026-11-11 and in the board's packages; nothing newer was looked at.

## Source issues

- **Gap** in BHHMS23 at §3.1.1 and Proposition 3.1.7, printed pages 18 and 20: Kisin modules with descent and eigenbases are defined over complete local coefficient rings, then used over algebras topologically of finite type; it should define them there too; affects a stated result.
- **Gap** in BHHMS23 at the proof of Proposition 4.2.1, printed pages 28–29: Proposition 3.1.9 is applied to a complete local ring, though stated for algebras topologically of finite type; it should state the complete local case or reduce to it; affects the proof.
- **Gap** in BHHMS23 at Proposition 3.2.7, printed page 23: the proof splits every semisimple representation with the given inertia along the orbits; it should assume the residue field large enough, since two equal inertial characters allow a non-split irreducible; affects a stated result.
- **Misprint** in BHHMS23 at Remark 2.3.5, printed page 15: the remark refers to the cited paper's Proposition 2.2.16 for the loss of one unit of depth in every rank; it should refer to Proposition 2.2.15, as page 25 does; affects nothing.
- **Misprint** in BHHMS23 at the final note of Table 5, printed page 45: the note refers to Tables 1–2 for the transported tails; it should refer to Tables 2–3, the charts of the two shapes of that table; affects nothing.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed page 102: the displayed bijection of types twists the weight by the norm of the determinant; it should use the inverse determinant, as the condition a few lines above does; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "86b96eaa179f30655767eab475608c81df1ec297", "job": "REV-PKG-LocalGaloisDeformationRingsPartII~5", "model": "fable", "worker": "chris-x17"} -->
