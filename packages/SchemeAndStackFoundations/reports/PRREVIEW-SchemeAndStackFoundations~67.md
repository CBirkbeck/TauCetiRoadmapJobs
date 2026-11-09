# Review of SchemeAndStackFoundations (pull request #1276 at ff215c5)

**Verdict:** needs changes

This is an incremental re-review of the 29 lines changed since 3cc1013: 20 in `README.md`, 9 in the module docstring of `Suggested.lean`, nothing outside the folder. The head repairs r64's R03 (five locators) and R04 (the §5.10 docstring bullet). It does not repair R01 (the manifest pins and the Tau Ceti definitions restated in `Suggested.lean`) or R02 (the description). The §0.17 repair leaves four bare line numbers that now resolve against the newly named file (R03 below).

One finding is blocking (P2): R01. Two are P3.

## R01 (P2) — The manifest still pins a Tau Ceti without the declarations the README and `Suggested.lean` cite, and `Suggested.lean` still restates seventeen Tau Ceti definitions and one theorem

Carried from r64 R01 (and r61 R01/R03). Not repaired.

**Location.**

- `lake-manifest.json` at ff215c5 pins Tau Ceti `358314d4` and Mathlib `f6090c70`. `README.md:419` and `:460` say "`1b1ccf4b`, the pin in `lake-manifest.json`" and "`2fd255d9`, the pin in `lake-manifest.json`". `origin/main` (33196b1) pins `2fd255d9`/`1b1ccf4b`, and `origin/main` is not an ancestor of this head.
- `Suggested.lean:75, 82, 126, 133, 155, 162, 168, 173, 268, 276, 281, 288, 554, 780, 785, 949, 1134, 1146, 1160` (the definitions in the table below) and `:692–707` (the Layer 3 degree strand). Since r64, each of these has moved down five lines.
- This head adds two more passages that are true only at `2fd255d9`. They are `Suggested.lean:46–48` ("Tau Ceti's `LineBundleClass.intersectionNumber` … `LineBundleClass.IsAmple`") and `README.md:7456–7458` ("Tau Ceti's `LineBundleClass.intersectionNumber`").

**Claim.** The README's pin sentences are false at this head. Every Tau Ceti citation added by the last four review rounds resolves at `2fd255d9` but not at the manifest's `358314d4`. This includes this head's two new mentions. `Suggested.lean` declares, under its own names, definitions that Tau Ceti builds at `2fd255d9`.

**Witness.** At `358314d4` the following do not exist: `TauCeti/AlgebraicGeometry/IntersectionNumber/`, `LineBundle/Ample.lean`, `RingTheory/Japanese.lean`, `AlgebraicGeometry/AlgebraicSpace/` and `AlgebraicGeometry/Chow/`. At `2fd255d9`, `Japanese.lean:125` is `class IsJapanese`, `AlgebraicSpace/Basic.lean:195` is `structure IsAlgebraicSpace`, `Chow/Basic.lean:295` is `def ChowGroup`, `IntersectionNumber/Basic.lean:111` is `def intersectionNumber` and `LineBundle/Ample.lean:71` is `structure IsAmple`.

**Repair.** This is unchanged from r64 R01; the merge of `origin/main` is a worker step and has no conflict in this folder's two files. After it:

1. Replace the definitions in the table with Tau Ceti's, open or import them as r64 R01 lists (eleven `TauCeti.*` imports), and restate the theorems that use them on Tau Ceti's carriers. `CH_coprod` takes `[∀ i, IsLocallyNoetherian (X i)] [IsLocallyNoetherian (∐ X)]`. The two `of_complete_local` theorems conclude `TauCeti.Ring.IsJapanese`/`TauCeti.Ring.IsNagata`. `IsJ2` uses `TauCeti.Excellence.regularLocus`.
2. In Layer 3, delete `Curve.isFiniteLocallyFreeOfRank`, `Curve.vectorBundleDegree` and `Curve.vectorBundleDegree_add_of_shortExact`. Restate `vectorBundleDegree_pullback` and `cohomologyDim_one_eq_zero_of_degree_gt` on `FiniteLocallyFreeSheaf.FixedRank.vectorBundleDegree` (`VectorBundle/Degree.lean:82`). In rank one, use `InvertibleSheaf.eulerDegree` (`LineBundle/Degree.lean:74`).
3. Change the README's *Lean:* lines in §0.5, §0.20, §0.21, §1.3, §2.17, §3.3, §4.1, §4.13 and §5.1 accordingly. The pin sentences at `:419`/`:460`, the §5.10 docstring bullet and the §5.11 Check become true at the merge.

