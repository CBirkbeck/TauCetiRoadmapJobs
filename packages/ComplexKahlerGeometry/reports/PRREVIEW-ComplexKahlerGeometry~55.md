# Review of ComplexKahlerGeometry (pull request #1234 at 06e0a3f)

**Verdict:** needs changes

This is a full review of the head that the previous review read. Nothing changed in the folder or outside it in between.

## R01 (P1) — K4.P creates a citation loop with TopologicalKTheory

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:779`, "*Needs:* … SmoothBundlesConnections B6.1–B6.2; TopologicalKTheory T1.6d (rank one)". The same citation appears at :46–49, :726–729 and :765–766. The justification at :2451–2453 reads: "no K7 item consumes K4.P, so the two roadmaps supply each other in one direction per item".

Claim: TopologicalKTheory, on main, consumes CKG K5–K7. That includes K7.2's complex characteristic cells, inside the very section T1.6d that K4.P now consumes. Main's CKG README cites TopologicalKTheory nowhere; this head adds five citations, so the pull request creates a two-roadmap cycle. The README's justification is also false: K7.FlatDegreeZero's *Needs:* line (:2275) lists K4.P. The dependency check cannot see this loop: with `--content`, every roadmap on main counts as "never upward" (`gate --help`). At the heads of #1854 and #1807, which cut the loops on main, TopologicalKTheory still consumes CKG K5–K7, so CKG must come first.

Witness: on main, `TauCetiRoadmap/TopologicalKTheory/README.md:78` reads "[ComplexKahlerGeometry (CKG) K5–K7] … supplies … projective examples". Its T1.6d, at :742, reads "transport AT4.6's real and CKG K7.2's complex characteristic cells". This head, at :2275, lists "K4.P" among K7.FlatDegreeZero's needs.

Repair: move the rank-one statement down into K4.P and drop TopologicalKTheory.
- On a paracompact manifold the sheaves `C⁰_ℂ` and `C^∞_ℂ` are fine.
- So the exponential sequences `0→ℤ→C⁰_ℂ→C⁰_ℂ×→1` and `0→ℤ→C^∞_ℂ→C^∞_ℂ×→1` give connecting isomorphisms `H¹(M;C^∞_ℂ×)≅H²(M;ℤ)≅H¹(M;C⁰_ℂ×)`, and these commute with the inclusion `C^∞_ℂ× ⊂ C⁰_ℂ×`.
- Hence `F_M:Pic_sm(M)→Pic_cont(M)` is a bijection preserving `c₁`, torsion included. Its only inputs are SBC B6.1's sheaf/singular comparison and B6.2.
- Delete the TopologicalKTheory clauses at :46–49, :726–729, :765–766, :779 and :2449–2453, and correct "no K7 item consumes K4.P".
- Alternatively, deleting the continuous-line corollary also breaks the loop.

Test: the repaired K4.P cites no TopologicalKTheory section, so TopologicalKTheory → CKG is the only edge left between the two roadmaps. On `ℂP¹` both sides are `H²(ℂP¹;ℤ)=ℤ`, and `O(1)` goes to `+1`.

## R02 (P1) — K6.1.RelativeIntegration (ii): the relative integration map is not defined on relative chains and does not descend to the quotient

Location: `README.md:1767–1772`: "relative integration `(α,β)↦(c↦∫_cα−∫_(∂c)β)` on relative smooth chains … Prove it is well defined on the quotient (on a chain in U it is `∫_c dβ−∫_(∂c)β=0` …), a cochain map into the duals of relative smooth chains".

Claim: the formula breaks in two ways.
- `∫_(∂c)β` needs `∂c ⊂ U`, which a chain of M need not satisfy.
- The vanishing on chains in U uses `α|_U=dβ`, which holds only for cocycles.

So the stated map is neither defined on `C(M)/C(U)` nor a cochain map into its dual. The consumers (:1725–1726, :1779) only use cocycles `(α,0)` with α vanishing on U, and for those the formula is right.

Witness: on `(ℝ,ℝ∖{0})`, take `(dx,0)` on the 1-simplex `[1,2]⊂U`. It gives `∫dx−0=1`, although the simplex is zero in the quotient. Taking `(0,1_U)` on `[0,1]` requires `β(0)`, but `0∉U`.

Repair: replace the relative-integration sentence of (ii) with the cone construction.
- Relative integration is `(α,β)↦(∫α,∫β)`, into the cone of the restriction `C^•_sm(M)→C^•_sm(U)`, with differential `(a,b)↦(δa,a|_U−δb)`.
- It is a cochain map by DG8.4's Stokes for chains: `∫dα=δ∫α` and `∫(α|_U−dβ)=(∫α)|_U−δ∫β`.
- Restriction of cochains is degreewise surjective (extend by zero), so the cone is quasi-isomorphic to its kernel, the relative cochains.
- On a relative cycle c the pairing is `a(c)−b(∂c)`.
- DeRhamCohomologyAndDuality §3.2 already gives exactly this at its head (`TauCetiRoadmap/DeRhamCohomologyAndDuality/README.md:465–475` at `1b57dbe`).

Test:
- The README's first Check, `(ψdx,Ψ|_U)` over `[−1,1]`, gives `1−(1−0)=0` both ways.
- `(dx,0)` now goes to the cone cochain `(∫dx,0)`, which is not required to vanish on U.
- The consumers' `(α′,0)` goes to `(∫α′,0)`, the image of the relative cocycle `∫α′`.

## R03 (P2) — The holomorphic exponential segment has two owners: K4.P and ComplexComparisonPartII C5.4 (previous R02 item 3, not repaired)

Location: `README.md:690–695`: "K4.P owns, on every complex manifold, the holomorphic exponential sequence, the isomorphism `Pic_hol(M)≃H¹(M,𝒪×)` and the identification of its connecting map … to K3Surfaces 1.1 and to GeometricQuantization §3.3, which are its consumers."

Claim: ComplexComparisonPartII's head (#848, `490f7c9`) names C5.4 the single owner of the same objects, including the frame-torsor bijection, and says it does not take them from CKG K4. The consumers named in the sentence take the exponential segment and `c₁` from C5.4:
- K3Surfaces (#1285, `2ddcd6b`), at `README.md:175–176, 411`. It takes only `Pic_hol(M)≃H¹(M,O_Mˣ)` from CKG, through its gap `integral-topology`.
- GeometricQuantization (#1186, `be6ed5f`), at `README.md:20, 719`.

So two open roadmaps own one object. The previous round recorded this at P3; under the overlap rule it is P2.

Witness: ComplexComparisonPartII `README.md:146` at `490f7c9`: "C5.4 is the single owner, on every complex manifold, of … the frame-torsor bijection … to `H¹(M,O_M^×)`, the holomorphic exponential sequence … and the identification of its connecting map with the integral first Chern class".

Repair: keep K4.P as the owner.
- CKG comes first: ComplexComparisonPartII's head writes "ComplexKahlerGeometry K2/K3/K4 → RealAnalyticGeometry R3.2 item 0 → C-1/C0" (`:161`), and K7.FlatDegreeZero needs K4.P (:2275).
- Add one sentence to the description's merge-order paragraph: #848 replaces its single-owner clause (`:146`) with a citation of CKG K4.P, and #1285 (`:175–176, :411`) and #1186 (`:20, :719`) take the exponential segment and `c₁` from K4.P.
- Until they do, "which are its consumers" (:694–695) is false at those heads. No file in this folder changes.

## R04 (P2) — The open-pair relative de Rham theory still has two owners (previous R01, not repaired)

Location: `README.md:1756–1759`: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances."

Claim: nothing has changed since the previous review. DeRhamCohomologyAndDuality's head (#1768, `1b57dbe`, the same head the previous review read) still says it is the single owner and that K6.1 consumes from it. The description still does not name #1768. Once R02 is repaired, CKG's (ii) will be the cone construction that §3.2 there already uses, so the two texts will then agree in content.

Witness: DeRhamCohomologyAndDuality `README.md:70–76` at `1b57dbe`: "have a single owner, this roadmap … that ComplexKahlerGeometry K6.1 uses for analytic cycles are their boundaryless instances, consumed from §§2.4, 3.1–3.3 and 4.1". `:695` says the same.

Repair: description only, as in the previous review. Add one sentence to the merge-order paragraph: #1768 replaces `README.md:70–76` and `:695–702` with a citation of CKG K6.1.RelativeIntegration for the boundaryless open-pair complex, relative integration and the compact-support formula. It keeps the corners extension and §4.2.

## R05 (P2) — DifferentialGeometry's open revision drops four cited supplier declarations; the two-form transport is already stale at the pin; DG 1.5 exists only in that revision

Location: `README.md:71–75`: "Transport the pinned native two-form compatibility and closedness API through DG0.4's `legacySmoothTwoFormEquiv` and `legacySmoothTwoFormEquiv_isClosed_iff`; the prototypes use that native carrier to pin these preservation laws during its migration". Also :1175–1177 (`integralTopForm_eq_integralDensity`, `integral_riemannianVolume_eq_integralDensity`) and :1208, :1215 (DG1.5).

Claim: these citations break in three ways.
- **Dropped declarations.** On main the four names are DifferentialGeometry targets (`TauCetiRoadmap/DifferentialGeometry/Suggested.lean:711, 870, 1938, 3266`). DifferentialGeometry's open revision #886 (head `8f9be9a`) declares none of them. Its README states the same facts in unnamed prose: 0.4 at `:576–590`, 5.5a at `:1227–1230`, 12.4 at `:2097–2106`. Its old → new note (`:38–42`) covers only section 5.5 and layer-4 names. These supplier citations break when #886 merges.
- **Stale at the pin.** The transport through `legacySmoothTwoFormEquiv` already does nothing at the pin, and "during its migration" is process narrative.
- **Revision-only section.** DG1.5 (:1208, :1215) exists only at #886's head (`:687`), and the description's merge-order paragraph does not name #886.

Witness: at Tau Ceti `2fd255d`, `TauCeti/Geometry/Manifold/TwoForm/Basic.lean:37` reads `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`. So `SmoothTwoForm.Compatible` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:231`) already lives on DG0.4's carrier. `legacySmoothTwoForm` occurs nowhere in #886's README or Suggested.lean.

