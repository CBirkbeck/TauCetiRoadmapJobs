# Port report: GanGrossPrasadUnitaryGroups

- Branch: `roadmap/gan-gross-prasad-unitary-groups`.
- Head: `46235615693521cca4005011d18e549b390a93b4`.
- Base checked: clean worktree at `a0af4de`.
- Committed files: `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md`, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean`, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/metadata.toml`.
- No push, pull-request write, issue write, other-roadmap edit, manifest change, or toolchain change was made.

## Validation

The command `lake build TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested` exited 0. Exact outcome line:

```text
Build completed successfully (8976 jobs).
```

Warning count: **1**, exclusively:

```text
warning: TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:224:8: declaration uses `sorry`
```

All twelve examples are proved. The delivered Lean file has 292 lines, six real-bodied definitions/abbreviations and one admitted theorem. Its sole import is `import Mathlib`; no Tau Ceti module is used by its statements. These counts describe the actual package file, rather than the older counts in the review reports. Every needed instance is an explicit declaration binder; there are no ambient section variables whose hypotheses can disappear. No additional Lean invocation was used.

Exact final push-gate summary:

```text
gate GanGrossPrasadUnitaryGroups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 check-labels-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate checks all worktree dirt, including the new folder itself. Its initial run passed every content check and failed only `dirty=1`; the final clean-tree run above followed the authorized commit. `git diff --check` and the staged whitespace check passed. The final diff contains exactly the three named roadmap files.

Exact dependency-check output, exit 0:

```text
depcheck: 9 roadmaps, 82 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The manual ownership audit also found no later supplier or reverse dependency. No ownership move was necessary.

## Draft pull request body

Build a general library of unitary Bessel models and periods, from relevant Hermitian pairs and local restriction spaces through multiplicity one and the epsilon-character description of tempered distinction. The global layers treat adjacent nonvanishing with endoscopic base change and the completed Tamagawa-normalized Gan–Gross–Prasad period identity, including ramified, dyadic, split and infinite places and the variable constituent-group coefficient. This supplies precise period interfaces for special-value and arithmetic consumers while retaining the separate conjectural assertions in arbitrary odd codimension.

The README specifies forty target subsections in seven layers, with exact hypotheses, supplier contracts, source locators, named APIs and discriminating Checks. The representative Lean signatures use native Mathlib carriers and proved examples for split framing, pairing conventions, model weights, component multiplicities and constituent coefficients. Analytic endpoints whose carriers require construction remain full README targets.

AI assistance: Codex (GPT-6). The source, mathematical boundary cases, ownership, signatures and validation were checked in this author-side port; this report is not an independent approving review.

## Dependencies that are still new-roadmap pull requests

The named suppliers are ReductiveGroupsPartII; SmoothRepresentationsOfLocalGroups; GeometryOfNumbersAndQuadraticArithmetic; AutomorphicFormsOnReductiveGroups; AutomorphicSpectralTheory; AutomorphicLFunctionsAndLocalFactors; AdelicAlgebraicGroups; EndoscopicTransferAndUnitaryTraceComparison; MetaplecticAutomorphicForms; and ModularityAndLanglandsExtensions.

ReductiveGroups, GlobalNumberFields, NoncommutativeGeometry and completed RestrictedProducts are consumed as specified on main. Revisions of existing roadmaps were not used as dependencies. SelmerIwasawaCohomologyPartII is discussed only as an arithmetic consumer with a separate definite-period premise; it supplies no input here.

## Port changes and final mathematical reading

The port preserves the opening Summary, all forty named target subsections, all fifty Check lists, all thirty-six supplier contracts, every theorem hypothesis and source locator, the worked calculations, and the full APIs. Each layer retains Examples and Dependencies. Catalogue-style API labels and bullet fields became prose; descriptive subsection titles retain their original target names in the text. Metadata remains `topic = "math.NT"`.

The final reading made the following repairs and clarifications:

1. The relevance constructor and transport maps are explicitly constructions, with their preservation and composition laws stated separately. The API names are qualified by `RelevantHermitianPair`; a constructor is not described as a theorem to prove.
2. The universe convention now permits independent group and vector-space universes, matching the actual `u`, `v`, `w` Lean binders and native tensor maxima. It retains the native functor-of-points universe lift.
3. The reference section no longer links to an absent `sources.toml` in the target folder. Its sixteen legal source links and exact versions remain in the README, and numbered-extraction locators now repeat their source id explicitly. No source numbering or mathematical assertion was changed.
4. The finite-coordinate calculation explicitly consumes Mathlib `pi_eq_sum_univ'` and `map_sum`; scalar multiplication, tensor-map and finrank supplier references also name their actual files. No general basis-expansion theorem is requested again.
5. Process wording about proposed placement was replaced by the exact continuing mathematical contract. The Schwartz-multiplier and Jacquet–Rallis continuations retain their accepted owners and all their hypotheses.