| `Suggested.lean` declaration (line at ff215c5) | Tau Ceti at `2fd255d9`, under `TauCeti/` |
|---|---|
| `PseudoCoherence.IsPseudoCoherentModule` (75), `IsPseudoCoherentSheaf` (82) | `TauCeti.Huber.IsPseudoCoherentOver R M ⊤` (`Algebra/Module/PseudoCoherent/Basic.lean:89`), `AlgebraicGeometry.Scheme.Modules.IsPseudoCoherent` (`AlgebraicGeometry/Modules/PseudoCoherent/Basic.lean:81`) |
| `Ring.IsJapanese` (126), `Ring.IsNagata` (133) | `RingTheory/Japanese.lean:125`, `RingTheory/Nagata.lean:65` |
| `Excellence.GeometricallyRegular` (155), `RegularAlgebraMap` (162), `regularLocus` (168), `IsGRing` (173) | `RingTheory/RegularLocalRing/GeometricallyRegular.lean:70`, `RegularAlgebraMap.lean:54`, `Locus.lean:61`, `GRing.lean:57` |
| `SchemePresheaf` (268), `Spaces.RepresentableDiagonal` (276), `Spaces.EtaleAtlas` (281), `Spaces.IsAlgebraicSpace` (288) | `AlgebraicGeometry/AlgebraicSpace/Basic.lean:68, 74, 113, 195` |
| `Proetale.IsReplete` (554) | `CategoryTheory/Limits/Replete.lean:91` |
| `Formal.IsThickening` (780), `Formal.IsFirstOrderThickening` (785) | `AlgebraicGeometry/Morphisms/Thickening.lean:69, 147` |
| `Formal.IsRegular` (949) | `AlgebraicGeometry/Scheme/Regular/Scheme.lean:68` |
| `Chow.cyclesOfDimension` (1134), `Chow.RatEquiv` (1146), `Chow.ChowGroup` (1160) | `AlgebraicGeometry/Chow/Basic.lean:86, 257, 295` |
| `Curve.vectorBundleDegree` (697), `Curve.vectorBundleDegree_add_of_shortExact` (702) | `AlgebraicGeometry/VectorBundle/Degree.lean:82, 168` |

**Tested.** r64 elaborated a post-merge scratch copy on these carriers at main's pins: exit 0, 46 `sorry` warnings, no other diagnostic. At this head I opened the five witness lines above at `2fd255d9` and confirmed that each of the five paths is absent at `358314d4`.

## R02 (P3) — The pull-request description describes a §4.10A this head lacks and states no order with the four conflicting heads

Carried from r64 R02 (r54 R02, r57 R04, r61 R04). Not repaired.

**Location.** The pull-request description.

**Witness.** The description says "New section 4.10A … from a compatible polarized adic system" and "This README-only addition changes no Lean declarations". The head's README has no §4.10A: `grep '4\.10A'` finds nothing, and `### 4.10` at `README.md:5578` is Grothendieck existence. Against `origin/main`, the folder diff is `2 files changed, 2550 insertions(+), 3807 deletions(-)`, so `Suggested.lean` changes too. `scratch/overlaps.md` lists #1656, #1807, #1808 and #1854 as conflicting with this head in `README.md`; #1656, #1807 and #1808 also conflict in `Suggested.lean`.