Repair:
1. Replace :71–75 with: "The pinned `SmoothTwoForm I M` is the abbreviation `SmoothForm I M ℝ 2`, so `SmoothTwoForm.Compatible` and `SmoothForm.IsClosed` are used directly on DG0.4's carrier."
2. At :1175–1177, cite the content rather than the names: "DG 5.5's agreement of the density integral with `integralTopForm` on oriented manifolds and DG 12.4's agreement of `TauCeti.riemannianVolume` with the density integral". Both exist on main (DG `README.md:528–529, 923–927`) and at #886's head (`:1227–1230, :2097–2106`, where its note reads 5.5 as 5.5a).
3. Name #886 in the description's merge-order paragraph as merging first, for DG 1.5.

Test: after (1) and (2), every DifferentialGeometry citation in the README resolves both on main and at #886's head.

## R06 (P3) — The description states no order against the four heads that conflict with this one (previous R02 item 1, not repaired)

Location: the pull-request description. Its only merge-order line is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186".

Claim: #1398, #1807, #1808 and #1854 each conflict with this head in this folder's README, and the first three also conflict in `Suggested.lean`. The description says nothing about which of them rebases on which. #1807 and #1854 also change TopologicalKTheory, which bears on R01.

Witness: the overlap computation from main `13665dd` and the open heads reports "#1234 and #1398 conflict in `README.md`, `Suggested.lean`", the same for #1807 and #1808, and "#1234 and #1854 conflict in `README.md`".

