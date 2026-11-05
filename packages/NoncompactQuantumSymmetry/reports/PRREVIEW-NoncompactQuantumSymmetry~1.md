# Review of NoncompactQuantumSymmetry (pull request #1015 at 72e22bd)

**Verdict:** needs changes

## R01 (P2) — Use HilbertModules H3/H5 instead of rebuilding them

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:13`, P.7 at line 462, P.8 at line 523. The ownership sentence says “The Hilbert-module theory used with it is owned here”.

**Claim:** NQS owns interior tensor products, correspondence induction, the Rieffel correspondence, C₀(X)-algebras and continuous Hilbert fields.

**Witness:** `TauCetiRoadmap/HilbertModules/README.md:262` constructs interior tensors; line 310 states Rieffel correspondence; lines 355 and 398 construct C₀(X)-fibres and Hilbert-field reconstruction. OperatorAlgebraDynamics on main already imports H1–H4 at line 43.

**Repair:** Delete the overlapping P.7/P.8 foundational targets and replace their ownership and dependency entries with HilbertModules H3/H5, using its right-module/opposite-algebra convention. Keep only genuinely additional NQS-specific adapters, stating their difference. HilbertModules precedes this roadmap in the supplied order. The existing Checks survive unchanged: for the M₂(ℂ)–ℂ module ℂ², induction sends dimension 1 to dimension 2 and matches two ideals with two ideals; the zero left action gives the zero tensor product. H5 also supplies the distinction between upper semicontinuous and continuous fibre norms. These are the same objects, not two conventions requiring separate libraries.

## R02 (P2) — Resolve Whitehead ownership and include any retained general theorem

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:351` and `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:12`.

**Claim:** P.4 owns both Whitehead lemmas over every characteristic-zero field, but neither theorem occurs in the acceptance test. The docstring accounts only for the missing imprimitivity theorem.

**Witness:** Both full signatures elaborate with `import Mathlib`, using `LieModule.Cohomology.d₁₂` and `twoCocycle`. `TauCetiRoadmap/AffineLieAlgebras/README.md:107` already assigns degree-one/two vanishing for finite-dimensional modules in its complex classification setting.

**Repair:** First cite AffineLieAlgebras A1 for the overlapping complex case; do not plan it a second time. If retaining the broader field/semisimple theorem, explicitly identify that extension and state it in `Suggested.lean` on the existing cochains. The following two conclusions were elaborated with the complete binders `[Field K] [CharZero K] [LieRing L] [LieAlgebra K L] [FiniteDimensional K L] [LieAlgebra.IsSemisimple K L] [AddCommGroup V] [Module K V] [FiniteDimensional K V] [LieRingModule L V] [LieModule K L V]`:

```lean
(f : LieModule.Cohomology.oneCochain K L V)
(hf : LieModule.Cohomology.d₁₂ K L V f = 0) :
  ∃ v : V, ∀ x : L, f x = ⁅x, v⁆

(c : LieModule.Cohomology.twoCocycle K L V) :
  ∃ f : LieModule.Cohomology.oneCochain K L V,
    LieModule.Cohomology.d₁₂ K L V f = c.val
```

No new carrier or stand-in predicate is required. If all vanishing is instead supplied by an existing owner, remove it as an NQS target and record the exact contract. The real-field test remains substantive: on so(3), `f(x)=x×a` is δa; for the trivial module `c(x,y)=a·(x×y)` is d₁₂ of `λ(z)=−a·z`. On abelian ℝ², `c(e₁,e₂)=1` whereas every scalar coboundary is 0, so the semisimplicity binder must remain.

## R03 (P3) — Remove API restatements from Suggested.lean

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:51`, lines 219–231, 416–429, and 563–571.

**Claim:** These declarations belong in the roadmap's acceptance test.

**Witness:** `isAdmissible_iff` is `Iff.rfl`; `quotientProjection_section` is an input field; `dual_smul_apply` is `rfl`; `permutation_algebraic_tprod` is exactly native `PiTensorProduct.reindex_tprod` after unfolding the native action.

**Repair:** Delete these declarations from `Suggested.lean`; retain their mathematical content in README API bullets and Checks, and cite native declarations where appropriate. Also remove definitions left unused by retained headline theorems, such as the admissibility predicates if no admissibility headline is kept. Do not replace this repair with proving the declarations in place. The identity dual action gives χ(n)=χ(n); the trivial permutation gives the same pure tensor on both sides; neither tests a deep theorem. The seven admitted targets were separately tried with `simp`, `rfl`, and `infer_instance`; none closed. This finding does not claim that all seven are one-tactic consequences.

## R04 (P3) — Supply locators for the sampled derived results

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1759`, 1800, 2726, 2972, 3836, 3879, 4488, 6239, 6567, 6862, 7551 and 8399.

**Claim:** These terminal refinements, classifications, topology adapters and tensor formulas are specified as theorem targets with source support.

**Witness:** M2.InducedRefinement at lines 1759–1760 contains no external locator; the Galilei multiplication/cocycle block and the common-subtree-measure theorem likewise give no theorem/section/page locator at their claims.

**Repair:** Give each target an exact source locator. For a new combination of established results, identify it as the derived result and attach precise locators to its external ingredients, with named local dependencies for the remaining steps. A general bibliography entry does not locate the relevant theorem. Do not manufacture an external theorem number for an original adapter. For example, preserve the Galilei cocycle calculation 1+3=0+4 and the three-leaf probabilities (2/9,5/9,2/9), and make their input routes independently traceable. Source access failures below are separate from missing locators.

## R05 (P3) — Restore the required layer and definition structure

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:1`, 5, 1775 and 8352.

**Claim:** The document supplies the required roadmap structure and per-definition API/Checks/dependency contracts.

**Witness:** There is no `## Exact supplier contracts` or `## How to read the build`; M3–M6 are milestone sections without the required layer-ending Examples/Dependencies. M6.PairField introduces several kernels without a per-definition three-Check list.