**Repair.** Rewrite the description to say what the branch does against main: the README rewrite citing Tau Ceti's Layer 0–5 packages, the reduction of `Suggested.lean` to headline theorems, and henselization moved to Tau Ceti. Add one line per conflicting pull request saying which side rebases. No file change is needed.

**Tested.** A description that names #1656, #1807, #1808 and #1854 with an order, and mentions no §4.10A, matches this head.

## R03 (P3) — §0.17: after the repaired path, four bare line numbers point into `CohenMacaulay/Ring.lean`

This is a new finding in the changed passage. It is the same file-attribution slip that r64 R03 fixed in §0.5 and §0.29.

**Location.** `README.md:1289–1292`: "`TauCeti.Ring.isCohenMacaulay_iff_forall_satisfiesSerreS` (`TauCeti/RingTheory/CohenMacaulay/Ring.lean:59`), `satisfiesSerreS_one_iff` (`:144`; …), `SatisfiesSerreS.localization_self` (`:175`), `SatisfiesSerreR.mono` (`:211`) and `TauCeti.isReduced_iff_…` (`:258`; …)".

**Claim.** The README reads a bare `:N` as a line of the last file named, and §0.5 and §0.29 were repaired on that reading. Here the last file named is `CohenMacaulay/Ring.lean`, which has 138 lines.

**Witness.** At `2fd255d9`, `TauCeti/RingTheory/SerreCondition/Basic.lean:144` is `theorem satisfiesSerreS_one_iff`, `:175` is `SatisfiesSerreS.localization_self`, `:211` is `SatisfiesSerreR.mono` and `:258` is `isReduced_iff_satisfiesSerreR_zero_and_satisfiesSerreS_one` (namespace `TauCeti`, `:253`). `CohenMacaulay/Ring.lean` ends at line 138.

**Repair.** Write "and, in `SerreCondition/Basic.lean`," before `satisfiesSerreS_one_iff`, as §0.29 now does. Alternatively, move the `CohenMacaulay/Ring.lean:59` item after `(:258; …)`.

**Tested.** I printed each of the four lines of `SerreCondition/Basic.lean` at `2fd255d9`, and each opens the declaration named before it.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`, Mathlib `f6090c70`; `README.md:460` says "`2fd255d9`, the pin in `lake-manifest.json`"; `Suggested.lean:126` is still `def Ring.IsJapanese`, `:288` `def IsAlgebraicSpace`, `:1160` `def ChowGroup`.
- R02 — not repaired: the description still says "New section 4.10A …" and "This README-only addition changes no Lean declarations", and names no order with #1656, #1807, #1808, #1854.
- R03 — repaired: §0.5 "with, in `Basic.lean`, `finite` (`:127`)"; §0.17 "`TauCeti/RingTheory/CohenMacaulay/Ring.lean:59`"; §0.29 "and, in `Scheme/Characteristic.lean`, `SchemeCharP.iff_forall_natCast_eq_zero` (`:98`)"; §2.6 "`AlgebraicGeometry.Scheme.Hom.exists_subsingleton_cohomology_of_isAffine`" (twice); §2.9 "tag/0GN7". The §0.17 fix leaves four trailing locators wrong (R03 above).
- R04 — repaired: `Suggested.lean:46–53` "Tau Ceti's `LineBundleClass.intersectionNumber` pairs a line-bundle class with a scheme `C ⟶ S` … the pins have no pairing of two classes on `Pic(S)` … no numerical equivalence and no `Num S`". This is true at `2fd255d9`; it becomes true at the manifest's pin with R01.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** The worker's gate at ff215c5 reports every counter 0 (including `build=0`) and `OK`. My re-run of `gate … SchemeAndStackFoundations --base origin/main` on this head printed the same counters, all 0, and `OK`, exit 0.
- **Dependency check.** `gate --depcheck … --movable` prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The roadmap is on main and is not in `ORDER.txt`. The diff adds no supplier citation.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SchemeAndStackFoundations'` is empty.
- **Elaboration.** I ran `lake env lean` on `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean` from the worktree at the head's pins: exit 0, 46 "declaration uses `sorry`" warnings, no other diagnostic.
- **Signatures and padding.** The diff touches only the module docstring, so no declaration changed. `scratch/signatures.md` (119 entries, 0 dropped binders) and r64's padding probe (46 of 46 sorried declarations refuse one tactic) stand.