Repair: add one sentence to the description that says, for each of #1398, #1807, #1808 and #1854, whether it rebases on this pull request or this one on it.

## R07 (P3) — Citations that the cited heads contradict, and a paragraph that plans another roadmap's construction

Location:
- `README.md:223–224`: "consume [GH0's compact-support operator, identity and real-plane area normalization]".
- `:2410`: "GH0 (compact-support formula, area normalization, finite-rank Runge operators and exhaustion)", with the link anchor `#gh0-runge`.
- `:446–448`: "GH2's … finite-pole local phase before global Runge patching".
- `:2393–2409`, `:207–208` and `:2033–2035`.

Claim: four groups of citations do not match the roadmaps they cite.
- **GlobalHolomorphicFunctions numbering.** At GlobalHolomorphicFunctions' head (#992, `db419f3`), "Layer k is cited by consumers as GH(k−2)". So GH0 is Layer 2 (Runge). The compact-support Cauchy–Green operator and the area normalization are in Layer 0 §0.3 (`:483`), which has no GH label, and no heading has the anchor `#gh0-runge` (`:784`).
- **GH2's "local phase".** GH2 (Layer 4, `:1317–1368`) takes the Laurent decomposition as native and needs Layers 1–3, so there is no "local phase before GH0". Even so, `:2393–2409` plans that phase step by step ("Separate these phases explicitly"), which is planning another roadmap's targets.
- **LieGroupoidsPoisson.** `:207` says LieGroupoidsPoisson consumes K1's eigenbundle dictionary. LieGroupoidsPoisson on main (`README.md:85–86`) calls CKG "a consumer of this roadmap … and is therefore never a supplier here".
- **ComplexComparisonPartII.** `:2033–2035` gives the identification of the blowup's analytification to ComplexComparisonPartII, whose head plans no blowup; the word does not occur in its README.

Witness: GlobalHolomorphicFunctions `README.md:243–249` at `db419f3`: "Layer 2 (GH0) supplies hulls … and Runge; … Layer 4 (GH2) realizes isolated singularities … Layer k is cited by consumers as GH(k−2)".

Repair:
- Cite GH Layer 0 §0.3 for the compact-support operator and the area normalization (:223–224, :243, :2410).
- Cite GH0 (`exists_finite_rank_runge_operator`, `:1042`) for the Runge operators, and GH2 (Layer 4) for the Laurent decomposition (:446).
- Replace :2393–2409 with one sentence giving the order of the GH layers that K2, K3 and K5a consume.
- Delete the LieGroupoidsPoisson clause at :207–208 and the ComplexComparisonPartII clause at :2033–2035; nothing in this roadmap uses either.

## R08 (P3) — Sampled targets without a locator, and definitions without Checks

Location: the sampled theorems without a locator are:
- the three category equivalences of K4.ComponentwiseFiniteRankAssembly (:657–673);
- K5a.SmoothSectionMontel (:972);
- K5b.0 (:1426–1462);
- K6.1.RelativeIntegration (:1751–1785);
- the Fubini–Study homogeneity block (:1891–1932);
- the Malcev lattice step of K8.NilpotentCentralReduction (:2331–2374);
- K8's Iwasawa numbers (:2318–2319).