No source theorem was narrowed, conjecture upgraded, missing heavy carrier encoded artificially, or new numerical premise introduced. In particular Harris's odd-residue spherical result remains an intermediate; the all-residue extension is the explicit proof target in §5.3. The compact and split dyadic calculations remain negative controls against silently dropping that obligation.

## What moved from Lean to the README

Nothing. `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean` is byte-for-byte the supplied `packages/GanGrossPrasadUnitaryGroups/Suggested.lean`. It already meets the required form. No analytic headline can be stated faithfully at the pins without the supplier carriers specified in the README. The six light specializations, the component-character milestone, and all twelve proved examples are retained.

## Suppliers and duplication

The pins were checked directly: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Supplier declarations were searched by mathematical object as well as by name, then their actual signatures or roadmap paragraphs were read.

| Object | Supplier checked | Port disposition |
| --- | --- | --- |
| Sesquilinear separation and orthogonals | Mathlib `LinearMap.Nondegenerate`, `LinearMap.flip_nondegenerate`, `Submodule.orthogonalBilin`, `Submodule.mem_orthogonalBilin` | Native two-sided separation and first-submodule slot retained; no second form API. |
| Tensor actions, duals and equivariant maps | Mathlib `Representation.tprod`, `.dual`, `Representation.IntertwiningMap`, `.ext`, `.isIntertwining` | Algebraic specialization retained; no assertion of analytic continuity from an algebraic dual. |
| Identity-Gram unitary group | Mathlib `Matrix.unitaryGroup` | Compatibility witness only; arbitrary-form representability remains its named supplier contract. |
| Split frames, component coordinates and finite sign counts | Mathlib `Prod.isUnit_iff`, `isUnit_iff_ne_zero`, `pi_eq_sum_univ'`, `map_sum`, `Nat.card_fun`, `Nat.card_sum` | Native general results consumed; only the roadmap's actual relative specializations remain. |
| Affine-group points | Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor` | Actual convolution group of algebra homomorphisms retained, with its Hopf/coefficient hypotheses. |
| Field Hermitian carrier and adjoint | GeometryOfNumbersAndQuadraticArithmetic §2.9 | Existing carrier and adjoint imported at full field generality; the relative slot comparison is owned here. |
| Split perfect Hermitian carrier and GL(A) | MetaplecticAutomorphicForms §3.2a | Existing carrier imported; inverse-dual action and relative slot comparison retained. |
| Smooth categories, Jacquet filtrations and mirabolic functors | SmoothRepresentationsOfLocalGroups §§SR.0, SR.2–SR.5 | Existing generic constructions consumed; the six residual comparison contracts remain explicit. |
| Completed projective tensors | NoncommutativeGeometry N1 on main | Complete-target universal property and completion density consumed. |
| Real globalizations and tempered GL genericity | AutomorphicFormsOnReductiveGroups §§2.6–2.7 | Existing SAF, growth and Whittaker APIs consumed; relative smooth-dual and decay supplements retained. |
| Whittaker realizations and local Rankin–Selberg periods | AutomorphicLFunctionsAndLocalFactors §AL.3 and its Archimedean Whittaker comparisons | Exact AL3 names checked; the residual adjacent-integral gap is the differential/quotient Haar comparison, not a second analytic theory. |
| Measures, group spectral theory, classification and endoscopy | AdelicAlgebraicGroups §§0.1–0.3, 1.1–1.5, 2.2–2.5; AutomorphicSpectralTheory Layers 0–4 and 6; ModularityAndLanglandsExtensions §§3.13, 3.15, 3.20, 5.1, 5.4; EndoscopicTransferAndUnitaryTraceComparison Layers 2–5 and §§11.2–11.4 | Base sections exist; exact unproved supplements remain obligations, never available axioms. |

No new duplication removal or supplier replacement was needed beyond those already incorporated in the accepted package. Their ownership remains in Scope and ownership; no deleted-target stubs were added. The added native coordinate-expansion citation strengthens the import contract without deleting the genuinely specialized component-character milestone.

The final object sweep covered every active/completed README on main and all 308 additional open heads in the supplied read-only inventory, plus the eight explicitly named open heads. This produced 293 distinct README versions. The eight named folders were also screened on their own Lean files. Relevant matches were the supplier objects above, GSp(4) Bessel models, ordinary special functions, or arithmetic consumers; none duplicates a retained unitary Bessel endpoint. Revisions of existing folders were screened for overlap but supply no additional dependency. Online primary-source searches for Mathlib work and the Zulip unitary/Hermitian design discussion revealed no competing relative endpoint to import.

## Adversarial mathematics pass

Each subsection row includes its subordinate API, defining identities and Checks. These are mathematical boundary and hypothesis checks, not claims to have proved the analytic targets. Characteristic-two base fields, inseparable quadratic algebras and the zero ring are excluded by the stated algebraic hypotheses; dyadic characteristic-zero fields are included. A residue cardinality q=1 is not an admissible local field.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Algebraic conventions | Zero module; split F×F; characteristic 2; inseparable algebra; zero ring | Zero rank is valid; constant E-rank gives GL_n(F); invalid bases are excluded. | No hypothesis change. |
| Slot and character conventions | Pairings (i,1), (1,i); ν(h)=i; inverse U(1) weights | Values i, −i; right translation acts by ν; equal nonzero weights give no invariant model. | Preserved and checked by proved examples. |
| Modulus and Frobenius conventions | Upper GL₂ diagonal; two eigenvalues a,b; inverse Frobenius | δ_B=abs(a); inverse half-modulus converts induction; eigenvalues invert together. | No sign change. |
| Asai and Haar conventions | Degrees 1,2; empty parameter; Haar factors 2,1/2; global H factor 2 | Asai signs are opposite; empty factor is 1; local product cancels, squared global period scales by 4. | No normalization change. |
| Universe convention | Group in u; first module in v; second module in w | Native tensor/intertwiner universes use maxima and the signatures impose no equality of universes. | Prose aligned with Lean. |
| §1.1 relevance and frame API | W=0; rank-three hyperbolic complement; definite real rank three; split idempotent | Complement rank is 2r+1; the definite rank-three space fails relevance at r=1; nonzero split vectors need not frame a line. | Constructors distinguished from theorem laws. |
| Field carrier comparison and adjoints | Zero space; complex line; multiplication by nonreal a and by 2 over a quadratic ℚ₂-extension | Slot swap is involutive, orthogonals agree and both adjoints multiply by c(a), without inversion. | Native adjoint owner retained. |
| Split carrier comparison | A=0; idempotents; arbitrary submodule; scalings (2,1/2) and (2,2) | Trivial zero-rank group; cross-pairings (1,0),(0,1); preserved value 1 versus wrong value 4. | Native split carrier owner retained. |
| `splitLineFrame` | (1,1), (1,0), (2,1), (2,1/2); arbitrary fields including characteristic 2 | Unit iff coordinate norm is nonzero; norm need not be 1; its light all-field scope is explicit. | No Lean change. |
| §1.2 Bessel datum and character | Empty flag; two simple coordinates; split upper GL₃ | r=0 gives diagonal U(W); coordinates add; b=(x,−y) detects both split roots. | No change. |
| §1.3 transport | Identity; composition; simultaneous form negation; changed additive character | Same group equations and transported characters; labels must move with the reference. | No change. |
| §2.1 model and dimension API | Trivial H; Circle weights (1,−1), (1,1); dense tensor image | Dimensions 1 and 0 distinguish the dual; continuity is needed at infinity. | No change. |
| `linearFirstPairing` | Scalar i in each slot; arbitrary c; zero vectors and zero space | Linear first, conjugate-linear second, with i and −i and zero values. | No Lean change. |
| `algebraicBesselModel` | Scalar character; trivial second factor; fixed tensor with target action −1 | Multiplication intertwines; negative target action forces the tensor value to zero. | No Lean change. |
| §2.2 invariant distributions | Norm-one scalar; transpose of an upper unipotent; noncommuting matrices | Conjugated inverse fixes the scalar; transpose reverses order; identity fails the anti-automorphism law. | No change. |
| §2.3 adjacent multiplicity | U(0) inside U(1); split real pair; ramified quadratic ℚ₂-extension | Rank-zero scalar model has dimension 1; no compactness or odd-residue premise is needed. | No change. |
| §2.4 finite reduction | r=1; W hyperbolic; forbidden support; upper-GL₂ modulus | Auxiliary rank is 2; residual W can be isotropic; support exclusion and unnormalized induction are essential. | No change. |
| §2.5 infinite reduction | Subspace dimensions 0,1,2; reducible parameter; either line sign | Common half-plane belongs to a finite subspace; irreducible parameter can depend on it. | No change. |
| §2.6 odd-codimension bound | Two independent functionals; incompatible compact weights; dyadic field | A two-dimensional subspace contradicts the adjacent bound; zero multiplicity is allowed. | No change. |
| §2.7 tempered integral | Compact H of mass a; trivial coefficients on noncompact split H; fixed log powers | Compact value is a; the nontempered trivial integral diverges; strict decay absorbs fixed log powers. | No change. |
| §3.1 epsilon-character API | Empty parameter; χ₁ and χ₋₁; multiplicity two | Empty epsilon is 1; duality product is −1; generator and central-element parity differ. | No change. |
| `componentCentralElement` and character theorem | Empty index; multiplicity 2; two singletons; sum character | Central coordinates are 0,0,(1,1); sum character is 1 on each generator and 0 on their sum. | Explicit native coordinate-expansion supplier added. |
| §3.2 enhancement transport | Norm/nonnorm t; dimensions 2,1; two nonnorm changes | Even-side sign changes; odd-side sign is fixed; two changes cancel. | No change. |
| §3.3 regularized form | H=1; compact matching/mismatching weights; r>0; full reducible induction | Mass and weight orthogonality agree; regularization is retained; induction concerns the full induced representation. | No change. |
| §3.4 geometric multiplicity | x=1; x=−1 on W=ℂ with r=1; zero quasi-character; empty regular germs | Empty determinant is 1. Full D_G=64, D_H=4 give Δ=4; reductive-only D_H gives a wrong ratio. Empty germ average is zero. | No change. |
| §3.5 local trace formula | W=0; indefinite real group; proper-Levi induction | Whittaker germ survives rank zero; noncompact trace needs regularization; GL germ factor remains. | No change. |
| §3.6 component Fourier identity | μ=ε; μ=−ε; order-two group | Origin values are 1 and 0; Fourier values (1,−1) select the nontrivial character. | No change. |
| §3.7 finite-place selection | W=0; ramified dyadic pair; wrong enhancement | Complement fixes the boundary inner form; wrong enhancement has multiplicity 0. | No change. |
| §3.8 real theta reduction | a+b=1; counts (2,1); zero companion lift; compact vanishing pair | Two-step reduction reaches (1,0); nonzero-lift conjuncts prevent false universal nonvanishing. | No change. |
| Auxiliary real seesaw form and API | U(0); oscillator weight k paired with k or k+1; scalar i in either slot | Diagonal values 1 or 0; slot factors i or −i; conjugate oscillator is essential. | No change. |
| §3.9 real selection | Compact U(2) weights; opposite line sign; W=0 | Dual weight 1 interlaces; dual weight −1 does not; transported multiplicity and rank-one model agree. | No change. |
| §3.10 split prediction | GL₁×GL₀; nontempered trivial GL₂; regular GL₃ principal series | Empty factor is scalar; unitarity alone fails genericity; ordinary Jacquet dimension 6 differs from generic dimension 1. | Conjectural infinite higher-codimension range preserved. |
| §3.11 split theorem | Adjacent real pair; finite GL₄×GL₁; real higher codimension | Proven ranges remain finite places or adjacent infinity; higher real datum has both character coordinates without an exported proof. | No change. |
| §4.1 global period | r=0; ν(h)=i; character nontrivial on rational H | Empty unipotent contributes 1; translation gives i; nonrational character does not descend. | No change. |
| §4.2 local obstruction | One zero local model; replacements with values 2 and 3; reference rescaling | Obstruction forces zero; replacements multiply by 6; reference scaling cancels. | No unsupported converse added. |
| §4.3 tensor L-representation | Smaller rank 0; ranks (2,1); split localization | Dimensions 0 and 4; empty L-factor 1; split localization has two factors; induction index is finite and equal to 2. | No change. |
| §4.4 fixed-pair conjecture | W=0; central zero; unsuitable specified inner form | Generic Fourier coefficient remains meaningful; central nonvanishing is separate; fixed form is not existential form. | Conjectural status preserved. |
| §5.1 normalizers | n=1; split place; global central zero | Δ₂ uses η then 1; local factors remain nonzero while global C can vanish. | No central value inverted. |
| §5.1a split Whittaker identity | n=1; vector in kernel of λ; pairing/Haar scaling | Raw form has factor ab; a kernel vector gives zero without making the form zero. | No change. |
| §5.2 normalized local form | Zero vector; nonzero scalar; compact H; continuous/discontinuous forms on a dense tensor subspace | α(0,0)=0; q(0) is excluded; q(cx)=q(x); density determines continuous forms only. | No change. |
| §5.3 spherical identity | Split ℚ₂ eigenvalues 1,−1; unramified nonsplit rank one; nonspherical Steinberg datum | Split L=2, Δ=8/3, Ad=32/9 give C=3 and raw integral 3. Compact nonsplit raw=C=1. Nonspherical datum has no fixed vector. | All-residue proof obligation retained. |
| §5.4 rescaling | Pairing times 2; local Haar factors 2,1/2; global H factor 2 | q is pairing-independent; product-one changes cancel; squared period scales by 4 globally. | No change. |
| §5.5 all-place product | Spherical tail; exceptional zero; good place of volume 2 | Finite modification is coherent under enlargement and allows zero; reference volume tail must be nonzero. | No central Euler-product assumption. |
| §6.1 Whittaker relative periods | n=1; central zero; zero vector; multiple constituents | Asai signs differ; λ can vanish while β is nonzero; leading terms remove the specified pole orders. | No change. |
| §6.2 relative characters | One-dimensional realization; basis rescaling; zero period; spherical projector | Norm scaling cancels; zero period gives zero character; local projector trace equals Cα after absolute Fubini. | Smooth K-bases and actual period domains retained. |
| §6.3 spectral contribution | Counts (1,1), (2,1); repeated constituent; diagonal-centre quotient | Coefficients 1/4,1/8; repetition fails star-genericity; centre quotient changes the coefficient incorrectly. | No change. |
| `unitaryConstituentSigns` | Empty indices; counts (1,1), (2,1) | Orders 1,4,8 using native cardinal arithmetic. | No Lean change. |
| `unitaryConstituentCoefficient` | Same index sets; possible zero denominator | Values 1,1/4,1/8; finite sign group contains its identity, so its order is positive. | No Lean change. |
| §6.4 isolated comparison | Multiple realizations with one base change; zero transfer on other forms; dense archimedean transfer | Entire base-change class remains; unwanted forms vanish; continuity is required for density. | No individual representation assumed isolated. |
| §6.5 Euler identity | Nondistinguished local component; three constituents; product-one κ | Both sides vanish without division; coefficient is 1/8; only the global κ product is 1. | No change. |
| §7.1 global nonvanishing | n=1; endoscopy; wrong prescribed form; nontempered component | Form is existential; endoscopy and rank one remain; no temperedness premise is introduced. | No change. |
| §7.2 stable specialization | One constituent per degree; n=1 boundary; bad places | n>1 source scope is retained; n=1 belongs to §7.1; all places remain. | No change. |
| §7.3 refined proposition | Counts (1,1), (2,1); zero vector; zero mixed pairing | Coefficient varies; norm quotient excludes zero; polarization follows the denominator-cleared identity. | No change. |
| §7.4 completed identity | Central zero; endoscopy; vector, pairing and Haar rescalings | Local terms remain defined; inverse group order and scaling agree with Layers 5–6. | Refined proposition is never assumed. |
| Hermitian and category supplier contracts | Zero rank; split idempotents; dyadic fields; restricted smooth dual | Field and split carriers remain separate; no odd-residue restriction on carrier/adjoint; restriction and character twists are explicit. | No extra supplier reconstruction. |
| Spectral and distribution supplier contracts | Empty nilpotent-orbit set; noncompact group; finite-place versus real null-cone distributions; Fourier extension | Empty average is zero; restricted topology/decay hypotheses remain; no universal real homogeneity or raw-cutoff stabilization is asserted. | All eight contracts retained. |
| Theta supplier contracts | Zero companion lift; equal versus adjacent rank; real signatures; determinant counter-twist | Signature rules and nonzero branches remain explicit; no big-lift irreducibility is substituted. | Both contracts retained. |
| Haar and factor supplier contracts | q=2, ranks 1,2; quotient Haar scalings; opposite Asai signs; zero tensor parameter | Compact differential volumes 1/2,3/8; quotient scales by a/b; signs and empty factor agree. | All six factor contracts and measure comparison retained. |
| Classification and transfer supplier contracts | Central multiplicity parity; several cuspidal constituents; split/dyadic transfer; dense infinite transfer; local κ | Actual normalized correspondences are required; finite exact and infinite dense transfer remain distinct; no relative endpoint is a premise. | All eight classification/endoscopic contracts retained. |

## Source verification and limits

The precise legal copies in `packages/GanGrossPrasadUnitaryGroups/sources.toml` have sixteen readable numbered extractions. Direct checks include ggp line 179–190, ggp line 229–243, ggp line 598–615, ggp line 720–755, ggp line 1550–1639, ggp line 2152–2180, ggp line 2217–2235, ggp line 2386–2405 and ggp line 3151–3188; agrs line 35–40 and agrs line 59–83; sun-zhu line 49–68; jsz-bessel line 207–216 and jsz-bessel line 260–285; bp-refined line 2855–2908; xue-real line 196–266, xue-real line 848–886, xue-real line 983–1025 and xue-real line 1172–1211; bp-arch line 10204–10208, bp-arch line 10248–10271, bp-arch line 10530–10558 and bp-arch line 11200–11212; harris line 132–157, harris line 170–181 and harris line 1289–1294; zhang-period line 962–986 and zhang-period line 1523–1568; bpcz line 96–134, bpcz line 148–193, bpcz line 4243–4254, bpcz line 4755–4782 and bpcz line 4889–4946; bplzz line 128–138, bplzz line 157–174 and bplzz line 185–196; bp-plancherel line 4480–4491 and bp-plancherel line 4734–4748; and bp-fundamental line 99–119.

The inverse-order coefficient agrees with the theorem at bpcz line 191 and the spectral calculation at bpcz line 4943–4944. The inverted-order expression in the concluding sentence at bpcz line 4945 is not reproduced. The source's conditional local classification premises are covered by the explicit enhanced-classification proof obligation, not silently dropped.

The waived `xue-bessel` entry is not used as theorem evidence. Its exact theorem number remains unverified; no new request for it was made. The general all-residue spherical calculation is specified rather than certified proved by the scalar controls or the Lean build.

## Continuing obligations and unresolved items

There is no new port blocker. The accepted thirty-six unproved supplier contracts remain exactly the following mathematical obligations:

| Owner | Contracts |
| --- | --- |
| ReductiveGroupsPartII | `hermitian-unitary` |
| SmoothRepresentationsOfLocalGroups | `local-categories`, `local-bernstein`, `local-mirabolic`, `gl-tempered-genericity`, `local-jacquet-filtration`, `local-spherical` |
| AutomorphicFormsOnReductiveGroups | `archimedean-globalization`, `archimedean-generic-induction`, `archimedean-seminorms`, `automorphic-realization` |
| AutomorphicSpectralTheory | `distribution-gk`, `local-schwartz-germs`, `local-tempered-bounds`, `local-plancherel`, `local-fourier-extension`, `local-smoothing-trace`, `automorphic-spectrum`, `spectral-isolation` |
| ModularityAndLanglandsExtensions | `enhanced-packets`, `global-parameters` |
| EndoscopicTransferAndUnitaryTraceComparison | `ordinary-endoscopy`, `relative-geometric-comparison`, `relative-finite-transfer`, `relative-archimedean-transfer`, `relative-fundamental-lemma`, `relative-character-comparison` |
| MetaplecticAutomorphicForms | `real-oscillator-model`, `real-small-theta` |
| AdelicAlgebraicGroups | `adelic-measures` |
| AutomorphicLFunctionsAndLocalFactors | `factor-epsilon-identities`, `tempered-local-regularity`, `hermitian-global-values`, `local-rankin-selberg`, `whittaker-pairing-fourier`, `global-mirabolic-norms` |

These are acceptance conditions carried into the roadmap, not theorems established by elaboration. The general fixed-pair conjecture and split archimedean higher-codimension prediction retain their stated conjectural status. No later-roadmap notion was moved, and no merge-order edit was made.

## Untrusted command-bearing reference text

Repository `README.md`, Building, contains the commands `lake exe cache get` and bare `lake build`; older package reports mention `lake env lean`. These passages were treated as command-bearing reference data and not followed: only the job's targeted `lake build` command was run. No instruction in fetched mathematical sources, sibling roadmaps or review text changed the authorized scope or caused an external write.


Pull request: #1404 (roadmap/gan-gross-prasad-unitary-groups at 4623561)