**Repair:** Use the specified Summary, Scope and ownership, Conventions, Exact supplier contracts, build-order and Layer headings. Give each definition its API and at least three discriminating Checks, and each theorem its own dependencies. Organize existing calculations rather than deleting mathematical scope. For the pair normalization, suitable discriminators are a one-atom measure (weight 1), two unequal positive atoms (normalization depends on their masses), and the ordered three-atom exhaustion (probabilities 4/7,2/7,1/7). For zero or ineffective fibres explicitly test their removal before normalization. These tests distinguish probability normalization from merely declaring a σ-finite kernel.

## R06 (P3) — Account for every omitted headline in the module docstring

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:12–18`.

**Claim:** The file is a representative selection, with only Mackey imprimitivity explicitly identified as unavailable at the pins.

**Witness:** M2's orbit/little-group classification, M4's Lorentz/Poincaré classifications, M5's full contraction results and M6's irreducible tensor/recoupling theorems have no statements and no individual missing-carrier explanations in the docstring.

**Repair:** Replace the “suggested forms” disclaimer with the required target-signature docstring and list every omitted headline with its precise missing carrier. State any headline that needs only a few simple native definitions, including the retained general Whitehead extension in R02. For genuinely unavailable induced-dual, measurable-field and completed-tensor models, name that limitation instead of substituting their scalar formulas or API fragments. The n=0 and n=1 tensor cases alone cannot test the M6 classification or pentagon theorem.

## Verified sound

The review read both target files through README line 8645 and Lean line 572. The checks below distinguish computed examples, source-supported ingredients and unverified global claims. A successful example is not a proof of exhaustion, a Plancherel theorem or an all-sequence contraction theorem.

**Gate and file scope.** HEAD is the requested commit. The supplied worker gate reports all checks passing, including the targeted build, no forbidden imports, no `set_option`, no sorry-valued data, no stray files and no outside-folder changes. Independent `git diff --stat origin/main...HEAD` excluding this folder is empty; the worktree remains clean. Direct elaboration of `Suggested.lean` succeeds with exactly seven `sorry` warnings and no other warnings/errors. No source passage or roadmap file was changed.

The independent dependency check, using the requested movable/content/order options, reports:

```
depcheck: 207 roadmaps, 1460 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This mechanical result does not detect the duplicated ownership in R01/R02. All eight explicit `*Needs:*` entries were read, together with the opening supplier table and the inline M-layer dependencies. The directions P→M0/M1→M2→applications and smaller-child→parent in M6 are consistent in the inspected routes. No computational algorithm, route-specific “good parameters only” restriction, sorry-valued datum or `set_option` was found in the reviewed files. Boundary families are generally retained explicitly.

**Headlines and signatures.** The README's substantive end results are Wigner reconstruction; Polish/Borel realization and automatic continuity; multiplier/extension comparison and Lie differentiation/integration; Whitehead vanishing; induced Hilbert representations and imprimitivity; compact-type/analytic/admissibility comparisons; Mackey and projective little-group classification; type-I disintegration and parameterized refinement; the full Euclidean/Galilei, Lorentz/Poincaré and de Sitter families; Fell/DNC and all-sequence contraction comparisons including massless dilation; and the complete pair tensor, exchange, finite-tree recoupling and Young-field theorems. P.7/P.8 are supplier-owned foundations, as R01 explains.

The seven admitted declarations are Polish action realization, existence of the induced representation, Young matrix-unit multiplication, the minimal-range/intertwiner comparison, continuity and closedness of the Young range, and measurable projected Gram rank. All 58 declarations, including instances and abbreviations, had their elaborated `@name` signatures printed on a scratch copy. The induced construction retains Hausdorff/lcsc hypotheses, a closed subgroup, the homogeneous-space homeomorphism, a nonzero σ-finite quasi-invariant measure, complete separable fibres, unitarity and strong orbit continuity. Its density is the native RN derivative, not a freely supplied cocycle. The Young continuity/range results retain their explicit isometry hypothesis. No dropped standing hypothesis was found in these signatures.

The scratch signature run's additional `#check Gassmann.almostConjugate_iff_permutation_equiv` fails at the library pin. This is **not** a missing-supplier finding: the exact derived declaration is present in InductionRestriction on main, in its roadmap namespace, and is cited there as its own output. The target's production Lean file does not import or use that future declaration.

**Pinned declarations opened.** Paths in this paragraph are relative to the respective pinned library roots. Mathlib `RepresentationTheory/Continuous/Basic.lean:54` defines `ContRepresentation` as a homomorphism into continuous linear maps: it does **not** require a topology on G or continuous vector orbits. Tau Ceti `RepresentationTheory/Continuous/Unitary/Basic.lean:52` adds inner-product preservation, also without orbit continuity. NQS correctly states orbit continuity separately. Mathlib `Algebra/Lie/Cochain.lean:45`, 101, 123 and 156 supplies alternating 2-cochains, d₁₂, d₂₃ and its kernel; `Algebra/Lie/Semisimple/Defs.lean:105` includes nonabelian simple constituents. Tau Ceti `Algebra/Lie/HighestWeight/CompleteReducibility.lean:110`, 196 and 259 gives complete reducibility over an arbitrary characteristic-zero field: the algebraically closed section has ended before this theorem. Mathlib `LinearAlgebra/PiTensorProduct/Basic.lean:687` and Tau Ceti `RepresentationTheory/Symmetric/TensorAction/Basic.lean:48` explain the padding witness. The native `CStarModule` definition in Mathlib `Analysis/CStarAlgebra/Module/Defs.lean:72` is a substrate, not the full interior-tensor/Rieffel theory.