The definitions without Checks are:
- `complexBesselSymbol` (:1073–1077, declared at `Suggested.lean:306`);
- K5a's `BundleTest`, `BundleDistribution` and `BundleSobolev` (:870–983);
- K7.1's model comparison `[v]↦[v/‖v‖]` (:1853–1861).

Claim: each theorem needs a locator, or needs to say that it is this roadmap's own result, as K5a's nonextension example does (:947). Each definition needs at least three discriminating Checks. K3, K4 before K4.P, K5a, K5b and K8 contain no `**Checks.**` block at all.

Witness: the `**Checks.**` blocks are at lines 302, 782, 1547, 1607, 1792, 1940, 1997, 2073, 2129, 2197 and 2278. None falls in 341–780 or in 798–1503.

Repair: add locators. These have been opened and verified:
- Demailly Ch. VI §7, p. 309 (`demailly-agbook` line 15369–15374), for K5b.0's formal adjoint `D*_E=−⋆D_E⋆` and the halved principal part of `Δ''_E`.
- Angella §4.1–§4.2, p. 13 (`angella-iwasawa` line 701, 717–724), for `b₁=4`, `h^(1,0)=3` (class (i), the Iwasawa manifold itself) and `h^(0,1)=2`.
- Raghunathan, Theorem 1.13, p. 23, and the Corollary on p. 31, for K8's lattice steps. Sakane cites exactly these (`sakane-parallelisable` line 112–113), and the work is already in the manifest as `raghunathan-discrete-subgroups`.

Then add Checks with computed values.
- For `complexBesselSymbol`:
  - `z=0` gives `1`.
  - `z=2` gives `1+‖ζ‖²`.
  - A real `z=s` gives Mathlib's `besselPotential` symbol `(1+‖ζ‖²)^(s/2)` (`Mathlib/Analysis/Distribution/Sobolev.lean:73–74`).
  - `z=it` has modulus 1.
  - A model with `log(1+‖ζ‖)` would give `1+‖ζ‖` at `z=2`.
- For the model comparison: `v=(3,4)` and `2iv` both go to the class of `(3/5,4/5)`, and the chart value `4/3` is the same in both models.

## Previous findings