### The changed passages, checked at Tau Ceti `2fd255d9` (the pin the README names)

- **§0.5 (`README.md:745–751`).** At `Algebra/Module/PseudoCoherent/Basic.lean`, line 89 is `def IsPseudoCoherentOver`, 127 `theorem finite`, 217 `theorem finitePresentation (… ) (hm : 1 ≤ m)` and 391 `theorem of_isNoetherianRing [IsNoetherianRing R] [Module.Finite R M]`, all in `namespace TauCeti.Huber`/`IsPseudoCoherentOver` (`:74`, `:108`). `ChainComplex.lean:41` is `exists_quasiIso_single₀` (an 81-line file). `BaseChange.lean:42` is `baseChange`. `TwoOutOfThree.lean` lines 109, 125 and 143 are `extension`, `cokernel` and `kernel`. For module sheaves, `Modules/PseudoCoherent/Basic.lean` lines 81, 171, 201 and 229 and `FinitePresentation.lean` lines 69 and 81 open the named declarations.
- **§0.17 (`:1289`).** `CohenMacaulay/Ring.lean:59` is `theorem isCohenMacaulay_iff_forall_satisfiesSerreS [IsNoetherianRing R]` in `namespace TauCeti.Ring` (`:35`). The `SerreCondition/Basic.lean` lines are 85, 102, 112, 118, 199 (correctly attributed) and 144, 175, 211, 258 (R03).
- **§0.29 (`:1926–1931`).** In `Scheme/Characteristic.lean`, line 43 is `class SchemeCharP`, 64 `charP_sections … [Nonempty U]`, 78 `iff_of_iso`, 92 `iff_natCast_eq_zero`, 98 `iff_forall_natCast_eq_zero`, 103 `iff_affineOpens`, 112 `of_hom`, 117 `spec_iff_natCast_eq_zero`, 132 `iff_structureMap`, and 145–168 hold the empty-scheme, open, fibre-product and product instances. `Scheme/ToSpecZMod.lean:52` (a 60-line file) is `instance subsingleton_hom_spec_zmod`.
- **§2.6 (`:3474`, `:3518`).** `Cohomology/QuasiSeparated.lean` has `namespace AlgebraicGeometry.Scheme.Modules` from 69 to 177 and `namespace AlgebraicGeometry.Scheme.Hom` from 179 to 226. Line 186 is `exists_subsingleton_cohomology_of_isAffine (f) [QuasiCompact f] [QuasiSeparated f] [IsAffine S]`, with conclusion `∃ N, ∀ F [IsQuasicoherent] p, N ≤ p → Subsingleton (Cohomology F p)`, matching the README's "bounds `H^p(X, F)` … depending only on the qcqs map `f`". Line 198 is `exists_isZero_higherDirectImage … [CompactSpace S]`, matching "for quasi-compact `S`". The old→new sentence at `:3516–3518` matches the meaning of #1656's `QCoh.higherDirectImage_vanishing` (that head's `Suggested.lean:545`, over an affine base).
- **§2.9 (`:3637`).** In the cached Stacks descent chapter text, line 1199 is Lemma 35.8.8 with tag 0GN7. It says that `F ↦ F^a` from `QCoh(O_S)` to quasi-coherent modules on `(Sch/S)_τ` or `S_τ` is fully faithful for τ ∈ {Zariski, étale, smooth, syntomic, fppf}, on PDF p. 26. Line 1063 is the section tag 03DR. The proof (lines 1203–1212) is the adjunction `Hom_O(F^a, G^a) = Hom(F, f_* f^* G) = Hom(F, G)`, which is the README's "O-linear" comparison.
- **§5.11 Check (`:7455–7459`).** `IntersectionNumber/Basic.lean:111` is `def intersectionNumber (a : LineBundleClass X) : ℤ := eulerDegree k (pullback ι a)`, with `ι : C ⟶ X` and `[C.Over (Spec (.of k))]` (`:106`). That is one class against one map from a scheme over `k`, as the parenthesis says.
- **§5.10 docstring bullet (`Suggested.lean:46–53`).** `LineBundle/Ample.lean:71` is `structure IsAmple (a : LineBundleClass X)`. `Scheme.Modules.eulerCharBelow` (`Cohomology/EulerCharacteristic.lean:105`) takes `k`, then explicit `X`, then `M`, then `n`, so `eulerCharBelow k S _ 3` has the right argument order; truncation 3 keeps `H⁰`, `H¹` and `H²` on a surface. Neither Tau Ceti nor Mathlib at `1b1ccf4b` has a numerical-equivalence or intersection-pairing declaration (grep `NumericallyEquivalent`, `intersectionPairing`). `AlgebraicGeometry/Chow/` holds only `Basic.lean` and `ClosedImmersion.lean`, with no `c_1 ∩` and no degree of zero-cycles, so §5.9's pairing `deg(c_1(L) ∩ c_1(M) ∩ [S])`, the README's carrier for `hodge_index`, is absent as the bullet says.
  - The Euler-characteristic alternative is not defined at the pins, as the bullet says. It would take two short definitions: one through `LineBundleClass.lift` (`LineBundle/Class.lean:63`) with `Scheme.Modules.eulerCharBelow_congr` (`EulerCharacteristic.lean:150`), and the pairing itself. The README does not choose that carrier, so not stating `hodge_index` is consistent with the README.

### The seeded sample where it falls in the changed passages

- **0.17 (Depth, Cohen–Macaulay modules and Serre's conditions).** In the cached Stacks algebra chapter text, 031P is Definition 10.157.1 (line 20118: `depth M_p ≥ min(k, dim Supp M_p)` at every prime, as the README states). 031Q is Lemma 10.157.2 (line 20129: no embedded primes iff `(S_1)`). 031R is Lemma 10.157.3 (line 20145: reduced iff `(R_0)` and `(S_1)`), on pp. 428–429. In the more-algebra text, 064Q, 064T, 064V and 066E are Definition 15.66.1 and Lemmas 15.66.4, 15.66.6 and 15.66.17 (lines 7432, 7500, 7586, 7746), as §0.5 numbers them.
- **5.11 (The Weil bound via surfaces).** In Milne's *Algebraic Geometry*, Chapter 11 (the cached AG11.pdf text):
  - Definition 11.12 (transversality) is at line 326, p. 9.
  - Theorem 11.53 (Castelnuovo–Severi), Corollary 11.54 and Example 11.55 are at lines 1461, 1471 and 1478, p. 37. They give `def(Γ_f) = 2 g₂ deg f`, with `d₁ = Γ_f · (C₁ × pt) = deg f` and `d₂ = 1`.
  - The Frobenius application, `def(Δ) = 2g`, `def(Γ_π) = 2gq` and `|(Δ·Γ_π) − q − 1| ≤ 2g q^{1/2}`, is at lines 1488–1495, p. 38.
  - This confirms §5.11's subscript-swap remark: Milne's horizontal `C₁ × pt` is the README's `F_2`, with `Γ · F_2 = q`.
- The other targets of the sample (0.15, 0.22, 0.23, 1.1, 1.2, 2.5, 2.19, 3.2, 3.6, 4.13, 4.18, 5.4, 5.8) lie in text the diff does not touch.

### Overlaps and ownership

- `scratch/overlaps.md` lists no dropped id and no id that only an open revision defines. The diff changes no section number, target name or heading, and adds no cross-roadmap citation. The four conflicting heads are R02.
- The diff states no new construction. Its new library names are Tau Ceti's (`LineBundleClass.intersectionNumber`, `LineBundleClass.IsAmple`, `Scheme.Modules.eulerCharBelow`, `Scheme.Hom.exists_subsingleton_cohomology_of_isAffine`).
- `roadmaps grep 'hodge_index|Hodge index theorem'` finds the Hodge index theorem stated only in this roadmap: on main, here, and in its revisions #1656, #1807, #1808 and #1854.
  - ArithmeticGaloisRepresentations, DeligneWeightsAndPurity, CurvesOverFiniteFields, K3Surfaces, MotivesAndAlgebraicCycles and GrossZagierAndArithmeticHeights use it as consumers.
  - ArakelovGeometryAndAbelianHeightsPartII names the Yuan–Zhang arithmetic Hodge index theorem, which is a different statement.

### Adversarial table

These rows cover the changed statements. Each value was computed this round.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| §5.10 docstring: the Euler-characteristic form on `eulerCharBelow k S _ 3` | `S = ℙ¹ × ℙ¹`, `χ(O(a,b)) = (a+1)(b+1)` | `O(1,0)·O(0,1) = 1 − 0 − 0 + 0 = 1`; `O(1,0)² = 1 − 0 − 0 + χ(O(−2,0)) = 1 − 1 = 0`; for `D = (1,−1)`, `H = (1,1)`: `D·H = 1 − χ(O(−1,1)) − χ(O(−1,−1)) + χ(O(−2,0)) = 1 − 0 − 0 − 1 = 0`, `D² = 1 − 0 − 0 + χ(O(−2,2)) = 1 − 3 = −2` | Pass: agrees with §5.10's Checks (`D·H = 0`, `D² = −2`, matrix `[[0,1],[1,0]]`) |
| §5.10 bullet and §5.11 Check: `intersectionNumber k ι a = eulerDegree k (ι^* a)` is not a pairing of two classes | `ι : {pt} × ℙ¹ ↪ ℙ¹ × ℙ¹`, `a = O(a,b)`; second argument `D = (1,−1)` | `χ(O(b)) − χ(O) = b`, the README's `O(a,b)·O(1,0) = b`; `D·O(1,0) = −1 < 0` while every curve meets the base-point-free `O(1,0)` nonnegatively, so `D` is the class of no curve and `D²` is no value of `intersectionNumber` | Pass |
| §2.6 `Scheme.Hom.exists_subsingleton_cohomology_of_isAffine` | `ℙⁿ_A → Spec A` with `A ≠ 0`; `Spec A → Spec A`; `A = 0` | `H^n(ℙⁿ_A, O(−n−1)) ≅ A ≠ 0` forces `N ≥ n + 1`, and the Čech complex of the `n + 1` standard affines gives `N = n + 1`; affine: `N = 1`; `ℙⁿ_0 = ∅`: `N = 0` | Pass |
| §2.6 `Scheme.Hom.exists_isZero_higherDirectImage` (`[CompactSpace S]`) | `ℙⁿ_S → S`, `S` quasi-compact | `R^n f_* O(−n−1) ≅ O_S ≠ 0`, `R^p f_* = 0` for `p > n`: `N = n + 1` | Pass |
| §0.5 `of_isNoetherianRing`, `finitePresentation` (`1 ≤ m`) | `R = k[x₁, x₂, …]`, `M = R/(x₁, x₂, …) ≅ k`; `R = k[x]`, `M = k` | first: `M` finite, not finitely presented (the ideal is not finitely generated), so not `1`-pseudo-coherent, and the Noetherian hypothesis cannot be dropped; second: `0 → R →(x) R → k → 0` is a finite free resolution | Pass |
| §0.17 `satisfiesSerreS_one_iff` (031Q) | `M = k[x,y]/(x², xy)` | `Ass M = {(x), (x,y)}`, `(x,y)` embedded; at `p = (x,y)`: `x ∈ M` is killed by `p`, so `depth M_p = 0 < min(1, dim Supp M_p) = 1`: both sides false | Pass |
| §0.17 `isReduced_iff_…` (031R) | `k[x]/(x²)`; `k[x,y]/(xy)` | first: `R_{(x)} = k[x]/(x²)` not regular, `(R_0)` fails, not reduced; second: localizations at `(x)`, `(y)` are fields, at the origin `x + y` is a nonzerodivisor, `depth 1 = min(1, 1)`: reduced and `(R_0) ∧ (S_1)` | Pass |
| §0.29 `SchemeCharP` with `iff_natCast_eq_zero` and the empty-scheme instance | `∅`; `Spec(𝔽₂ × 𝔽₃)`, `p = 2`; `Spec 𝔽₂[t]` | `Γ(∅) = 0`, so `2 = 0` and there are no stalks: both hold; `2 = (0, 2) ≠ 0` and the stalk `𝔽₃` is not `CharP 2`: both fail; `𝔽₂[t]`: both hold | Pass |
| §2.9 `bigSheaf_fullyFaithful` on **O-linear** Homs (0GN7) | `S = Spec 𝔽_p`, `F = G = O_S` | `Hom_O(O^a, O^a) = 𝔽_p = Hom(O_S, O_S)`; as abelian sheaves `End(𝔾_a) ∋ (x ↦ x^p)`, which is not `O`-linear, so the bold qualifier is needed | Pass |
| §0.17 locators | `:144`, `:175`, `:211`, `:258` read in `CohenMacaulay/Ring.lean` | that file has 138 lines; the four declarations are at those lines of `SerreCondition/Basic.lean` | **R03** |
| Pins | `IntersectionNumber/`, `LineBundle/Ample.lean`, `RingTheory/Japanese.lean`, `AlgebraicSpace/`, `Chow/` | present at `2fd255d9`, absent at `358314d4` | **R01** |

The following rows are carried from r64's table, because the diff leaves these statements untouched. The values are r64's.

| Statement (r64) | Instances | Values | Result |
|---|---|---|---|
| `flat_over_dedekind` (0AUW) | `X = S ⊔ 𝔸¹_S` over `Spec k[t]`; `Spec k[t]/(t)` | torsion-free stalks, hence flat, with fibre dimensions `0` and `1`; the component `{t = 0}` is not dominant and carries `t`-torsion | Pass |
| §0.8 `rational_point_component` | `x² + y² + 1 = 0` over `ℝ`; `Spec ℂ/ℝ` | connected, no point; `Spec ℂ ⊗ ℂ` has two points | Pass |
| §0.15 Popescu | `k → k(t)` | `k(t) = colim k[t, 1/f]`, smooth | Pass |
| §0.16 universally catenary | `ℤ`; `k × k[t]` | CM localizations, catenary chains | Pass |
| §0.17 *depth_localization_le* (0FCC) | `k[x,y]_{(x,y)}`, `p = (x)`; `M = R/(x)`, `p = (y)` | `1 + 1 ≥ 2`; `⊤ ≥ 1` | Pass |
| §0.17 Hartogs `(S_2)` | `k[x,y,z]/(xz, yz)` | origin height 2, depth 1; the idempotent section is not in `R` | Pass |
| §0.30 coheight | `x ↦ x²` on `𝔸¹` | ramification `2` at `0`, `1` at `1` | Pass |
| §1.7 points | `h_{Spec L}`, `L/K` quadratic | one point | Pass |
| §1.8 `EtaleLocal` | `U ⊂ X` open | `baseChange` assumes `IsLocalAtSource` | Pass |
| §1.14 groupoid laws | `r`, `i(r)` | `c(r, i r) = e(t r)`; an idempotent has no inverse | Pass |
| §2.1 pullback | `Spec ℂ → Spec ℝ`, `ℤ/2` | `ℤ/2 → 0` | Pass |
| §2.3 `NonabelianH1` | `GL_n` over local `A`; `S₃` | one class; `(12)(13) = (132)` breaks the homomorphism | Pass |
| §2.17 `IsReplete` and `isReplete_proetale` | `μ_{ℓ^n}` on `(Spec ℚ)_ét`; reindexing | `lim = 0`, the legs are not epi; `epi_π_app` shows the two predicates agree | Pass |
| §3.2 `genus_of_finite_etale` | `z ↦ z²`; étale double cover of genus 2 | `R` has degree 2, so the map is not étale; `g = 3` | Pass |
| `cohomologyDim_one_eq_zero_of_degree_gt` | `K`; `O(2g − 1)` | `h¹(K) = 1`, excluded; `h⁰ = g`, `h¹ = 0` | Pass |
| §4.4 hulls, `schlessinger_prorepresentable` | `h_{k[[t,s]]} → h_{k[[t]]}`; one-point functor | `R₀ = k[[t]]`; `h_k` | Pass |
| §5.2 `flatPullback_properPushforward`, localization | degree-`d` field extension; `𝔸¹ ⊃ 𝔾_m` | `d[𝔸¹_k]` on both sides; `ℤ → 0 → 0` exact | Pass |
| §5.6 `Chow.intersect`, constant map | line with two origins; `f ≡ p` | `[0₁]`; `c₁(O) = 0` | Pass |
| `artinBootstrap`, `torsorRepresentability`, `Torsor.trivial_iff_section` | `h_X`, `𝟙`; `P = G`; `P` with a section | `IsAlgebraicSpace h_X`; `(g,h) ↦ (gh, h)` is an iso; both directions hold | Pass |
| `grothendieck_existence`, `algebraize_hom` | `A = k[[t]]`, `𝔸¹_A` | compatible `a_n` give `a ∈ A`; `a₀ = 0`, `a₁ = 1` violate `hcompat` | Pass |
| `alteration_theorem`, `semistable_alteration_theorem` | `𝔸¹_k`, `Z = V(t)`; `xy − p`, `xy − p²`, `x² − p` | `B = {0, ∞}`; regular SNC, singular, nonreduced | Pass |
| `node_local_structure_dvr` | `a = ε πⁿ` | `u ↦ εu` | Pass |
| `isAzumaya_iff_positive_fibres_mulLeftRight` | `R × 0`; the zero ring | both sides false; both sides true | Pass |
| `weil_bound` | `ℙ¹/𝔽₂`; `y² = x³ − x/𝔽₃`; `y² = x³ + x + 1/𝔽₅` | `0 ≤ 0`; `0 ≤ 2√3`; `3 ≤ 2√5` | Pass |
| §5.11 Castelnuovo–Severi | `Γ_π`, `Δ` | `def(Γ) = 2gq`, `def(Δ) = 2g`, recomputed above from Milne lines 1478–1495 | Pass |

### Remarks on untouched text (no change requested)

- §5.9 (`README.md:7266–7272`) asks to prove that for integral `C`, `C · D` equals §3.3's Euler degree `deg_C(O(D)|_C)`. At `2fd255d9`, the right-hand side is Tau Ceti's `LineBundleClass.intersectionNumber` (`IntersectionNumber/Basic.lean:111`), which §5.9's *Needs:* line could name once R01's pin bump lands.

## Not verifiable

- **Seeded targets outside the changed passages** (0.15, 0.22, 0.23, 1.1, 1.2, 2.5, 2.19, 3.2, 3.6, 4.13, 4.18, 5.4, 5.8). This incremental review does not re-read them; r64 checked 0.15 and 3.2.
- **Post-merge elaboration.** I did not re-run a post-merge copy of `Suggested.lean` at main's pins this round. R01's test is r64's (exit 0, 46 sorries), together with the witness lines I opened at `2fd255d9`.
- **de Jong 1996, Hartshorne 1977.** The manifest settles both as uncertified. Neither is cited by a changed passage.
- **Ownership against open pull requests.** I checked this through `scratch/overlaps.md` and one `roadmaps grep` for the Hodge index theorem, not through every open README; the diff adds no owned object.

## Source issues

- none
