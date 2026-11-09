# Review of TangentialBordism (pull request #942 at 993f5f4)

**Verdict:** needs changes

This is a full review of the same head that the previous review read (0 changed lines in the folder). Of the previous review's two findings, the AlgebraicTopology 8.13 one is repaired, because #1652's head now defines 8.13. The DifferentialGeometry 5.5b one is not repaired. Reading the whole README independently turned up one missing hypothesis (R01, P2) and four further P3 items. The gate, the dependency check, the elaboration and the padding probe pass.

## R01 (P2) — Parametric transversality states no countability hypothesis on its source

**Location.** `TauCetiRoadmap/TangentialBordism/README.md:503–510`: "if M is such a source, F:M×S→N is smooth, with S and N without boundary … then the s∈S for which F(−,s) fails to be transverse to Z on some stratum form a `TauCeti.IsNullSet` in S". The preamble at `:408–410` reads "with the countability hypothesis it states", and this theorem states none. "Such a source" refers to the three source classes at `:500–502`. The Lindelöf hypothesis appears only in the Sard bullet.

**Claim.** For every boundaryless, half-space or face-structured M, the bad parameters form a null set.

**Witness.** Take M=ℝ with the discrete topology: a boundaryless, Hausdorff 0-manifold that is not Lindelöf. Take S=N=ℝ, Z={0} and F(m,s)=s−m. Then ∂F/∂s=1, so F⋔Z. Each slice F(−,s) has rank 0 and hits 0 at m=s. So every s is bad, and the bad set ℝ is not null. AlgebraicTopology 8.13 (#1652 head 456e2cb, `README.md:3800`) uses that "M×S is second countable".

**Repair.** At `:504`, write "if M is such a source and is Lindelöf (in particular second countable)". On ℝ_δ the new hypothesis fails. For Lindelöf M and a chart domain S₀ of S, the source F⁻¹(Z)∩(stratum×S₀) of the projection is second countable, so `isNullSet_image_criticalPoints_of_boundaryless` applies, as the route at `:511–513` intends. Relative transversality (`:544`) is unaffected: it inherits sigma-compactness from the smoothing theorem's M.

## R02 (P3) — Degree-six integral realization is Thom's Corollaire III.7, which 10.1 does not cite

**Location.** `README.md:2756–2763`: "Thom, Théorèmes III.2 …, III.3 (integral, degree at most five) and III.4 …, p.59; … Degree six, the pairs and arbitrary CW targets, and the operation identities of the lens-space example are proved by the explicit AHSS and operation calculations above."

**Claim.** The README presents degree six as having no source and proves it fresh.

**Witness.** `thom1954` lines 1911–1913, on journal p.62 (folio "62" at line 1944): Corollaire III.7 says that every integral homology class of dimension 6 of a finite polyhedron is the image of the fundamental class of a compact differentiable manifold.

**Repair.** In the locator sentence, add "Corollaire III.7, p.62 (integral, degree six)" after III.3. Then say that the AHSS argument of this item extends degrees five and six to pairs and arbitrary CW targets. The 0≤n≤6 range at `:2719` is unchanged.

## R03 (P3) — 3.3 (B2.3) states the homology-theory package with no locator

**Location.** `README.md:998–1018`. The item constructs the boundary map, the pair and triple long exact sequences, excision, Mayer–Vietoris, disjoint unions and filtered CW continuity. Its only source sentence is negative: "it is not asserted to be the coefficient theorem of Thom IV.8".

**Claim.** That geometric bordism over spaces is a homology theory carries no locator, although the house rules require a locator for every theorem.

**Witness.** `freedBordism` line 4243 (Lecture 12, p.103): bordism of maps Ω_•(X) satisfies all the homology axioms. Miller (`c70bf1f2`, the institutional copy in the References), lines 392–407 (Chapter 1, §4, Theorem 4.2 and the remark after it, p.10): N_*(−) is a homology theory.

**Repair.** Add one sentence: "That bordism of maps is a generalized homology theory is Freed, *Bordism: Old and New*, Lecture 12, p.103, and, for O through the Thom spectrum, Miller, Chapter 1, §4, Theorem 4.2 with the remark after it, p.10. The pair, collar and arbitrary-CW constructions here are proved from B1." Both texts are already listed in the References.

## R04 (P3) — The description's dependency paragraphs miss #886 and still list a closed #1663

**Location.** The pull-request description, revision paragraph: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1652". The "depends on" list and the merge-order paragraph name #1663 (AlgebraicTopology). The README cites DifferentialGeometry 5.5b at `:79–80`, `:320`, `:414`, `:462`, `:614` and `:840`.

**Claim.** The description names every open revision whose numbering the README cites, and only open ones.

**Witness.**
- 5.5b occurs 0 times in DifferentialGeometry on main. It is defined at #886 (head 3d4316f) `README.md:38` and `:83`, and `scratch/overlaps.md` reports the same lead. The description contains no "886".
- `roadmaps show AlgebraicTopology --pr 1663` finds no open pull request. 8.13 is now at #1652 `README.md:3702`.

**Repair.** No README change. Edit the description:
- Write the revision paragraph as "#886 (DifferentialGeometry 5.5b), #903 (GeometricTopology 1.1, 4.3.1, 11.3), #1652 (AlgebraicTopology Layers 2, 4, 6, 8 and 8.13)".
- Remove #1663 from "depends on" and from the merge-order chain.

GeometricTopology 1.1, 4.3.1 and 11.3 are likewise absent on main (0 hits) and present only at #903 (`:788`, `:2430`, `:7887`). The description links #903 only inside its Arf paragraph, so add it to "depends on" as well. This finding carries over the previous review's R02, which is unrepaired.

## R05 (P3) — gap:finite-quadratic-arf is called a declared gap, but no plan declares it and the supplier section exists

**Location.** `README.md:94–97`: "the finite algebra this roadmap needs is declared as the supplier gap gap:finite-quadratic-arf …, the only gap this roadmap declares". The slug also appears at `:321`, `:334`, `:352`, `:372`, `:391`, `:400`, `:2264`, `:2268` and `:2291`, and at `Suggested.lean:24–26`.

**Claim.** GeometricTopology lacks the algebra, and the gap is declared where the intake reads it.

**Witness.** There is no design `plan.json` for this roadmap; the board package holds only reports and `sources.toml`, so the brief records "none declared". GeometricTopology #903 `README.md:2430–2443` (4.3.1) states every item of the `:334–347` contract, the m=0 count included. Its `:8024` reads "TangentialBordism consumes … Layer 4.3.1's finite quadratic Arf algebra".

**Repair.** Cite "GeometricTopology 4.3.1" as an ordinary supplier section, as the README already does for 1.1 and 11.3 of the same revision.
- Retitle `:334` "What is consumed from GeometricTopology 4.3.1" and keep its text.
- Replace "gap:finite-quadratic-arf" by "GeometricTopology 4.3.1" at the lines listed under Location.
- Delete "the only gap this roadmap declares".
- Change the docstring sentence to "The finite quadratic Arf algebra consumed by Layer 1 is GeometricTopology 4.3.1's and is not stated here."

## R06 (P3) — The layering argument omits S2.2's route to BordismFormalGroups, and miscounts which BordismFormalGroups layers consume this roadmap

**Location.** `README.md:3106–3110`: "These consumers provide no prerequisite of the targets above, except … BordismFormalGroups F3–F5, which consume B4.1–B4.2, B4.4–B4.8 and B5.4, are inputs of StringOrientation S2.3's stem … and S5.3's Hovey splitting". The same claim appears at `:33–40`.

**Claim.** BordismFormalGroups reaches this roadmap's prerequisites only through S2.3 and S5.3, and only from F3–F5.

**Witness.**
- B5.4 needs S2.2 (`:1665`). S2.2's *Needs:* reads "S1.2, S2.1" (#948 `README.md:603`). S2.1's reads "EllipticCohomology E5" (`:549`).
- E5 "use[s] BordismFormalGroups F4" (EllipticCohomology main `:1730`).
- BordismFormalGroups F2 consumes "TangentialBordism's geometric MU comparison" (main `:188`). This README's own `:1917` already says F2 consumes B4.8.

**Repair.** At `:33–40` and `:3106–3116`:
- Write "BordismFormalGroups F2–F5".
- Add: "Of S2.2 only the isomorphism Ω^θ_n≅π_nMθ for a general bundle diagram is consumed. Its route (#948 `README.md:557–562`: GeometricTopology Layer 1 tubes, Thom transversality, G5, C2) uses neither S2.1 nor EllipticCohomology E5, which S2.2's *Needs:* lists for its String ring application."

Along that route no target-level cycle exists, so only the stated argument needs repair.

## Previous findings (~20)

- **R01 (AlgebraicTopology 8.13 only at #1663): repaired.** #1652's head 456e2cb now defines `### 8.13 Smooth representatives in codimensions one and two` (`README.md:3702`). Its smoothing is stated for "a boundaryless sigma-compact Hausdorff second-countable smooth manifold M", and its `:91` and `:3741–3743` say that B1.6 consumes all three theorems for boundaryless sources and extends them facewise. The description names #1652. The leftover #1663 mention is part of R04.
- **R02 (DifferentialGeometry 5.5b only at #886): not repaired.** The description still contains no "886". See R04.

## Verified sound

### Gate, dependency check, elaboration and probes

- **Gate**, rerun with `--base origin/main` at 993f5f4:

  ```text
  gate TangentialBordism: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```

- **Dependency check** (`--movable`):

  ```text
  depcheck: 239 roadmaps, 2320 edges, 0 problem(s)
  ```

  There is no UPWARD or CYCLE line. TangentialBordism is line 14 of the merge order, after IndexTheory (10), StringOrientation (11), SmoothBundlesConnections (12) and PseudodifferentialOperators (13). `grep` finds none of the never-cite roadmaps (HomotopySpheres, SurfaceTopology, QuaternionicModularForms, …) in the README.
- **Files and changes outside the folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.AT"`). The policy-word scan (optional, deferred, removed, upstream, pending, TODO) is empty, and so is the scan for `lemma`, `set_option` and `#eval`.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 7 s with exactly six `sorry` warnings (`:70`, `:90`, `:108`, `:124`, `:153`, `:171`).
- **Padding probe.** On a scratch copy, each `sorry` was replaced by `first | simp | infer_instance | rfl | trivial | aesop`. All six fail: `aesop` makes no progress at `:82`, `:100` and `:116`, and goals stay unsolved at `:144`, `:165` and `:178`. No declaration restates a definition or mirrors a Check.
- **Signatures.** The file has no section `variable`s, so no binder can be lost. The elaborated types in `scratch/signatures.md` match the README statements (`:450–463`, `:520–528`, `:2342–2356`, `:2382–2389`). The "structure `,`" entry there is the docstring phrase at `:151`, not a declaration.
- **`#check` probe.** 42 pinned declarations elaborate, among them:
  - `Continuous.exists_contMDiff_approx_and_eqOn`: any `I`, with `[FiniteDimensional ℝ E] [SigmaCompactSpace M] [T2Space M]` and target an arbitrary normed space;
  - `exists_embedding_euclidean_of_compact` (`[T2Space M] [CompactSpace M]`, any model);
  - `TauCeti.isManifold_boundary` (`hk : k ≠ 0`, half-space n+1);
  - `TauCeti.boundaryOrientation` (`IsManifold (𝓡∂ n+1) 1`);
  - `TauCeti.Manifold.Orientation.IsOrientationPreservingAt`, defined at `Preserving.lean:63` as a linear equivalence equal to `mfderiv` that maps `orientationAt`;
  - `sigPos`, `Rep.FiniteCyclicGroup.groupHomologyIsoEven`, `ChartedSpace.secondCountable_of_sigmaCompact`, `TauCeti.orientable_closedBall`, `TauCeti.IsSmoothTriangulation`, `AbstractSimplicialComplex.realizationCWComplex`, `skeletonLT_realizationCWComplex`, `TauCeti.localOrientationOfManifoldOrientation(_neg)`, `TauCeti.reducedSingularHomologySphereIso`, `Orientation.eq_or_eq_neg_of_isEmpty`, `Orientation.map_of_isEmpty`.
- **Unbuilt modules, read at the pin.**
  - `addHaar_image_criticalPoints_eq_zero` (`Analysis/Calculus/Sard/OutermostStratum.lean:347`): `ContDiffAt` at every point of `U`, and `(finrank E)²+1 ≤ n`.
  - `isNullSet_image_criticalPoints` and `dense_isRegularValue` (`Sard/EqualDimension.lean:105`, `:112`): `hdim : finrank E = finrank E'`.
  - `ContMDiff.isMeagre_image_criticalPoints` (`Sard/Meagre.lean:114`): `[I.Boundaryless] [J.Boundaryless]`, meagre conclusion.
  - `exists_diffeomorph_normalBundle_subset` (`TubularNeighborhood/Existence.lean:53`): `[I.Boundaryless] [J.Boundaryless] [T2Space N] [SecondCountableTopology N]`.
  - `exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`): any model, sigma-compact.
  - `pontryaginThomSphereMap` (`PontryaginThom/Basic.lean:217`).
  - `exists_isFramedTube` (`PontryaginThom/Existence.lean:68`).

  All carry the hypotheses the README states.
- **Duplication.**
  - `roadmaps grep --fixed --lean-only` finds none of the six names outside this roadmap.
  - The pins have no manifold transversality predicate: Tau Ceti's `Transvers*` hits are combinatorial, and Mathlib's are comments. The docstring's "not statable" for parametric and relative transversality therefore holds.
  - Unequal-dimension manifold Sard is at neither pin.
- **Lean form.** One module docstring names the roadmap and each not-statable headline with its missing carrier. The file has `namespace TauCetiRoadmap.TangentialBordism`, Layer 2 and Layer 8 section comments, a docstring on every declaration and `theorem` only. Imports are `import Mathlib` plus six `TauCeti.*` modules, all existing at pin 2fd255d99 and all used.
- **Octonion volume witness (9.2).** I computed it with the pinned Cayley–Dickson product (`Algebra/CayleyDickson/Quaternion.lean:17`, ⟨a,b⟩⟨c,d⟩=⟨ac−d̄b, da+bc̄⟩). C₀C₁⋯C₈(1,0)=(−1,0), and with −C₈ in place of C₈ it is (1,0). All nine generators square to +id, and all 36 pairs anticommute. This is the Check at `:2627`.

### Seeded sample (15 targets)

Cached texts that the manifest lacks are cited by hash prefix: `c70bf1f2` (Miller, institutional copy in the References), `f8087fb9` (Baez arXiv v4) and `84114d0a` (Borel–Hirzebruch, from the README's MPIM link). Printed page = PDF page − 5 for Miller. In `thom1954` the folio is the last line of each scanned page.

| Target | Locators checked | Text at the locator | Result |
| --- | --- | --- | --- |
| 2.3 (B1.5) | Munkres 10.6 p.104; GT 1.1, 11.3; SBC B1.4; Tau Ceti carriers | Munkres not verifiable (below); GT #903 `:7887` 11.3 Cairns–Whitehead on `TauCeti.IsSmoothTriangulation`, `:809` interior inclusion a homotopy equivalence; SBC main B1.4 (`:31`); carriers elaborate | Pass |
| 3.3 (B2.3) | AT Layers 2–4 | AT #1652 (456e2cb) Layer 2 `:774`, Layer 4 `:983`; no source for the homology-theory statement | R03 |
| 5.1 (B5.1) | Thom IV.6 p.74, IV.8 p.75; Miller Ch.1 §§2–3 pp.3–7, Ch.2 §1 pp.39–41; G5.2–G5.3; C1–C2 | `thom1954` 2410 (IV.6 in §4 at 2195, folio 74 at 2424), 2462 (IV.8, folio 75 at 2464); `c70bf1f2` 233–294 (collapse to MO(k)∧X₊, stabilization, bordism invariance, p.6–7), 1453/1538 (Ch.2 Defs 1.1, 1.3, pp.39–41); GC main G5.2 `:2470`, G5.4 `:315` | Pass |
| 5.3 (B5.3) | Thom IV.8; S2.2; G2.10; C1 | `thom1954` 2462; SO #948 `:551` S2.2; GC main `MappingPathSpace` `:542`; CC main C1 `:212` | Pass |
| 5.5 (B5.5) | Miller Ch.2 Thm 1.4 p.41; Ch.1 §1 pp.1–2, §5 pp.12–14; S2.3 | `c70bf1f2` 1565–1566 (Thm 1.4 (Thom): Ω^G_*(X)≅MG_*(X), PDF p.46 = p.41), 95–109 (Defs 1.1–1.2, p.2); SO #948 `:607` S2.3 | Pass |
| 5.7 (B5.7) | Hatcher SS §1.1 pp.18–19 | `hatcherSS` 997–1011 (general homology theory, finite-dimensional base, E²=H_p(X;h_q(pt)), "Atiyah–Hirzebruch"), 1012–1030 naturality | Pass |
| 6.1 (B4.4) | Miller Thms 12.3–12.4 pp.32–34 | `c70bf1f2` 1239 (12.3, H*MO free over A, PDF 37 = p.32), 1261 (12.4, MO a graded EM spectrum, p.33) | Pass |
| 6.4 (B4.8) | Milnor 1960 §4 Thms 4–5 p.519; C3.3, C3.6; G3.9, G5.4 | Milnor not verifiable; CC main C3 item 3 (Whitney correction, multiplicativity over ℤ[1/2]), C3.6 `:1394`; GC G3.9 `:2583`, G5.4 | Pass (Milnor not verifiable) |
| 7.1 (B3.0) | ABS §§10–11; SpinGeometry G5.0, G6.0; GC G3.8, G5.5; IT I2.5, I5.4; PDO P5–P6; CC C6 | ABS not verifiable; SG main `realCliffordSpinorBundle` `:506`, `realSpinDiracClosedRealization` `:586`, `realSpinDiracIndexClass` `:655`; GC `spectrumConnectiveCover` `:797`, `realMixedCliffordIndexClassification` `:2084`, `realNegativeCliffordFamilyIndex` `:2099`; IT #1077 I2.5 `:648`, I5.4 `:1187`; CC C6 `:1731` | Pass (ABS not verifiable) |
| 8.1 (B3.2(b)) | Atiyah Thm 2 p.48; Thm 5 pp.59–60; SG G4.3–G4.4, G6 item 5 | `atiyahSpin1971` 75–77 (Thm 2, quadratic with cup-product polarization; scan page 3 = p.48, the paper running pp.47–62 per line 21), 462–492 (Thm 5 and proof, pp.59–60); SG main G4 `:395`, G6 `:569` | Pass |
| 8.2 (B3.2(c)) | Atiyah Prop 4.1, Thm 3′ p.58 | `atiyahSpin1971` 415–433 (Prop 4.1: f(s)=0 iff Spin boundary; Thm 3′: 2^(g−1)(2^g+1) bounding structures), page header "58" at 415 | Pass |
| 8.3 (B3.3) | BC Fig. 31 p.41; Freed (5.57) p.45; Hatcher AT §4.2 p.385; S2.3; T7; G3.8, G5.4 | `beaudryCampbell` 1741 (MSpin row ℤ, ℤ/2, ℤ/2, 0, ℤ), 1752 (Figure 31, page 41); `freedBordism` 1805–1817 (Prop 5.55; (5.57) T represents the generator in degree 1, page 45); `hatcherAT` 16729–16752 (p.385: η³=4ν 2-primarily, η³=12ν in π₃S≈ℤ₂₄) | Pass |
| 9.1 (B3.6) | Baez §§3.4, 4.2; S1.5; LHW Layer 8 | `f8087fb9` 1297 (3.4 OP² and the exceptional Jordan algebra), 1425 (trace-1 projections are the points), 1768 (4.2 F4); SO #948 `:458` S1.5; LHW main `compactAlbertAlgebra` `:1333`, `DivisionOctonionReal` `:1261` | Pass |
| 9.4 (B3.9) | Borel–Hirzebruch I §15.5 (13) p.519; S1.5; I7.2 | `84114d0a` 2406–2417 (p.519: p(P_(q−1)(K))=(1+u)^(2q)(1+4u)^(−1), u represented by x₁², a generator of H⁴), 2418–2420 (15.6: p₁=(2q−4)u); IT #1077 I7.2 `:1371` | Pass |
| 10.1 (B6.3) | Thom III.2–III.4 p.59, III.9 and L⁷×L⁷ pp.62–63; ClassifyingSpaces Stage 4; `groupHomologyIsoEven` | `thom1954` 1818–1828 (III.2, III.3 dimension ≤5, III.4; folio 59 at 1834), 1936–1938 (III.9, r≥7), 1939–1961 (example), **1911–1913 (Corollaire III.7, degree 6, p.62)**; CS main Stage 4 `:74`, `groupHomology` `:44` | R02 |

The README flags no locator as unverified.

### Adversarial mathematics table

| Statement | Instances | Values computed (each side) | Result |
| --- | --- | --- | --- |
| `exists_contMDiff_homotopicRel` | M=∅; C=U=M, f smooth; M=P=S¹, f=id, C=∅; P a point; cone source | g=∅. g=f with constant homotopy. A smooth g≃id has degree 1, a constant degree 0. P=pt: V=ℝ⁰=W, ε=1, g constant. The approximation lemma takes any `I`, so the cone model is admitted. | Pass |
| `isNullSet_image_criticalPoints_of_boundaryless` | pt→ℝ²; ℝ²→ℝ projection; dim N=0; dim M=0 | crit={pt}, image one point, null. crit=∅, image ℝ not claimed. Into {0}: mfderiv is surjective, crit=∅, and ∅ is what is claimed (a Haar measure on {0} is a point mass). dim M=0 and Lindelöf: M countable, so the image is countable and null in ℝ^k, k≥1. | Pass |
| `isNullSet_image_criticalPoints_halfSpace` | n=1, M=[0,∞): f=t², f=t; ℝ²_δ×[0,∞), f(c,t)=c | t²: critical values {0}. t: 0 regular for f, critical for f restricted to {0}, so crit(f)⊆∪crit(restrictions) holds and its converse fails (`:605`). Non-Lindelöf case: every point critical, image ℝ², not null, so `[LindelofSpace M]` is needed. | Pass |
| Parametric transversality (`:503–519`) | M=ℝ_δ, S=N=ℝ, Z={0}, F(m,s)=s−m | F⋔Z (∂_sF=1). The slice at s has rank 0 and F(s,s)=0, so the bad set is ℝ, Lebesgue measure ∞ ≠ 0. | **R01** |
| `orientedThreeManifold_parallelization` | ℍ³ frame; negated first vector; RP²×ℝ; ∅; S²×S¹ | det=1; det=−1 (excluded). RP²×ℝ has no oriented atlas, so `hA` is false. Empty frame. S²×S¹ is parallelizable and the frame is flipped on negative components. | Pass |
| `closedOrientedManifold_isOrientedBoundary` | n=1 S¹ with ±o; n=2 Σ_g; n=3 T³; n=0; n=4; M=∅ | D² with ±o (`boundaryOrientation_neg`); handlebody; T²×D². A point has signed count 1≠0 (excluded by 1≤n); σ(CP²)=1≠0 (excluded by n≤3); W=∅. | Pass |
| `closedManifold_isBoundary` | n=1; n=3; Thom's table | S¹⊔S¹=∂(D²⊔D²); RP²×S¹=∂(RP²×D²). 𝔑₀…𝔑₇ = F₂, 0, F₂, 0, F₂², F₂, F₂³, F₂ (`thom1954` 2615–2640), so {1,3} is the zero set below 8. RP² has χ=1, odd, so n=2 is excluded. | Pass |
| 8.4 table (B3.1) | SW numbers; Spin row | RP⁴: w=(1+a)⁵=1+a+a⁴, (w₄,w₂²)=(1,0). RP²×RP²: w₂=a²+ab+b², w₂²=a²b², (1,1). CP²: w=1+h+h², (1,1). Spin ℤ, ℤ/2, ℤ/2, 0, ℤ as in BC Fig. 31. | Pass |
| 2.3 Checks | ℤ on ℝ; S¹ on S³; mapping tori; disc bundles; interval | ℝ/ℤ=S¹; S³/S¹=CP¹ with fibre S¹; id gives T², a reflection gives the Klein bottle (w₁≠0); [−1,1] has 2 boundary points; rank-0 disc a point with ∂=∅; interval: 2 vertices, 1 edge. | Pass |
| 3.3 Checks | ([0,1],{0,1}); (X,X); infinite discrete X | ∂[0,1]=[1]−[0] ↦ (−1,1)∈ℤ², sum 0; relative groups of (X,X) are 0 by the pair sequence; finite support gives ⊕, not ∏. | Pass |
| 5.1/5.2/5.3 | n=0, k=1; B={a,b} | A positive point collapses to a degree-1 map S¹→S¹; reversed framing −1; ∅ ↦ basepoint. Th=S¹∨S¹: (a+,b+,a−,b−) ↦ aba⁻¹b⁻¹≠1 in F₂; (a+,a−,b+,b−) ↦ 1; abelianized counts (0,0). | Pass |
| 5.5/5.6 | +pt, −pt, ∅, ∂[0,1]; graph embedding i=(g,j):N^d→P^e×ℝ^r | Degrees +1, −1, 0, 1−1=0 in π₀S=ℤ. rank ν_i=r+e−d, and n+r−(r+e−d)=n+d−e; id gives 0; pt→S¹ gives −1. | Pass |
| 5.7 Checks | X=pt; total degree 0; X={x,y} | E²_(p,q)≠0 only at p=0; only (0,0) for connective coefficients; H₀={Ω₀}². | Pass |
| 6.1 multiplicities | degrees 0–4 | Monomials in x₂,x₄,x₅,…: 1, 0, 1, 0, 2 (x₄, x₂²); π₀MO=F₂. | Pass |
| 6.3 Newton numbers | H_R(2,4); H_R(1,2) | d=2+4−1=5, binom(6,2)=15≡1. H_R(1,2): w=(1+x)²(1+y)³(1+x+y)⁻¹ has w₁=x, w₁²=0, so s₂=0 against binom(3,1)≡1. w₁(TH)=mx+ny≡0 for m,n even. | Pass |
| 6.4 (B4.8) | p=3, p=5 | v₀ (1,1) stem 0; v₁ (1,5) stem 4 at p=3, stem 8 at p=5. C at p=3 omits k=1,4 (2k+1=3, 9), so the series is 1+t⁸+t¹²+t¹⁶+⋯. dim H₄(MSO;F₃)=1=ξ₁. | Pass |
| 6.5 | H_C(2,3), CP⁴, H_C(1,1) | −binom(5,2)=−10; s₂[CP⁴]=5; gcd(5,10)=5; CP¹: c₁=2 against −binom(2,1)=−2, so m,n≥2 is needed. | Pass |
| 7.1/7.2 genus | K3; K3×K3; Lie circle; sign | Â=−p₁/24=48/24=2, c(α)=2u²=c(a), α=a. a²=4b. η∈KO₁=ℤ/2 with KU₁=0. α(M)=k·a with 2k=−σ/8 gives k=−σ/16; σ(K3)=−16 gives k=1, matching σ=−16α_ℍ (IT #1077 `:1530`). | Pass |
| 8.1/8.2 | Lie torus; two copies; S²; g=1 count | q(a)=q(b)=1, q(a+b)=1+1+1=1, Arf=1. 1+1=0. H₁(S²)=0, Arf 0. 2⁰(2¹+1)=3 of 4 torus structures bound, the Lie one does not. | Pass |
| 8.3 η³ | ℤ/24 | ord(4ν)=24/gcd(4,24)=6; ord(12ν)=2; 12 mod 8=4, which is h₀²h₂. Ext stems 4–5 are zero, so nothing enters or leaves stems 1–3. | Pass |
| 8.5 Hopf derivative | q=1+j(x+iy) | q=1+jx−ky; εi−iε=−2xk−2yj; in basis (j,k) the matrix [[0,−2],[−2,0]] has det −4<0, so degree −1. | Pass |
| 9.1 charts | P(0,0); P(1,0); transition; split null a | diag(1,0,0). Entries 1/2 and P²=(N(v)/D²)vv*=(2/4)vv*=P. Chart 1 is (x̄/N(x), yx̄/N(x))=(x⁻¹, yx⁻¹). Split case: A²=A, tr A=1 for every t (unbounded). Compact case: 1+2t²N(a)=1 forces ta=0. | Pass |
| 9.2 volume | pinned octonions | C₀⋯C₈(1,0)=(−1,0); with −C₈: (1,0); squares +id; 36 anticommuting pairs. | Pass |
| 9.3 L₄ | p₂=6u, p₄=39u² | (381·39−19·36)/14175=(14859−684)/14175=1. | Pass |
| 9.4 HP^k | k=1, 2 | (1+u)⁴(1+4u)⁻¹≡1 mod u². (1+6u+15u²)(1−4u+16u²)=1+2u+7u². (7·7−2²)/45=1. BH p₁=(2q−4)u=2u at q=3. | Pass |
| 4.1 integral cup₁ identity | a=c (deg 2), b=δc (deg 3) | From dD₁+D₁d=AW−T·AW: δ(a⌣₁b)=a⌣b−(−1)^(|a||b|)b⌣a−δa⌣₁b−(−1)^(|a|)a⌣₁δb, which gives c⌣δc−δc⌣c−δc⌣₁δc (`:1084`). | Pass |
| 10.1 range and example | d₅ on H₆; L⁷×L⁷ | d₅: E_(6,0)→E_(1,4). H₆(BC_m;ℤ): the complex ℤ→ℤ→ℤ with maps 0 and m has middle homology ker m=0. X·Y=(u₁v₂u₂²−v₁u₂³)(u₁³v₂−v₁u₂³)=−v₁v₂u₁³u₂³ (v_i²=0, u₂⁵=0 on L⁷), and −1≡2 mod 3. Thom states degree 6 as Corollaire III.7. | Pass, R02 |
| 10.4 Newton family | n=2, r=0; n=3, r=0, 1 | −2(binom(4,2)−1)=−10; −2(binom(6,2)−1)=−2(binom(6,4)−1)=−28; 28=2²·7 with a=2 at n=3=2²−1 and 7=2n+1. | Pass |
| Supplier layering | B5.4 → S2.2 → S2.1 → E5 → BFG F4; BFG F2 → B5.4c | Edges at #948 `:603`, `:549`; EC main `:1730`; BFG main `:188`. The consumed general-θ route (#948 `:557–562`) uses none of S2.1/E5. | R06 |

### Cross-roadmap citations resolved

- **Main (f060790):**
  - GeneralizedCohomology G2.10, G3.3, G3.8, G3.9, G4.0a, G4.5, G5.2, G5.4, G5.5 (lines above).
  - CharacteristicClasses C1 (item 3: finite faithful unitary representation and Stiefel approximations of BG; item 4: smooth representatives with relative homotopy), C3 item 3, C3.6, C6, C7.3a.
  - TopologicalKTheory T5, T7; PseudodifferentialOperators P5, P6; SmoothBundlesConnections B1.4; ClassifyingSpaces Stage 4.
  - LieHighestWeight `compactAlbertAlgebra` (`:1333`), `compactAlbertDerivation_complexification` (`:1391`), `compactAlbertDerivation_killing_negDef` (`:1398`).
  - RiemannianGeometry R1; DGFloer Layer 1; DGAInfinity Layer 0; AffineMorseLefschetz A0, A5, A6; ComplexKahlerGeometry K7.1; SpinGeometry G4, G5.0, G6, G6.7 (`:831`).
- **Open heads:**
  - StringOrientation #948 (07f0981): S1.3 `:366`, S1.5 `:458`, S2.2 `:551`, S2.3 `:607`, S5.3 `:1158`. Its consumers paragraph (`:1410`) lists exactly the items this README consumes.
  - IndexTheory #1077 (6d85f5d): I2.5 `:648`, I5.4 `:1187`, I7.2 `:1371`, I7.5 `:1514`.
  - AlgebraicTopology #1652 (456e2cb): 8.13 `:3702`.
  - GeometricTopology #903 (5859c0d): 1.1 `:788`, 4.3.1 `:2430`, 11.3 `:7887`.
  - DifferentialGeometry #886 (3d4316f): 5.5b `:38`, `:83`.
- **Ownership against open pull requests.**
  - FourManifolds #936 consumes B1.7, B3.2(b)–(c), B4 and 5.2, and owns only the Pontryagin square.
  - CalibratedGeometry #946 consumes B1.5 (`:755`, `:771`).
  - HomotopySpheres #1287 consumes B1.1–B1.2, B1.6 and B5.2 (`:1768`) and owns none of them. Its `:113` and `:483` describe B1.6's Sard as covering all corner sources, wider than the boundaryless, half-space and face-structured classes owned here; that citation is #1287's to narrow.
  - HomotopySpheres #284 (a draft by another author, superseded in vocabulary by #1287) claims "framed bordism and the low stable-stem calculation" (`:70`, `:43`). The settlement is a citation from HomotopySpheres, which comes later in the order and which this roadmap may not cite. No change here can resolve it.
  - The GeneralizedCohomology change in #1187 is a pin bump; it touches nothing this README cites.
- **Overlaps.** No open pull request changes this roadmap or drops an id it cites. The "only an open revision defines" leads resolve to #886 (R04), #1652 (named) and #903 (R04).

## Not verifiable

- **Munkres**, *Elementary Differential Topology*, Theorem 10.6, p.104 (2.3, sample). This is a Princeton Annals of Mathematics Studies volume with no legal copy in the cache. GeometricTopology #903 `:7887–7892` cites Theorems 10.5–10.6 for existence and PL uniqueness of smooth triangulations, which is consistent with the README's use, but the boundary-extension clause is unchecked.
- **Milnor**, *On the cobordism ring Ω\* and a complex analogue, Part I*, §4, Theorems 4–5, p.519 (6.4, sample). The sources service reports that the landing page at jstor.org is on a host in no licence class.
- **Atiyah–Bott–Shapiro**, *Clifford modules*, §§10–11 (7.1, sample). Elsevier (Topology 1964), paywalled.
- **Lee**, *Introduction to Smooth Manifolds*, Theorems 6.10, 6.26, 6.35, 6.36, 21.10 and 21.13 (2.1, 8.5). Springer, paywalled. A copy on a personal host appears in the shared cache, but I did not use it, since it is not a legal copy.
- **McCleary**, Theorem 6.21 (4.4). Cambridge, paywalled; cited through Guillou–Weibel's Theorem 6.2.

## Source issues

- none