- R01 (two owners of the open-pair relative theory) — not repaired. The folder sentence is unchanged at `:1756–1759`, #1768's head is unchanged (`1b57dbe`), and the description is unchanged. It is R04 above.
- R02 (no order or numbering statements in the description) — not repaired. The only merge-order line is still "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186". Item 1 is R06. Item 2 (#886), checked again against #886's head, turns out to be three dropped supplier declarations plus a section only #886 defines: R05. Item 3 (#848, #1285, #1186) is R03, now P2 under the overlap rule.
- R02 and R03 of the round before (the K5a locators and the unimodular clause) were repaired, as the previous review recorded. That text is unchanged and was checked again (adversarial rows below).

## Verified sound

**Gate.** Re-run on this head: `gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's own run also reports `build=0`.

**Dependency check** (`--movable`), exact output: `depcheck: 238 roadmaps, 2345 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line, and the roadmap is on main, not in `ORDER.txt`. The check counts roadmaps on main as never upward, so I compared main's CKG README with this head by hand. Only three main roadmaps are newly cited: SchubertGeometry, StableReduction and TopologicalKTheory. Of these, only TopologicalKTheory cites CKG back (R01). SmoothBundlesConnections calls CKG a consumer (`README.md:60, 1935`), so there is no loop with it.

**Outside the folder.** `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean` of this folder.

**Lean.** `Suggested.lean` is unchanged (md5 `c3be558e…`). `lake env lean` on it exits 0 with 25 `sorry` warnings, one per theorem. A scratch copy with `#check @` for all 33 declarations also exits 0 with the same 25 warnings and nothing else. I compared each elaborated type with its README statement; all match.
- `dolbeaultCocycles`, `dolbeaultCoboundaries` and `DolbeaultCohomology` drop `[FiniteDimensional ℂ E]`.
- `lefschetzMap` keeps only the binders its body needs.
- No body needs a dropped binder, and every theorem about these definitions carries the dropped binders again.

There is no `lemma`, `set_option` or sorry'd data.

**Padding probe.** On a scratch copy every theorem's `sorry` was replaced by `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (norm_num; done) | decide | (exact ⟨inferInstance, inferInstance⟩) | (constructor <;> simp; done) | (intros; simp_all; done) | (aesop; done) | sorry`. The run exits 0 with 25 `sorry` warnings, so every theorem fell back to `sorry`. Mathlib's temperate-growth lemma covers only real exponents (`hasTemperateGrowth_one_add_norm_sq_rpow`, `TemperateGrowth.lean:327`). Mathlib has no regular ⇒ factorial theorem (`RingTheory/RegularLocalRing/` has `Defs`, `Polynomial` only). So neither `complexBesselSymbol_temperate` nor `uniqueFactorizationMonoid_holomorphicStalk` follows in one step.

**Headline theorems.** There are 25 of them: NN local; DG polydisc; mixed solver; Weierstrass preparation, uniqueness and division; Rückert; Oka; Cartan; Riemann extension; regular local ring; UFD; Hartogs at a point; temperate symbol; finiteness; Serre dimensions; `∂∂̄`; Hodge decomposition (dimensions); Hodge symmetry; odd `b_k` even; Hard Lefschetz; `h^(p,q)`, `b_k` and cohomology ring of `ℂPⁿ`; genus dictionary. All are stated. I checked the docstring's reasons for what is not statable at the pins:
- Mathlib (`Topology/Algebra/Projectivization.lean:44`) and Tau Ceti (`:90`) both declare `Projectivization.instTopologicalSpace`.
- No compact complex torus exists; Tau Ceti's `ComplexTorus` is the toric `(ℂ×)ⁿ` (`Geometry/Toric/Analytic/Character/Basic.lean:74`).
- No `Density` carrier and no units sheaf of `holomorphicStructureSheaf` exist.

No statable headline is missing.

**Seeded sample, locators:**

| Target | Locator | Source lines | Result |
| --- | --- | --- | --- |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3)–(2.4), (2.7), (2.10) | `demailly-agbook` 3794–3800 (p. 80), 3804–3817 (p. 80, "The representation (2.4) is unique"), 3872–3873, 3931–3936 | supports preparation, division with uniqueness, Noetherian, factorial. Krull dimension `n` and regularity are not in (2.7); the docstring says "(2.7) for the Noetherian property" |
| K3.MeromorphicGermField | pinned Tau Ceti modules; GH2 | 26 cited Tau Ceti modules exist; `isUnit_stalk_iff` (`StructureSheaf/LocalRing.lean:46`), `stalkIsDomain` (`Domain.lean:70`, finite-dimensional, without boundary) | sound; the GH2 "local phase" is R07 |
| K4.ComponentwiseFiniteRankAssembly | none | — | R08 |
| K5a.DistributionLocalStructure | Hörmann–Steinbauer 4.22, 1.70; Hörmander 2.3.4–2.3.5 | `hormann-steinbauer-distributions` 3736–3741 (`x_+^(k−1)/(k−1)!∈C^(k−2)`), 3752–3753 ((4.7), p. 90), 3759–3772 (statement on bounded Ω, cutoff, order N, `E_(N+2)`), 1517–1532 (1.70, p. 35) | supports as written; Hörmander is not verifiable |
| K5a.SmoothSectionMontel | none (Mathlib API) | `Mathlib/Analysis/LocallyConvex/Montel.lean:46` (`heine_borel` field), `:104` (`toCompactConvergenceCLM`, needs `T1Space`, `MontelSpace`) | API exists as cited; no locator (R08) |
| K5b (heading) | Demailly VI (7.2), (7.3), (8.12) | 15369 (§7: compact Hermitian X), 15385–15387, 15390–15395, 15523–15529 ("Serre duality … gives `h^(p,q)=h^(n−p,n−q)` … as soon as X is compact") | supports finiteness and the non-Kähler dual symmetry |
| K5b.0 | none | Demailly VI 15370–15374 fits | R08 |
| K6.1.RelativeIntegration | none | — | R02, R04, R08 |
| K7.1 | pinned atlases | both `instTopologicalSpace` (above); `isOpenQuotientMap_mk'` (Mathlib `:83`) | sound |
| K7.2 | Demailly V (15.10), VI (8.8) | 13812–13813 (`ℤ[h]/(h^(n+1))`, `h=c₁(O(1))`), 15486–15487 | supports the ring and the diamond |
| Fubini–Study block | none | — | values recomputed below; R08 |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–31 (incidence variety, blowup, tautological bundle), 32–54 (functions pulled back, weight spaces), 64–72 (sections of the dual ≅ `V*`) | supports as written |
| K7.2.RationalQuartic | own computed example | — | values recomputed below |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy §2.1, Remark 2.1, p. 6 | `berwick-evans-tripathy` 287–292 | degree-zero lines = flat unitary = characters `τm+n↦e^(2πi(mx+ny))`; supports the description (a remark, cited as such) |
| K8.NilpotentCentralReduction | Sakane pp. 188–189 | `sakane-parallelisable` 102–115 (p. 189: last lower-central term central, `A∩Γ` lattice, `AΓ` closed, holomorphic principal torus bundle) | supports; the lattice steps cite Raghunathan (R08) |