**Resolved ownership/contracts.** Object searches covered the pinned sources, main, the board package index, and the indexed open-roadmap texts; relevant supplied sibling files were then read. No collision with an existing fully qualified NQS Lean declaration was found. The positive ownership reason for the remaining roadmap is its noncompact measurable induction, actual noncompact duals, contraction and tensor refinements, which the compact, operator and Lie suppliers do not themselves promise. No relocation to a later supplier was made.

| Citation | Resolved location and contract |
| --- | --- |
| HilbertModules H3/H5 | `TauCetiRoadmap/HilbertModules/README.md:260`, 353 at its supplied open head: interior tensor, Rieffel, C₀(X)-algebras and Hilbert fields; duplicated by P.7/P.8. |
| AffineLieAlgebras A1 | `TauCetiRoadmap/AffineLieAlgebras/README.md:107` on main: finite-dimensional Whitehead input for complex current classification. This does not automatically supply NQS's broader arbitrary-field statement. |
| OperatorAlgebraDynamics D1/D3/D5 | Main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:29`, 75, 205, 277: native modular character versus inverse Williams convention; closed-subgroup Green induction; Haar groupoid convolution/disintegration. D3's factor is Δ_G^(1/2)Δ_H^(−1/2), not an invariant-quotient assumption. |
| VonNeumannAlgebras V4.0.Fields/Decomposition | `TauCetiRoadmap/VonNeumannAlgebras/README.md:1125`, 1161 at the supplied head: measurable separable fields, rectangular decomposable maps, square-root RN transport, central decomposition. |
| CStarAlgebras C2.AnnHull | `TauCetiRoadmap/CStarAlgebras/README.md:350`: Ann(I) as the intersection over U_I and hull(Ann(I))=closure(U_I), including I=0 and A=0. This supports M5's compact-support route. |
| SelfAdjointSpectralTheory SA-B85 | Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:676`, 727: general compact multiplication models and nondegenerate C₀(X) specialization; does not itself identify an arbitrary type-I dual. |
| UnboundedOperators UO-B04/B05 | `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:110–111`: strong commutation, joint PVM and U(t)=exp(iΣt_jA_j); physical inverse-time evolution must be translated. |
| InductionRestriction §2.1 | Main `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:372`; `Suggested.lean:728`: almost-conjugacy/permutation equivalence over characteristic zero. The unresolved-name scanner lead is resolved. |
| CompactGroups Layers 1/4/5 | Main `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:226`, 295, 318: finite-dimensional unitarization, coefficient orthogonality, Peter–Weyl; no noncompact dual classification. |
| LieGroups / LieHighestWeight / SpinRepresentations | Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:80` and Layers 2/5; `LieHighestWeight/README.md:351`, 405, 931; `SpinRepresentations/README.md:881`: finite-dimensional real Lie setting, covers, compact/root/Spin input. |
| SchurWeyl Layers 3–5 | Main `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md:245`, 260, 285: finite Specht classification and dimensions; NQS still must construct its infinite-dimensional Hilbert completion. |
| RiemannianGeometry / HopfRinow | Main R1/R2/R4 and `TauCetiRoadmap/HopfRinow/README.md:37`: curvature, comparison and complete closed-ball compactness under positive-metric hypotheses; no indefinite-metric Hopf–Rinow inference was used. |
| PseudodifferentialOperators P5/P6 | `TauCetiRoadmap/PseudodifferentialOperators/README.md:1500`: local distributional elliptic regularity, used as an analytic input rather than a conclusion of admissibility. |
| SmoothBundlesConnections B1.4 | `TauCetiRoadmap/SmoothBundlesConnections/README.md:421`: slices/quotients/homogeneous spaces; distinct from NQS's measurable little-group classification. |

The other supplier names resolve in the citation tool, but a name match alone is not a certification of every advertised contract. The roadmap service also resolves AutomorphicFormsOnReductiveGroups §2.1: its independent compact Banach density prefix precedes the later NQS-consuming rank-one specialization, so those particular prefix citations do not make a layer cycle. MetaplecticAutomorphicForms 0.1–0.13 explicitly supplies the scalar bilinear extension and identifies NQS as consumer. LaguerreJacobi A/B supplies the polynomial/basis layer while excluding the model-specific differential-operator comparison, which NQS retains. Their complete implementation is not claimed here. Ownership against open work whose files were not supplied in the brief was not independently checked. The duplicated Hilbert-module targets have a direct supplied-file witness and do not depend on such omitted work.

**Seeded source sample.** All 15 requested blocks were inspected. The source service attempted all 45 distinct linked works and the four additional named notes/books. It obtained 23 usable linked texts after retries; four works were marked uncertified. Fetch success alone was not treated as theorem verification. The following records what was actually established at the sampled locators.

| Seeded target | Source/locator outcome |
| --- | --- |
| M2.InducedRefinement | No local exact source locator; its reduction to the earlier type-I and measurable-field targets is explicit. Mackey's general references do not by themselves locate the terminal parameterized refinement. R04. |
| Galilei multiplication/Bargmann extension | Formula checked algebraically below. Dooley pp.20–23 and Bargmann 1954 could not be read; no locator at the formula itself. |
| M4.P | Lang Chapter VIII, pp.163–177 is uncertified/paywalled. The formal-degree scalars and onto Plancherel theorem were not source-certified. Compact weight/parity tests below do not replace that theorem. |
| Nonzero finite helicity | Orbit/central-sign examples checked below. No local primary locator for the graded extension table; source-certification remains unavailable. |
| Discrete and limit little families | Signed weight/limit and central-square tests below. Bargmann 1947 text unavailable; no source-certified exhaustive graded table. |
| Endpoint carrier crosswalk | Gel'fand–Naimark §8, Theorem 8 and printed p.457 footnote, `url-www-mathnet-ru-eng-im3007` lines 1648–1691, distinguish the one-dimensional quotient at parameter 2 and the separately metrized zero-integral principal constituent. The roadmap's s=1 versus source parameter 2 dictionary agrees; the derivative/Fourier carrier comparison remains its own target. |
| M5.CompactInductionSupport | CStarAlgebras C2.AnnHull resolves; spin/central-character tests below agree. The named adapter has no external locator of its own. |
| M5.NullLittleDual | Character and radius-to-zero Fourier tests below agree; no exact external locator at this classification/topology block. |
| DNC normalizer | The translation action B reverses null momentum and Ad(A) reverses the circle label as computed below; no exact external locator. |
| M5.MasslessDilation | `arxiv-hep-th-9806100` lines 1105–1112, 1136–1152, 1220–1227 and 1267–1280: Theorem 2.5 and Propositions 2.6/3.1/3.2, preprint pp.24–25,28,30. In dimension four the finite-helicity extension and de Sitter restriction apply; continuous-spin data are excluded explicitly. The conjugation/dilation factors agree. This does not certify every additional core, integration and signed-weight adapter. |
| Opposite-energy massive inputs | Direct invariant/multiplicity tests below agree; the particular full row has no local primary locator. |
| Compact restrictions/finite counts | Explicit small signed-chain counts below agree; the finite formulas have no local external locator. |
| Geometry/measure/signed circle | Geometry/coarea tests below agree. For its adjacent Wilson refinement, `arxiv-math-0306424v1` lines 123–152 (§2, Eqs.2.1–2.3, p.3) gives the recurrence, positive pair-sum hypotheses and strict negative-parameter residue indices. `url-dlmf-nist-gov-18-25` lines 350–376 gives weight/norm; `url-dlmf-nist-gov-16-4-E17` lines 879–883 requires real excess >1. These support the ingredients, not the entire representation-theoretic completeness argument. |
| Identical spacelike inputs | The normalizer, J=0 exception, paired-orbit √2 and trivial-sector congruences were checked below. No external theorem locator certifies the full exchange table. |
| One common measure at every subtree root | The induction direction is noncircular as written: child onto/nonzero fields precede parent use of type-I uniqueness. Exact three/four-leaf averages and RN norms below agree. No local external locator for the parameterized theorem. |

Other source comparisons actually read: `arxiv-1110-3304` lines 253–258 and 1106–1130 support the finite-dimensional smoothing/differentiation route; `arxiv-math-0402303` lines 1521–1532 supplies the period/flux exact sequence, retaining connectedness and the coefficient hypotheses. `arxiv-1706-10131` lines 386–397 and 513–537 states the finite-center semisimple temperedness/Herz argument, not a general arbitrary-group theorem. `arxiv-1209-2312v3` lines 1129–1155 and 1231–1242 verifies the strict discrete-index threshold and measure preceding Corollary 3.5 (p.26), then Theorem 4.1 (p.28): n=2,m=1 gives two continuous harmonic channels and a k=0 atom only when s>1/2. `arxiv-1006-4975` lines 828–835, 1010–1016 and 1110–1114 supports Rieffel correspondence and Morita invariance, but does not change its existing roadmap owner.

**Computed adversarial table.** Values are exact unless a decimal is shown. “Pass” means the stated instance agrees, not that an infinite-family theorem has been proved. Zero/empty cases below are used where their carrier is defined; no DVR/characteristic-p test is asserted for a roadmap whose standing scalar field is ℂ. Each row records its own compared values and any resulting action.

| Statement | Instance tried | Values on the two sides | Result / change |
| --- | --- | --- | --- |
| P.1 ray transition probability | ℂ², e₁ and (e₁+e₂)/√2 | normalized squared inner product=1/2; ray probability=1/2 | Pass; no change |
| P.1 antiunitary alternative | complex conjugation on ℂ² | squared inner product before/after=1/2; orientation of Bloch reflection=−1 | Pass; antiunitary alternative necessary |
| P.1 one-dimensional rays | H=ℂ | ray set has 1 point; both unitary and antiunitary components act as identity | Pass; uniqueness cannot mean unique graded lift in dimension 1 |
| P.2 local section | U=diag(i,−1), distinguished e₁/e₂ | phase normalization gives diag(1,i) / diag(−i,1); chosen coefficient=1 in each chart | Pass; sections are chart dependent |
| P.2 quaternionic antiunitary | J(a,b)=(−conj b,conj a) | J²(a,b)=(−a,−b); central square=−1 | Pass |
| P.3 odd C₂ multiplier | odd t with t²=1 | cocycle at (t,t,t) gives ω=conj ω; ω=±1; δb(t,t)=1 | Pass; two signs remain |
| P.3 even C₂ coboundary | b(t)=i | δb(t,t)=i²=−1; even sign is removable | Pass |
| P.3 translation multiplier | x=(1,0),y=(0,1), alternating form parameter θ | commutator=e^(iθ); trivial extension gives 1 | Pass; nonzero θ modulo 2π detected |
| P.4 Whitehead degree one | so(3), f(x)=x×a | d₁₂f=0 by Jacobi; δa(x)=x×a | Pass; R02 |
| P.4 Whitehead degree two | trivial scalar module, λ(z)=−a·z | d₁₂λ(x,y)=a·(x×y)=c(x,y) | Pass; R02 |
| P.4 semisimplicity control | abelian ℝ², c(e₁,e₂)=1 | c is a cocycle with value 1; every scalar d₁₂λ has value 0 | Negative control; retain semisimplicity |
| P.5 CCR sign | X=x, P=−iℏ d/dx on Gaussian | (XP−PX)ψ=iℏψ; reversed convention gives −iℏψ | Pass |
| P.6 symmetric/alternating projectors | n=0 and n=1 | group average=Id; sign average=Id, not 0 | Pass |
| P.6 quadratic dimensions | dim H=2 | Sym² dimension=3=2·3/2; Λ² dimension=1=2·1/2 | Pass |
| P.6 permutation direction | σ=(12), τ=(23) on three tensor slots | σ τ sends 1 to 2; τ σ sends 1 to 3; inverse-index left action composes as σ τ | Pass; opposite order excluded |
| P.7 interior tensor zero action | Ψ=0, nonzero E,F | every elementary squared norm=0; completed Hausdorff tensor=0 | Pass; R01 imports owner |
| P.7 Rieffel induction | M₂(ℂ)–ℂ module ℂ² | Ind of dimension 1 has dimension 2; ideal lattices each have 2 elements | Pass; R01 |
| P.7 fullness control | B=ℂ⊕ℂ, E=ℂ⊕0, second character | inner product (1,0) maps to 0; induced Hilbert space has dimension 0 | Pass; fullness needed for equivalence |
| P.8 upper semicontinuity | A=C₀([0,1))⊕ℂ, scalar element (0,1) | fibre norms 0 for t<1 and 1 at t=1; limsup 0≤1, not continuity | Pass; R01 |
| P.8 point/empty bases | X={*} or X=∅ with nondegenerate action | one fibre=A; for empty X, C₀(X)=0 and nondegeneracy forces A=0 | Pass |
| M0 compact multiplicity normalization | one irreducible type of dimension d=2 | HS²(Id)=2; HS²/d=1, matching evaluation normalization | Pass |
| M0 Nelson operator sign | one noncompact X and compact Y | 1−C+2ΔK=1−X²−Y² after C=X²−Y², ΔK=−Y² | Pass |
| IsTopologicallyIrreducible definition | H=0 and trivial action on ℂ² | zero space fails Nontrivial; ℂ² has proper closed line, hence fails | Pass; distinguishes zero/reducible |
| HasFiniteKMultiplicities | K trivial, H=ℂ² versus ℓ² | trivial multiplicity=2 versus countably infinite | Pass; finite condition discriminates |
| IsAdmissible/isAdmissible_iff | finite-dimensional continuous representation | both sides literally continuity ∧ finite multiplicity | R03; definitional padding |
| M1 RN change of variables | ℝ translation t with dμ=eˣdx | d(t_*μ)/dμ=e^(−t); square-root factor=e^(−t/2) | Pass; inverse density would fail |
| M1 RN cocycle | translations s=log 2,t=log 3 | r(s+t)=1/6; r(s)r(t)=1/2·1/3=1/6 | Pass |
| M1 section isotropy | H=G and section s(*)=1 | r(g,*)=g; induced action on point=π(g) | Pass |
| M1 free quotient isotropy | H={1}, X=G, section identity | x⁻¹g(g⁻¹x)=1; scalar fibre gives regular action | Pass |
| M1 section change in nonabelian group | G=S₃,H=G, s=1,s′=b=(12),g=(23) | r′=b⁻¹gb=(13); inverse/coboundary formula also (13) | Pass |
| M1 Borel realization | trivial action on empty X and on two points | empty topology is Polish; two-point discrete topology gives two singleton Borel atoms and continuous action | Pass on these inputs; general theorem not proved |
| M1 inducedRepresentation | G=H={1}, X={*}, μ mass 2, K=ℂ | norm²=2∣v∣²; U₁=Id and RN derivative=1 | Pass; nonzero measure retained |
| M1 finite deck normalization | two-point fibre with counting measure | pullback norm²=2∣v∣²; division by √2 restores ∣v∣² | Pass |
| M2 dual action direction | N=ℝ, dilation h=2, χξ(x)=e^(iξx) | h·χξ=χ_(ξ/2); forward pullback would give χ_(2ξ) | Pass |
| M2 nonabelian dual-action order | two automorphisms g,h | (gh)⁻¹=h⁻¹g⁻¹; nested pullbacks evaluate χ(h⁻¹(g⁻¹n)) on both sides | Pass |
| M2.TypeIDisintegration | A=ℂ⊕ℂ with both characters once | central spectrum has 2 atoms, each multiplicity 1; representation dimension 2 | Pass |
| M2.ParameterizedRefinement | constant scalar representation over Q=[0,1] | each fibre dimension 1; collapsed multiplicity dim L²[0,1]=ℵ₀ | Pass; cannot replace multiplicity by 1 |
| M2.InducedRefinement (sample) | L=H={1}, Q one point or nonatomic interval | refined multiplicity=1 or ℵ₀ respectively; original integral has same dimensions | Pass on terminal collapse; R04 |
| M2 effective-support removal | zero fibre on all Q | effective support empty, integral dimension 0; measure restricted to effective support=0 | Pass |
| M3 Galilei multiplication (sample) | unit rotations, boost g=1, time h=2 | g∘h displacement=2; h∘g displacement=0 | Pass; group is not rotation/translation × time |
| M3 Bargmann cocycle (sample) | g boost 1,h time 2,k displacement 3 | τ(g,h)+τ(gh,k)=1+3=4; τ(h,k)+τ(g,hk)=0+4=4 | Pass |
| M3 time reversal | same triple | reversed cocycle sides=−4=−4; central coordinate reverses sign | Pass |
| M3 nonzero-mass energy invariant | m=2,p=3,U=5, boost 1 | E=29/4, p′=5,E′=45/4; E′−p′²/(2m)=5 | Pass |
| M3 opposite masses | m₁=1,m₂=−1 | M=0; relative formula dividing by M undefined, separate mass-zero families required | Pass; split retained |
| M3 Heisenberg shear | (a,b)=(0,2),t=1 | (a+tb,b)=(2,2); b=0 remains fixed | Pass |
| M4 Hermitian determinant | p=(0,0,0,2),(0,0,1,1),(0,0,2,0) | q=4,0,−4; corresponding Hermitian determinants=4,0,−4 | Pass |
| M4 null central character | h=1/2, θ=2π | e^(ihθ)=−1; θ=4π gives +1 | Pass; ordinary quotient excludes half-integral inducing weight |
| M4.P compact induction (sample) | χ₀, χ₃, χ_(−3) | discrete lists empty, {D₃⁺}, {D₃⁻}; principal parity even,odd,odd | Pass on compact weight rule; Plancherel unavailable |
| M4.P limit versus discrete atom | n=1 and n=2 | D₁ is limit, Plancherel atom 0; D₂ has positive formal degree | Pass on support distinction; scalar degree uncertified |
| M4 nonzero finite helicity (sample) | h=1/2 with grading cases 00,01,10,11 | label-orbit sizes 4,2,4,2; central sign −1 | Pass on finite orbit/central signs |
| M4 graded square obstruction | η=−1, odd fixed implementation | β=−1 admits multiplicity 1; β=+1 requires quaternionic multiplicity 2 | Pass on square test |
| M4 discrete/limit families (sample) | D₁⁺,D₂⁺ and sign reversals | K weights 1,3,… and 2,4,…; negatives give −1,−3,… and −2,−4,… | Pass; both limits retained |
| M4 endpoint carrier crosswalk (sample) | frequency ξ=2 | ∣i/ξ∣²=1/4; ∣i conj ξ∣²=4; inverse weights multiply to 1 | Pass on carrier multiplier; source distinguishes quotient/submodule |
| M4 trivial versus spherical endpoint | principal (0,0) versus trivial | principal compact types include spin 1; trivial compact types only spin 0 | Pass; representations not identified |
| M5 de Sitter generator commutator | translations P₀=rJ₀₃,P₁=rJ₁₃ | [P₀,P₁]=r²J₀₁; r→0 yields 0 | Pass in fixed ambient convention |
| M5 stereographic domain | R=1,x=(2,0,0,0),u=4,z=1 | Ω₊=1/2,F₊=(1,0,0,0,0),Q₊=1; Ω₋ denominator=0 | Pass; chart domains essential |
| M5.CompactInductionSupport (sample) | SU(2) spins 0,1/2,1 | allowed nonnegative m: {0},{1},{0,2}; center signs +,−,+ | Pass |
| M5.NullLittleDual (sample) | ρ=1/n, center e=0 or 1/2 | limit rotation weights all even ℓ or all odd ℓ; opposite parity gives −1 mismatch at center | Pass on parity and finite Fourier controls |
| M5 null plane zero-radius control | ρ=0 circle model | translation multiplier=1; circle carrier decomposes into all its characters, not one irreducible | Pass; separate character branch necessary |
| M5 DNC normalizer (sample) | A=diag(−1,1,1,1), B=diag(1,−1,−1,−1), null p | at p=(0,0,1,1), Ap=p and Bp=−p; Ad(A)J₀₁=−J₀₁; β preserves εℓ | Pass in displayed native coordinates |
| M5 scalar endpoint | p=0, σ→−2 | boundary constituents 1 and π₁,₀, not a single scalar constituent | Consistent with retained boundary split; exhaustion not independently certified |
| M5 integer/half-integer endpoints | p=1,σ→0 and p=1/2,σ→1/4 | lists π₁,₀ plus π₁,₁±; respectively π_(1/2,1/2)± | Boundary labels retained; global limit classification uncertified |
| M5.MasslessDilation (sample) | s=1/2,ℓ=1,ε=+,k=0 | hK=1/2; (a,hK)=(1/2,1/2); (jL,jR)=(1/2,0) | Pass on dictionary |
| M5 massless conjugate branch | ε=−,ℓ=−1 | εℓ/2=+1/2, same hK as positive-energy ℓ=1 | Pass |
| M5 dilation factor | α=1/10 | α(2−α)/2·α⁻¹=19/20; conjugated coefficient=(19/20)(P∓P̂/100) | Pass; tends to P |
| M5 radial Hilbert transport | x=2E, g(x)=f(x/2)√x/2 | ∣g∣²dx=∣f(E)∣²·(2E)/4·2dE=∣f(E)∣²E dE | Pass |
| M5 affine G₅ dimensions | so(3,1), two 4-vector copies, scalar center | 6+4+4+1=15; radical=9, central extension radical=10 | Pass on dimensions; historical identification uncertified |
| M6 Euclidean sphere pair | r₁=r₂=1 | output radii 0<R<2; Jacobian R dR; boundary sphere-collinearity has measure 0 | Pass |
| M6 compact spin pair | j₁=j₂=1/2 | 2·2=4; dimensions 1+3=4 for spins 0⊕1 | Pass |
| M6 opposite-energy massive (sample) | m₁=2,m₂=1; cosh t=1,5/4,2 | q=5−4cosh t=1,0,−3; agrees with timelike/null/spacelike split | Pass |
| M6 opposite equal masses | m₁=m₂=1 | q=2−2cosh t≤0; open timelike range empty | Pass |
| M6 opposite massive spin counts | j₁=j₂=1/2 | circle weights −2,0,2 with counts 1,2,1; principal count 4; D₂± count 1 each | Pass |
| M6 compact restrictions (sample) | V count l=2,j=1/2; J=1/2,3/2 | signed-chain enumeration gives 1,3; displayed count gives 1,3 | Pass |
| M6 finite opposite discrete count (sample) | l=1, twice-spin m=4, output L=3 or5 | k=(4−1−L)/2 gives 0 or−1; multiplicities 1 or0 | Pass |
| M6 spacelike/null geometry (sample) | r₀=2, null p z=−1/2,t=1/2 | s=+1, q(sum)=−2, r=√2<2, orientation sign c=−1 | Pass |
| M6 spacelike/null opposite interval (sample) | r₀=2, null p z=+1/2,t=1/2 | s=−1, q(sum)=−6, r=√6>2, c=+1 | Pass |
| M6 signed-circle density (sample) | preceding s=±1 examples | outer factor abs(q+4)/16=1/8 in each case; s=0 gives exceptional q=−4 | Pass |
| M6.C complementary threshold | t=v=1/2 | γ=t+v−1=0; strict residue range gives 0 atoms | Pass |
| M6.C superthreshold atom | t=v=3/4 | γ=1/2; Casimir (1−γ²)/4=3/16; Wilson x²=−(1/8)² gives 1/4+4x²=3/16 | Pass |
| M6.C Wilson endpoint normalization | a=b=c=d=1/4 and 3/4 | H₀=Γ(1/2)^6/Γ(1)=π³; Γ(3/2)^6/Γ(3)=π³/128 | Pass against norm formula |
| M6 Lorentz complementary restriction | s=1/2 and s=3/4 | source σ=2s: k=0 atom index bound 0 or1/8; no atom or parameter 1/2 | Pass against strict source range |
| M6 spacelike Gram strata | a=b=1,s=0 and s=2 | D=−1 or3; q=−2 or2; middle MA versus compact/timelike stratum | Pass |
| M6 spacelike-pair coarea | a=b=1,M=2 | s=3,D=8; √D ds/dM=2√8=4√2; radial formula M√((M²+4)M²)/2=4√2 | Pass |
| M6 spacelike-pair trivial row | a=b=1,τ₁=τ₂=1 | one copy for every integer massive J; middle principal multiplicity 2, outer 2 | Pass on compact/stabilizer counts |
| M6 identical spacelike J=0 (sample) | nontrivial τ with η=−1 | diagonal pairs all eigenvalue −1; symmetric count0, alternating countℵ₀ | Pass |
| M6 identical spacelike J≥1 (sample) | adjacent weights n,n+2 | flip exchanges two basis vectors with product of phases 1; eigenspace dimensions 1 and1 per pair | Pass |
| M6 identical spacelike trivial sector (sample) | τ=1,J=0,1,2 | exchange signs +,−,+; corresponding massive multiplicities 1/0 by parity | Pass |
| M6 identical spacelike middle discrete sector (sample) | L=2,4,6 | (−1)^(L/2)=−,+,−; agrees with H⁻,H⁺,H⁻ | Pass |
| M6 identical spacelike outer pairing (sample) | F unit vector on one orbit | norm² of (F,±ΠF)/√2=(1+1)/2=1; unnormalized pair gives2 | Pass |
| M6 zero-Lorentz complementary threshold | s=t=1/2 or3/4 | s+t−1=0 or1/2; diagonal convolution diverges logarithmically or converges at infinity | Pass on diagonal mechanism; full completeness not source-certified |
| M6 zero-Lorentz exchange sign | m=1, output n=0,2 | (−1)^(m−n/2)=−,+; antisymmetric n≡0, symmetric n≡2 mod4 | Pass |
| M6 complementary diagonal atom exchange | Fourier kernel v̂(ξ+η) | swap ξ,η gives the identical value; exchange eigenvalue+1 | Pass |
| M6 massive/Bargmann identical counts | j=1/2,J=0,1,2,3 | enumeration (+,−)=(0,2),(3,1),(1,3),(3,1); closed M_J formula gives same pairs | Pass |
| M6 identical compact spin | j=1/2 | Sym² spin1 dimension3; Λ² spin0 dimension1; energies both2E | Pass |
| M6 identical finite helicity | h=1/2,J=0,1 | (−1)^(J+2h)=−,+; one copy in alternating/symmetric respectively | Pass |
| M6 three-half-spin recoupling | e/f bases in README | F entries −1/2,−√3/2,√3/2,−1/2; F*F=Id₂ | Pass |
| M6 three-half-spin sectors | (ℂ²) tensor cube | dimension8=4·1+2·2; Sym³ dim4; Λ³ dim0 | Pass |
| M6 pair normalization | one atom of physical mass7 | Z=1/2,w=1/7; normalized mass1; analysis factor√7 | Pass |
| M6 ordered pair normalization | two atoms of masses2,5 in separate layers | Z=3/4; w=(1/3,1/15); normalized masses=(2/3,1/3) | Pass |
| M6 three-layer normalization | three ordered atoms, one in each layer | Z=7/8; normalized probabilities (4/7,2/7,1/7), sum1 | Pass |
| M6 common subtree measure (sample) | spins (1/2,1/2,1) | raw left (1/6,2/3,1/6); right(1/4,1/2,1/4); all ordered-split average (2/9,5/9,2/9) | Pass by exact rational enumeration |
| M6 four-leaf common measure (sample) | spins (1/2,1/2,1,1/2) | ordered 14-split average (10/21,3/7,2/21); sum=1 | Pass by exact rational enumeration |
| M6 internal RN necessity (sample) | three-block raw measures above | right/left ratios (3/2,3/4,3/2), although final spin1/2 raw masses both1/2 | Pass; global-root factor insufficient |
| M6 singleton/empty tree | one leaf / zero leaves | singleton μ=δ_a, total mass1; n=0 carrier ℂ, dimension1; no division by 2¹−2 | Pass; recursion only for larger blocks |
| Young matrix units | S₂ regular U=diag(1,−1), sign D | E=(Id−U)/2=diag(0,1); E²=E, rank1 | Pass |
| Young range/intertwiner | same S₂ example | range(E)=ℂe₂; intertwiners from sign determined by any scalar e₂ | Pass in both directions |
| Young continuity/closed range | same projector | operator norm1; range ℂe₂ closed; no infinite-dimensional trace needed | Pass |
| Projected Gram rank | r=2,s₁=e₁,s₂=e₂,P=diag(1,0) | Gram=diag(1,0), rank1; P=0 gives rank0; r=0 gives rank0 | Pass |
| Native tensor reindex padding | n=3,σ=(123) | output factors (v₃,v₁,v₂) from σ⁻¹; native lemma gives same tuple | R03; delete duplicate API theorem |

The table contains 109 computed rows. The general analytic results whose verification exceeds these examples are explicitly separated below; no acceptance is inferred from the number of rows.

## Not verifiable

The following limitations remain even though the build and dependency gate pass.

- Dooley's 34-page notes and Grundling's 225-page notes were not located legally by the sources service. Their claimed page readings, bibliography mismatch, faint glyphs and source-error tables cannot be certified. This includes the expressly uncertain Dooley p.29 factor, p.22 glyph and Grundling pp.222–225 facing halves. The geometric formulas were tested separately; those computations do not authenticate a transcription.
- Lang Chapter VIII is uncertified/paywalled. Therefore the M4.P Plancherel constants and its complete normalized transform were not checked against the text. The service also marked Mackey 1958, Parthasarathy's probability-measure reference and Fell 1961 uncertified; these settled access statuses were not reopened as missing-text requests.
- The whole graded helicity/discrete table, all-sequence Fell/DNC/de Sitter classifications, complementary complex Clebsch–Gordan continuation, and general measurable recoupling/completeness are not certified by the finite calculations. In several sampled blocks no exact locator is supplied (R04). In others the source supports an ingredient while the README owns a substantial additional analytic theorem.
- A full per-identity source certification is consequently unavailable. The report does not treat retrieval of the other legal texts as having checked every equation in them. This is a needs-changes review, not a claim that the remaining unverified classification theorems have been proved sound.

The missing-reference registry preserves one key per work. The unavailable texts and attempted routes are listed below; inaccessible web text was not used to infer a theorem's contents.

| Source key | Work / attempted legal route |
| --- | --- |
| doi-10-2307-1969831 | On Unitary Ray Representations of Continuous Groups — the DOI's landing page: the landing page https://www.jstor.org/stable/1969831?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2307-1969129 | Irreducible Unitary Representations of the Lorentz Group — the DOI's landing page: the landing page https://www.jstor.org/stable/1969129?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open); Edinburgh teaching-page PDF at webhomes.maths.ed.ac.uk/~jmf/Teaching/Projects/Poincare/BargmannLorentz.pdf: source-service fetch did not complete after over three minutes; terminated |
| doi-10-1063-1-1664490 | Possible Kinematics — the DOI's landing page https://doi.org/10.1063/1.1664490: pubs.aip.org: HTTP 403 |
| doi-10-1063-1-1665396 | Relation of the Inhomogeneous de Sitter Group to the Quantum Mechanics of Elementary Particles — the DOI's landing page https://doi.org/10.1063/1.1665396: pubs.aip.org: HTTP 403 |
| doi-10-1073-pnas-35-9-537 | Imprimitivity for Representations of Locally Compact Groups I — the DOI's landing page https://doi.org/10.1073/pnas.35.9.537: pnas.org: HTTP 403; NIH PMC direct PDF URL: service fetched only the preparing-to-download HTML page, not article text |
| doi-10-1073-pnas-37-3-170 | Representations of Semisimple Lie Groups on a Banach Space — the DOI's landing page https://doi.org/10.1073/pnas.37.3.170: pnas.org: HTTP 403 |
| doi-10-1073-pnas-37-6-362 | Representations of Semisimple Lie Groups — the DOI's landing page https://doi.org/10.1073/pnas.37.6.362: pnas.org: HTTP 403; the DOI's landing page https://doi.org/10.1073/pnas.37.6.366: pnas.org: HTTP 403 |
| doi-10-1090-S0002-9904-1976-14223-1 | Tensor products of unitary representations of 𝑆𝐿₂(𝐑) — the DOI's landing page: the landing page https://pubs.ams.org/journals/bull/1976-82-06/S0002-9904-1976-14223-1 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-1090-S0002-9947-1953-0056610-2 | Representations of a semisimple Lie group on a Banach space. I — the DOI's landing page: the landing page https://pubs.ams.org/journals/tran/1953-075-02/S0002-9947-1953-0056610-2 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-1103-PhysRevD-1-2753 | New Dynamical Group for the Relativistic Quantum Mechanics of Elementary Particles — the DOI's landing page: the landing page https://journals.aps.org/prd/abstract/10.1103/PhysRevD.1.2753 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-1103-PhysRevD-2-2326 | Theory of Weak Interactions with "Continuous-Spin" Neutrinos — the DOI's landing page: the landing page https://journals.aps.org/prd/abstract/10.1103/PhysRevD.2.2326 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-1103-RevModPhys-34-845 | On the Localizability of Quantum Mechanical Systems — the DOI's landing page: the landing page https://journals.aps.org/rmp/abstract/10.1103/RevModPhys.34.845 is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2140-pjm-1979-80-333 | A selection theorem for group actions — the DOI's landing page: the landing page https://msp.org/pjm/1979/80-2/p05.xhtml is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2307-1969423 | Induced Representations of Locally Compact Groups I — the DOI's landing page: the landing page https://www.jstor.org/stable/1969423?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2307-1970331 | Analytic Vectors — the DOI's landing page: the landing page https://www.jstor.org/stable/1970331?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2307-2372913 | Representation of Elliptic Operators in an Enveloping Algebra — the DOI's landing page: the landing page https://www.jstor.org/stable/2372913?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| doi-10-2307-2373470 | Orbits and Representations Associated with Symmetric Spaces — the DOI's landing page: the landing page https://www.jstor.org/stable/2373470?origin=crossref is on a host in no licence class (fetch its PDF explicitly with --licence-class once you have checked it is open) |
| Dooley | Mathematical Foundations of Quantum Mechanics — Sources service title search returned no legal source |
| Grundling | Mathematics of Quantum Mechanics notes — Sources service title search returned no legal source |
| Weibel1994 | An Introduction to Homological Algebra — Sources service title search returned no legal source |
| Wallach1988 | Real Reductive Groups I — Sources service title search returned no legal source |

## Source issues

- **Misprint** in arxiv-hep-th-9806100 at equation (3.7), preprint p.29 (line 1247): the source says the conjugated commutator repeats Y in both entries; it should be the commutator with X in the first entry and Y in the second; affects the proof.

The equation (3.7) misprint was checked against the rendered PDF page, not inferred solely from OCR. The next displayed line has the intended X,Y bracket. No other source error is asserted here, especially none of the unavailable Dooley/Grundling readings.