Also opened: Demailly I (3.29) at 1288–1293 (the local lemma; the docstring calls the whole-polydisc form K2's exhaustion), II (3.19) at 4286, II (4.2) Remark at 4399–4403 (p. 91: extension across a nowhere-dense analytic set of locally bounded holomorphic functions), II (4.22) at 4742, (4.29) at 4842 and (4.31) at 4929; VI (8.5)–(8.6) at 15442–15456, (8.17) at 15557–15560 and (10.1)–(10.2) at 15715–15716 (compact connected curves). Also Ballmann 4.17, pp. 47–48 (`ballmann-kahler` 1990–2012), Łojasiewicz Theorem 2, p. 464 (`lojasiewicz-triangulation` 512–515), and Angella §4 (above).

**Pinned declarations opened** (Tau Ceti `2fd255d`; Mathlib at the manifest pin):
- `SmoothTwoForm` (`Geometry/Manifold/TwoForm/Basic.lean:37`) and `Compatible` (invariant ∧ tames, `Symplectic/Manifold/TwoForm.lean:231`).
- `IsPseudoholomorphicOn` (`Symplectic/Manifold/JHolomorphic.lean:96`), within-at at each point; the `At` form carries `HasMFDerivAt`.
- `typeProjection` (`DifferentialForm/AlmostComplexType.lean:282`), `delBar` (`DifferentialForm/Dolbeault/Basic.lean:95`), `SmoothForm.IsClosed` (`DifferentialForm/Closed.lean:43`) and `ofComplexManifold` (`Complex/AlmostComplexStructure.lean:76`).
- `complexHodgeStar_mem_typeSubmodule_iff` (`HodgeStar/Complex.lean:219`, `(p,q)→(m−q,m−p)`) and `barHodgeStar_mem_typeSubmodule_iff` (`:233`, `(p,q)→(m−p,m−q)`), as the README says.
- `codifferential` (`Riemannian/Codifferential.lean:88`, sign `(−1)^(m(j+1)+1)` on j-forms) and `integralTopForm_inner_mextDeriv_eq_inner_codifferential` (`:252`).
- Mathlib `IsRegularLocalRing` (`RingTheory/RegularLocalRing/Defs.lean:52`: Noetherian local with `spanFinrank 𝔪 = ringKrullDim`) and `besselPotential` (`Analysis/Distribution/Sobolev.lean:73`).

**Cross-roadmap citations resolved:**
- ComplexManifolds M2.1, M2.2 and M2.4 are Milestone 2 items 1, 2 and 4 on main (`:203, 206, 214`). The resolver lead "M2.1" is a false positive.
- `CompactFormPair.operatorDomainV` is at VariationalMethods #1028 `Suggested.lean:185`; §2.3 is at `:494`, §3.1 at `:562`, §5.1 at `:839` and §5.2 at `:882`.
- StableReduction Layer 4 (main `:529–534`) has the Rees algebra, the blowup of a finite-type ideal and its affine charts.
- ComplexComparisonPartII C1.8 (#848 `:1796–1824`) owns analytic Serre vanishing, as the RationalQuartic deferral needs.
- DifferentialGeometry 2.1, 2.2, 5.4, 5.5, 6.2, 8.3–8.5, 12.1 and 12.4 exist on main; 1.5 does not (R05).
- DeRhamCohomologyAndDuality §3.2 is at #1768 `:465`. LieGroupoidsPoisson G1.3 is on main.
- GlobalHolomorphicFunctions GH0's `exists_finite_rank_runge_operator` is at #992 `:1042`, and GH5.1 is §7.4 at `:2000`.
- K3Surfaces' gap `integral-topology` (#1285 `:156–176`) asks CKG for the frame-torsor comparison, which K4.P provides.
- CalibratedGeometry #946 owns Wirtinger's inequality with its equality classification (4.2) and cites CKG K6.1 (`:999`). K6.1, which comes earlier, needs only the equality on complex subspaces, so there is no defect on this side.

Ownership against open pull requests was checked for the objects of R01–R07 and against the five roadmaps closest in vocabulary (#848, #946, #886, #1186, #992). It was not checked against every open pull request.

**Adversarial pass.** One row per statement. Each row gives the instances tried, the values computed and the result.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| `newlander_nirenberg` | `n=0`; `M=ℂ`, `J=i` | `E=0`: M discrete, constant φ is a local diffeo of points, intertwining vacuous; `φ=id`, `dφ∘i=i∘dφ` | Pass |
| `dolbeault_grothendieck_polydisc` | `n=0`; `r₀≤0`; `n=1,p=q=0` | point: degree `≥1` forms are 0, `ψ=0`; `ball c r₀=∅`; `φ=f dz̄` needs `∂̄u=f` (Cauchy–Green) | Pass |
| `exists_mixed_parameter_dbar_solution` | `u=z̄`; `u=z`; `Ω=∅` | `(Du(1)+i·Du(i))/2=(1+i(−i))/2=1=∂̄z̄`; `(1+i·i)/2=0`; `u=0` | Pass |
| `weierstrass_preparation` | `d=0`; `f=w²−z`, `n=1` | `u=f`, empty sum; `d=2`, `a₀=−z`, `a₁=0`, `u=1`, `a_i(0)=0` | Pass |
| `weierstrass_preparation_unique` | `f=w²−z` | `u′P′=P` forces `u′=1`, `a′=a` by uniqueness of division (`demailly-agbook` 3820–3823) | Pass |
| `weierstrass_division` | `g=w`, `d=1` | `f=q·w+f(z,0)` | Pass |
| `ruckert_nullstellensatz` | `k=0`; `f₁=z²,g=z` | `g≡0` near x, `m=1`; `z∉(z²)`, `z²=1·z²`, `m=2` | Pass |
| `oka_coherence` | `f=(z₁,z₂)` on ℂ²; `k=0` | relations generated by `(z₂,−z₁)`; `m=0` | Pass |
| `cartan_coherence_reducedIdeal` | `f₁=z²` on ℂ | reduced ideal at 0 is `(z)`, not `(z²)`; at `y≠0`, `z` is a unit | Pass |
| `riemann_extension` | `1/z`; `sin z/z`; `k=0` | unbounded, excluded; bounded, extends by 1; `A∩U=U`, so interior ∅ forces `U=∅` | Pass |
| `isRegularLocalRing_holomorphicStalk` | `E=0`; `E=ℂ` | stalk ℂ: `spanFinrank 0=dim 0`; DVR: `𝔪=(z)`, dim 1 | Pass |
| `uniqueFactorizationMonoid_holomorphicStalk` | `ℂ{z,w}` | `w²−z³` irreducible: by Demailly (2.9)b (`demailly-agbook` 3914) it suffices in `ℂ{z}[w]`, where the roots `±z^(3/2)∉ℂ{z}` | Pass |
| `hartogs_extension_across_point` | dim 1; ℂ² with doubled origin | `1/z` excluded by `2≤finrank`; non-Hausdorff: `g(0₁):=f(0₂)` by continuity | Pass |
| `complexBesselSymbol(_temperate)` | `z=0,2,i`, real `s` | `1`; `1+‖ζ‖²`; modulus 1, `∂_j` = `iζ_j/(1+‖ζ‖²)`·symbol; equals `(1+‖ζ‖²)^(s/2)` | Pass (no Checks: R08) |
| `DolbeaultCohomology` (defs) | ℂ; ℂ×; `q=0` | `H^(0,1)(ℂ)=0` but `h dz` is ∂̄-closed of the wrong type; `dz̄/z̄=∂̄log|z|²` with `∮dz̄/z̄=−2πi` (`z=e^(iθ)`: `−i dθ`); coboundaries `⊥` | Pass |
| `finiteDimensional_dolbeaultCohomology` | `M=ℂ` | `H^(0,0)` = entire functions, infinite-dimensional, so compactness is needed | Pass |
| `finrank_dolbeaultCohomology_serre` | ℂP¹; Hopf | `h^(0,0)=1=h^(1,1)`, `h^(1,0)=0=h^(0,1)`; `h^(0,1)=1=h^(2,1)` | Pass |
| `del_delBar_lemma` | Kähler form of `ℂ/Λ`; `p+1>n` | `∫ω>0`, so not exact, excluded; `α=0`, `γ=0` | Pass |
| `finrank_deRhamCohomology_eq_sum_dolbeault` | ℂP¹ `k=2`; `ℂ/Λ` `k=1`; `k>2n` | `1=0+1+0`; `2=1+1`; `0=0` | Pass |
| `finrank_dolbeaultCohomology_symm` | Hopf | `h^(1,0)=0≠1=h^(0,1)`, not Kähler | Pass |
| `even_finrank_deRhamCohomology_odd` | Kodaira–Thurston; annulus | `b₁=3`, `N_J≠0` fails `IsKahler`; `b₁=1`, has boundary | Pass |
| `hard_lefschetz`, `lefschetzMap` | ℂP² `k=0`; `S²×S²`; `j=0` | `1↦[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`, `σ₁²=0`; identity; `k+2(n−k)=2n−k` (`k=1,n=2`: 3) | Pass |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0,1` | `(0,0)↦1`; `(1,1)↦1`, `(1,0)↦0`, `(2,2)↦0` | Pass |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=2` | `b₀=b₂=b₄=1`, `b₁=b₃=b₆=0`, `χ=3=n+1` | Pass |
| `integralCohomology_complexProjectiveSpace`, `integralCupPow` | `S²∨S⁴`; `u=2g`; `n=0` | `u²=0` fails `k=2`; fails `k=1`; `u=0`, `u⁰=1` generates ℤ | Pass |
| `finrank_dolbeaultCohomology_riemannSurface` | two elliptic curves; ℂP¹ | `2=2`, `b₁=4=2·2`; `0=0`, `0=0` | Pass |
| `IsKahler`, `polydisc` | `(ℂ, dx∧dy, i)`; `r=−1`; `n=0` | `ω(v,iv)=|v|²>0`, closed, `N=0`; `ball=∅`; `pi` over `Fin 0` is a point | Pass |
| K3.MeromorphicGermField example | `e(z)=2z` | `1/z↦1/(2z)`; along `w↦w/2`: `1/w`; `1+z↦1+2z`, value 1; coefficient `−1` of `1/z` = `(2πi)⁻¹∮dz=1` | Pass |
| K5a.DistributionLocalStructure | `m=2,3`; `u=∂_zδ⊗1` | `D²t_+=δ`, `t_+²/2∈C¹`; `z·u=−δ⊗1=(−1)¹1!u_(1)` | Pass |
| K5b.0 | `H=I` | `|dz|²=|dx|²+|dy|²=2=2(H⁻¹)₁₁`; `dz♯=∂_x−i∂_y=2∂_z`; `∂̄*=−*∂*`: `(p,q)→(n−q,n−p)→(n−q+1,n−p)→(p,q−1)`; `σ(Δ_∂̄)=½σ(Δ_d)` | Pass |
| K6.0 Checks | ℂP¹ scaled `√π`; `H=diag(1+z₂+z̄₂,1)` | `H=(1+π|u|²)^(−2)`, `|H−1|≤2π|u|²`; `dω=(i/2)(dz₂+dz̄₂)∧dz₁∧dz̄₁≠0` | Pass |
| K6.1.RelativeIntegration (ii) | `(ψdx,Ψ|_U)` on `[−1,1]`; `(dx,0)` on `[1,2]` | `1−(1−0)=0`; gives `1` on a chain that is 0 in `C(M)/C(U)` | **Fail: R02** |
| K6.1.RelativeIntegration (iii) | `N=ℝ`, `K=[−1,1]`, then `[−3,3]`; `S¹` | `∫ψ=1` both; `∫dθ=2π`, orientation reversal negates both | Pass |
| K4.P Checks | point; ℂP¹; `ℂ/Λ` | `exp(2πi·)` kernel ℤ vs `exp` kernel `2πiℤ`; `c₁(O(±1))=±1`; `Pic⁰=H¹(O)/H¹(ℤ)=ℂ/ℤ²≅Hom(ℤ²,U(1))` | Pass (ownership: R01, R03) |
| K7.1 comparison | `v=(3,4)`, `2iv` | `(3/5,4/5)` and `i(3/5,4/5)`, one class; chart `4/3` both | Pass (no Checks: R08) |
| Fubini–Study | `w=(1,i)/√2` in ℂP²; `z=(1,0)`; `c=2`; `diag(1,2)`; `∫_(ℂP¹)` | `r=2`, `w₁w̄₂=−i/2`, `h(e₁,e₂)=i/(8π)` (transposed `−i/(8π)`); `H_z(v,v)=1/π`; `|c|⁴=16` cancels; `4/π`; `(1/π)·π=1` | Pass |
| K7.2.TautologicalIncidence | overlap; `d=2,k=1`; `k<0` | `e_i+Σz_je_j=z_k(e_k+…)`: `a′=az_k`, `z′_i=1/z_k`; `(t·F)=t⁻¹F`; `F(tv)=t^kF(v)→∞` unless `F=0` | Pass |
| K7.2.RationalQuartic | `n=1,2` | `(a,b,c,d)↦(a,b,0,c,d)`; exponents `{0,1,3,4}` pair-sums `0…8`; `10−9=1`, `x₀x₃−x₁x₂↦s⁴t⁴−s⁴t⁴=0` | Pass |
| K7.FlatDegreeZero | `ρ=exp(aλ)`; square torus; holonomy; curvature | `u=α`, `v=αx−βy`, recovers `α+iβ`; `|σ(1)|=|σ(τ)|=1`; `exp(πix)` gives `−1`, `1`; `(λ,v)~(0,ρ(λ)⁻¹v)`; `i∂∂̄u=½Δ_E u ω=−½(Δ_d u)ω` | Pass |
| K8.NilpotentCentralReduction | Heisenberg `H₃(ℂ)` | `C¹=[G,G]=` centre `≅ℂ`, `C²=0`; `A` central and proper; `G/A≅ℂ²`; fibre `ℂ/(Γ∩A)` a torus | Pass |
| Unimodular symplectic normal form | `[[0,2],[−2,0]]`; empty basis | det 4, `ω(x,−)` image `2ℤ`; `r=0` | Pass |
| Genus dictionary Checks | `ℂ/(ℤ+τℤ)`; disjoint union | cup matrix `[[0,1],[−1,0]]`, det 1; `H²≃ℤ²` | Pass |

That is 42 rows computed; two statements fail (R02) or have a supplier defect (R01). R03–R08 concern ownership, citations, locators and Checks, not the mathematics of the rows.

## Not verifiable

- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorems 2.3.4–2.3.5. The source is settled as uncertified, so the numbering of the second edition is assumed.
- Griffiths–Harris ch. 0, Wells and Webster are settled as uncertified and were not opened.
- Raghunathan is uncertified and was read only through Sakane's citation (`sakane-parallelisable` line 112–113).
- Bott–Tu Ch. I §6, which DeRhamCohomologyAndDuality §3.1 cites for the relative complex, is not in this roadmap's manifest and was not opened.
- Nakamura's computation, which Angella cites, was not opened.
- The heads of #1398 and #1808 were not read beyond the conflicts that the overlap computation reports. #1807 and #1854 were read only for TopologicalKTheory and CKG.
- The adversarial rows check instances; they are not proofs.

## Source issues

- **Misprint** in demailly-agbook at Chapter II, (4.1), p. 91: the definition names the local equations `g₁,…,g_n` and then writes the zero set and the equations with `g₁,…,g_N`; it should use `N` throughout (`n` is the ambient dimension elsewhere); affects nothing.
