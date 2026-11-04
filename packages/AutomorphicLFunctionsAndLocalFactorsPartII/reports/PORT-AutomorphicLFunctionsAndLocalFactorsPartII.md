# PORT-AutomorphicLFunctionsAndLocalFactorsPartII

Branch: `roadmap/automorphic-l-functions-and-local-factors-part-ii`.
Head commit: 843d2675918461d47a404add16ffa8525a778e69.
Base: `9c6e95d` (the initial working tree was clean).

The port adds only `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md`, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/Suggested.lean`, and `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/metadata.toml`. Repository guidance was read from the root `README.md` and `CONTRIBUTING.md`; the parent-relative copies mentioned by `AGENTS.md` were absent. Shape comparisons used the merged ReductiveGroupsPartII, GlobalNumberFields and TypeAHeckeAlgebras roadmaps, with the accepted package's fuller API lists and Checks retained.

## Validation

Exact targeted build output:

```text
✔ [8954/8954] Built TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII.Suggested (6.5s)
Build completed successfully (8954 jobs).
```

Warning count: **0** (including zero sorry warnings, because the accepted module has no declarations). The build process exited successfully and no Lean process was left running.

Push gate summary:

```text
gate AutomorphicLFunctionsAndLocalFactorsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean committed tree. Precommit invocations reported only the untracked or staged target files as `dirty`; every content, import, path, ownership-name and dependency check already returned zero. The summary above is the final committed-tree result. No tooling or merge-order file was edited.

Exact standalone dependency-direction output:

```text
depcheck: 203 roadmaps, 1359 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. Citation resolution against main `9c6e95d`, all 433 indexed open roadmap heads and the actual pinned Lake packages reported no unresolved cross-roadmap citation and no unresolved Lean name.

## Draft pull request body

Develops unitary doubling, Garrett pullback and critical archimedean test sections, then generalized doubling for split symplectic, special orthogonal and general spin groups. The roadmap connects local functional equations and ramified stability to completed global functions, entireness after ramified twists, and weak global and coarse local standard transfer without a genericity hypothesis on the classical representation; separate split-torus formulas preserve the low-rank cases where the global doubling period is not available.

AI-assisted port and mathematical self-review using OpenAI Codex (GPT-6).

## Dependencies still in pull requests

- AdelicAlgebraicGroups: §§0.1–0.4, AA.1 and §§2.2–2.3.
- AutomorphicFormsOnReductiveGroups: §§2.1–2.7, 3.4–3.5, 4.1–4.3, 5.3–5.4 and 6.1–6.2.
- AutomorphicLFunctionsAndLocalFactors: Representation prerequisites and AL.0–AL.4.
- AutomorphicSpectralTheory: §§1.1–1.4, 2.1–2.6, 4.14a and 5.12, plus Layer 4's residual theory.
- EndoscopicTransferAndUnitaryTraceComparison: §10.29, with §5.1 identifying the shared residual Speh input.
- GeometryOfNumbersAndQuadraticArithmetic: §2.9.
- GL2AutomorphicRepresentationsAndTransfer: R16.1.8.
- MetaplecticAutomorphicForms: §§3.2a–3.3b, 3.5–3.7, 3.15 and 6.2, 6.10a–6.11.
- SmoothRepresentationsOfLocalGroups: SR.0–SR.5, with named derivative/segment targets and SR.2a.1.

ReductiveGroups, ReductiveGroupsPartII, OrthogonalSpinGroups and RepresentationTheory/ClassicalGroups are consumed as they stand on main. The open-work sweep used the supplied head index through `roadmaps grep` and `roadmaps show`, including the supplied sibling roadmap folders. No unspecified open pull request was sought separately. QuiverRepresentationsPartII's integral-segment specialization, ClassicalGroupsPartII's symplectic-similitude representation theory, AutomorphicPadicLFunctionsPartII's arithmetic interpolation and GanGrossPrasadUnitaryGroups' period theory supply no replacement for the doubling targets here. Their objects remain distinct and none is added as a new dependency.

## Lean contents and elaborated signatures

Nothing moved from Lean to README: the accepted `Suggested.lean` already had the permitted short form and is byte-for-byte unchanged. It imports only Mathlib, has the required namespace, and names seventeen unstatable headlines with the actual missing admissible/globalized representation, Eisenstein-family, (k,c)-model and automorphic carriers. The native matrix and algebraic Weyl-module identities are inputs or Checks, not replacements for those headlines. Object searches in both pins confirmed the absence of the needed representation-theoretic carriers; mathematical foundations already present were read at their exact pinned files.

The mechanical declaration/signature audit found zero declarations. Thus the requested list of `#check @name` expressions is empty; there is no elaborated type or dropped section binder to compare, and no extra Lean command was run for an empty list. No signatures changed and no Tau Ceti import is used. The newly explicit archimedean wave-front, generalized-Whittaker and mirabolic derivative carriers are README construction targets in §5.1a, with no admitted data definitions in Lean. The metadata is the same single `topic = "math.NT"` key as the main-branch model.

## Supplier repairs and ownership

The source review's mathematical decisions are preserved: every original target, exact hypothesis, API fact and worked example remains. Its conditional supplier obligations are now explicit local targets rather than requests to expand other roadmaps. This is required by the port's rule that a supplier citation refer to an actual existing section/target and that no work be pushed into another roadmap.

Object-based searches covered main, open roadmap README and Lean files, the board packages, and the pinned libraries. The exact gap-label search returned no match. Reading the candidate owners confirmed their narrower contracts: ReductiveGroupsPartII supplies generic groups and root structure; AutomorphicFormsOnReductiveGroups supplies Harish–Chandra and Casselman–Wallach foundations and GL archimedean parameters, not the requested classical/derivative comparisons; AutomorphicSpectralTheory supplies continuation, residual Speh and cuspidal-support decomposition, not all the stated extra support/intertwiner comparisons; MetaplecticAutomorphicForms §6.10a requires splitting characters; EndoscopicTransferAndUnitaryTraceComparison §10.29 supplies canonical GL factors. Consequently the additional comparisons belong to this extension, on those supplied carriers. No fully qualified declaration is copied or introduced in Lean.

| Accepted supplier obligation | Target in the port |
| --- | --- |
| hermitian-unitary-groups; gspin-group-schemes | §0.0, on the supplied Hermitian/Clifford and reductive-group foundations |
| standard-archimedean-transfer | §0.4, with AutomorphicFormsOnReductiveGroups §2.5 on the receiving GL side |
| arbitrary-character-unitary-doubling | Local extension §2.0; completed global extension §3.4 |
| real-chevalley-contragredient | §3.2 |
| classical-support-quotient | §5.0 |
| rectangular-orbit-support | §5.1a |
| archimedean-wavefront-whittaker; archimedean-induced-wavefront | §5.1a |
| archimedean-derivative-models; archimedean-degenerate-derivative; archimedean-whittaker-exactness | §5.1a |
| opposite-unipotent-estimate | §5.6 |
| eisenstein-pole-cuspidal-detection; hermitian-residual-support | §8.0 |
| speh-cusp-normalized-intertwiner | §8.2 |
| twisted-square-normalizers | §8.5 |
| prescribed-classical-supercuspidal-globalization; controlled-gl-test-globalization; automorphic-constituent-support | §10.0 |
| gamma-supercuspidal-support | §10.2 |
| nongeneric-pair-epsilon-character-change | §10.3 |

No original mathematical target was removed as a duplicate during the port. The accepted package already assigns Fourier/Tate/Godement–Jacquet/GL Rankin–Selberg factors, GL isobaric sums, segment constructors, residual Speh representations, general Eisenstein continuation and splitting-character classical doubling to their existing owners; these assignments remain in Scope and ownership. The retained coefficient-field Cauchy decomposition differs from its complex supplier by its characteristic-zero field forms, scalar-extension compatibility and normalized highest-line projectors. The retained converse theorem differs from AL.3 by its fixed ramified twist, outside-S conclusion and nongeneric candidate data. The general spin and unitary coordinate comparisons do not reconstruct the supplied generic form or Clifford theories. No dependency was added on a later roadmap.

## Mathematical and editorial fixes

1. Applied accepted-review F01: the torus-period argument claims failure of absolute convergence for appropriate nonzero data in the large-real-part region. It no longer claims divergence for all s and all kernels. The direct positive-kernel witness retains log R divergence. The SO₄ statement now uses an algebraic isogeny, with the real one-parameter subgroup explicitly in its image; it does not assert surjectivity on F-points.
2. Verified accepted-review F02 at AutomorphicLFunctionsAndLocalFactors AL.2, named target “The Jacquet–Shalika Satake bound.” The supplied package already placed both relevant references in AL.2, so the port preserves that correction and cites AL.3 separately for Rankin–Selberg factors.
3. Made all 22 precise additional supplier obligations explicit local targets, retaining their hypotheses and locators. Added API facts and discriminating Checks for the new group/transfer and arbitrary-character constructions, and explicit Needs entries for their consumers. Qualified the relocated spectral §2.4 reference so it refers to AutomorphicSpectralTheory rather than this roadmap's unitary local equation.
4. Corrected the native `spinGroup` description: Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean line 292 defines a submonoid of the Clifford algebra as Pin intersected with the even subalgebra. The Lipschitz carrier is a subgroup of units; the two native carriers are distinct.
5. Corrected the GK doubling-setup line locator from GK line 504, which discusses wave-front sets, to GK line 556, where §1.5 starts. The stated §1.5 and page-range locator remains.
6. Replaced the dangling reference to a target-folder `sources.toml` by source keys in References; that manifest remains read-only in the source package. Source page/theorem and numbered-extraction locators remain in every target.
7. Specified the full faithful Clifford-point identification in §0.0: vector action alone does not determine a GSpin point because scalar units act trivially on vectors. The rank-zero GU multiplier remains data.
8. Made the newly explicit archimedean transfer statement about actual classical parameters and their composite with r_G, and cited CFK line 478. Its compatibility statement concerns contragredients; a uniform GL scalar-twist rule is not imposed on the two inverse torus weights. The Hermitian-support Check calls 1/4+i a spectral exponent, since its real part is not unitary.
9. Called b^S a partial unramified Euler product, avoiding the misleading suggestion that its indexing set is finite. Every final layer retains its Examples and Dependencies sections. The whole original README and the final changed passages were reread for mathematical and internal consistency.

## Pins and sources

Mathlib pin: `f6090c7095e1e56b3464c1daba5f24631f1290d2`.
Tau Ceti pin: `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`.
Both dependency checkouts match the worktree manifest.

Native declaration checks read Matrix.fromBlocks/fromBlocks_multiply (Mathlib/Data/Matrix/Block.lean lines 45,213), conjTranspose (Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean line 43), IsHermitian (Mathlib/LinearAlgebra/Matrix/Hermitian.lean line 44), trace (Mathlib/LinearAlgebra/Matrix/Trace.lean line 43), AddChar (Mathlib/Algebra/Group/AddChar.lean line 70), lipschitzGroup/spinGroup (Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean lines 61,292), the exact Clifford-group comparison (TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.lean line 138), and the three native Weyl-module declarations (TauCeti/RepresentationTheory/ClassicalGroups/WeylModule/Basic.lean lines 429,441; WeylModule/Irreducible.lean line 160). These definitions do not assert group-scheme representability, smooth admissibility, automorphy, or analytic continuation. The AddChar structure has no continuity, unitarity or nontriviality field; IsHermitian has no nondegeneracy or positivity field.

All twelve certified source PDFs matched the hashes in `packages/AutomorphicLFunctionsAndLocalFactorsPartII/sources.toml`. Read the numbered extractions at the target locators and the relevant proof passages, including MODELS line 194 and line 219; GGS17 line 219 and line 241; GK line 446 and line 4161; CFK line 1455, line 1576, line 1600, line 1632, line 1725 and line 1804; HARRIS line 1170 and line 1184; GARRETT line 164; HEN02 line 216 and line 610; CKPSS01 line 141 and line 174. The unitary covariance computation remains the roadmap's comparison rather than an unqualified transcription of EHLS line 3680. The split-torus entireness counterexample remains explicit instead of importing CFK line 1719 beyond its justified global-integral range.

The public Mathlib/Zulip object search produced no substantive matching admissible/Whittaker/doubling development. It is only a search result, not evidence that no work exists; pinned-source checks determine the signatures. No external text was executed and no suspicious instruction was encountered.

## Unresolved

No port blocker remains. CFK22 Lemma 7.3, KAP23 Theorem 25 and YAM14 Theorem 7.1 retain the accepted source manifest's locator-only, uncertified status; no claim is made to have read those paywalled texts. The README requests their mathematics explicitly and also identifies the accessible CFK statements that attribute those inputs. The seventeen headline signatures still cannot be expressed on the pinned representation carriers, as the accepted Lean docstring explains. These are library construction targets, not sorried surrogate data.

## Adversarial mathematics pass

These are explicit consistency and negative-control calculations, alongside source checks; they are not proofs of the roadmap's deep targets. Section numbers refer to `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md`. The calculations below were recomputed during this port. Parameter restrictions exclude zero rings, characteristic-positive local fields, q=1, k=0, and out-of-range partitions from the corresponding statements. Rank zero is retained exactly where specified.

| Statement | Instances tried | Computed values on the two sides or wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| Local-field and norm convention | ℚ₂, ℚ₃; ℂ/ℝ; split rank one | Norms of uniformizers 1/2,1/3; complex norm of 2 is 4; split norm of (2,3) is 6; q=1 would give norm 1 and is excluded | Consistent | None |
| Quadratic-étale carrier | F×F, its idempotents | (1,0)(0,1)=(0,0), both factors nonzero; a field model cannot contain this pair | Consistent | None |
| Parameter and reflection conventions | s_U=1/4; s_G=1/2 | z=3/4 returns to 1/4, hence s_U returns to −1/4; s_E=0 at s_G=1/2 | Consistent | None |
| Spin central quotient | GSpin₂ and GSpin₃ | Dimensions (G,C•,G/C•)=(2,1,1),(4,1,3); using the whole center in rank two instead gives quotient dimension 0 | Consistent | None |
| Complex powers and germs | positive scalar 4; t=s−s₀ | 4⁰=1; 4⁻²=1/16; ord(t⁻²)=−2; division of germs t⁻²/t⁻¹=t⁻¹, without evaluating either infinite value | Consistent | None |
| Universes and coefficient choices | zero module; E=ℚ(i); scalar π | Zero-dimensional form has one action and many multipliers; 1/2∈E while π∉E; multiplying an E-basis by π changes its E-form | Consistent | None |
| 0.0 U/GU definition and comparison | rank zero; split rank one | U(0)=1 and GU(0)=Gₘ; multipliers 1 and 2 have the same zero action. Paired scaling (2,1/2) has product 1; (2,2) has product 4 | Consistent | Local construction replaces unsupported supplier obligation |
| 0.0 GSpin definition and kernel | c=2; scalar units 1,2 | Central cocharacter rank 1 inside rank 2; scalar 1 and scalar 2 induce the same vector action but are unequal Clifford units | Consistent | Equality uses full Clifford points, never the vector action alone |
| 0.1 doubled form | h=1; (1,−1),(1,1); V=0 | Cross-pairing 1−(−1)=2; both self-pairings 0; at V=0 every pairing is 0 | Consistent | None |
| 0.1 inverse polarization | (u,v)=(3,1) | ((u−v)/2,(u+v)/2)=(1,2); reconstruction (1+2,−1+2)=(3,1); without halves (6,2) | Consistent | None |
| 0.2 radical and modulus | n=1, B=2 over ℂ, λ=1 or 4 | X↦X/4, modulus 1/4; at λ=4 modulus 4/4=1; inverse modulus gives 4 incorrectly | Consistent | None |
| 0.2 radical multiplication | X=i,Y=2i or −i | n(i)n(2i)=n(3i); n(i)n(−i)=n(0)=1 | Consistent | None |
| 0.3 standard degrees | Sp₂, SO₃, GSpin₅ | Degrees 3,2,4; GSp₄ scalar t gives determinant t⁴ and multiplier squared (t²)²=t⁴ | Consistent | None |
| 0.3 split-torus pair | σ=1, χ_π(ϖ)=−1 | Pair (1,−1), product −1=χ_π(ϖ); forgotten twist gives (1,1), product 1 | Consistent | None |
| 0.4 archimedean transfer | Sp₂ standard torus; SO₂ with sgn | Weights t,1,t⁻¹ multiply to 1 and number 3; sgn⊕sgn has determinant 1 and factor Γ_ℝ(s+1)², not Γ_ℝ(s)² | Consistent | Local target replaces missing classical-parameter supplier |
| 1.1 induction covariance | n=1,s=0,χ=1, norm B=4 | Half-modulus 4⁻¹/²=1/2; χ replaced by norm gives 4·1/2=2; inverse half-modulus alone gives 2 incorrectly | Consistent | None |
| 1.2 Godement section | n=1,s=0,p=diag(4,1), trivial χ | (0,x)p=(0,x); prefactor 4¹/²=2. Measure 3d×x multiplies section value 2 to 6; zero Φ gives 0 | Consistent | None |
| 1.3 Weyl action and Eisenstein shift | χ=normⁱ at B=2; χ angular | Norm character changes 4ⁱ→4⁻ⁱ→4ⁱ; angular χ(i)=i remains i under χʷ, while χ⁻¹(i)=−i | Consistent | None |
| 2.0 arbitrary unitary inducing character | split ℚ₃, χ=(ramified quadratic,1) | χ(2,2)=−1; every split splitting character and norm twist gives 1 at (2,2); extension is necessary | Consistent | Local and global extensions assigned to 2.0 and 3.4 |
| 2.1 integral and divided pairing | compact group mass 7, f=1, pairing 2 | Z=14, I=7; pairing 10 gives Z=70 and I=7; zero vector gives Z=0 with denominator 0 | Consistent | None |
| 2.2 denominator and recurrence | q=2,χ=1,n=0,1,2,η(ϖ)=−1 | d₀=1, d₁(0)=2, d₂(0)=(4/3)(2/3)=8/9; d₁(1/2)·new factor=(4/3)(2/3); forgetting η gives 8/3 | Consistent | None |
| 2.3 spherical identity | X=1/2,Y=1/3 | Z=2+1/2=5/2; d=6/5; dZ=3=(1−X)⁻¹(1−Y)⁻¹ | Consistent | None |
| 2.3 contragredient label | β(ϖ)=i,χ_w=1,χ_wbar=−1,t=1/2 | X=Y=−i/2; factor=(3/4+i)⁻¹; omitting dual gives (3/4−i)⁻¹ | Consistent | None |
| 2.3 dyadic lattice | ℚ₂,t=1/2,χ=β=1 | Compatible lattice: Z=(1+t)/(1−t)=3 and dZ=4; polarization product lattice: Z=1+2t³/(1−t)=3/2 and dZ=2 | Consistent | None |
| 2.4 typed returning intertwiner | χ angular at i; s=1/4 | χʷ(i)=i, χ⁻¹(i)=−i; (χʷ)ʷ=χ and s→−s→s | Consistent | None |
| 3.1 global period and zero pairing | S₃ standard module, v=(1,−1,0), ℓ(x)=x₃ | ℓ(v)=0; ℓ((23)v)=−1; zero pairing does not force every convolution period to be zero | Consistent | None |
| 3.2 MVW and real Chevalley comparison | norm-one z=eⁱπ/⁶; split GL₂ rotation r_φ | z²=eⁱπ/³ maps to e⁻ⁱπ/³; transpose-inverse fixes r_φ, while conjugation by diag(1,−1) changes it to r_−φ | Consistent | General real theorem assigned here |
| 3.3 Garrett output | character of order 3; scalar transport 2 | Output χ pairs with χ⁻¹ and χ≠χ⁻¹; embedding 2 and dual 1/2 give pairing factor 1; zero section gives 0 | Consistent | None |
| 3.4 completed unitary reflection | z=3/4; χ angular | Reflected z=1/4; returning twist (χʷ)⁻¹=χᶜ=χ⁻¹, with value −i at i; dual-of-numerator label agrees after conjugation | Consistent | Global arbitrary-character extension retained as target |
| 4.1 strong positivity and dual | a=b=1; κ=(0;0),(1;−1),(2;−1) | Gaps 0,2,3; threshold 2; μ=(0,0) at boundary; generator weight for (2;−1) is (−2;1); compact a=0 has degree ab=0 | Consistent | None |
| 4.2 scalar holomorphic model | n=1,m=3,aχ=2,bχ=0,z=eⁱπ/⁴ | Λ=(1;−3); generator (−1;3); Jχ=z⁻¹zbar⁻³=z²=i; swapped parameter gives −i; Jχ(1)=1 | Consistent | None |
| 4.3 injective realization | generating vector normalized at 1 | Image value 1, zero-map value 0; a nonzero map from the irreducible module has kernel dimension 0 | Consistent | None |
| 4.4 Cauchy dimensions | u=2,d=2; u=d=0 | Sym² dimension 3, wedge² dimension 1, polynomial dimension 10=3²+1²; constants have dimension 1 also at u=0 | Consistent | None |
| 4.4 action and Borel | two noncommuting unipotents; X=I | h⁻¹g⁻¹=[[1,−1],[−1,2]]; reversed product [[2,−1],[−1,1]]; upper first Borel changes X₁₁ by −X₂₁, lower first Borel fixes it | Consistent | None |
| 4.4 rational projectors | E=ℚ(i), tensor square E² | (1±swap)/2 have squares themselves, product 0, sum 1 and ranks 3,1; π-rescaling fails the E-form | Consistent | None |
| 4.5 branching and determinant twist | a=b=1,m=3,aχ=2,bχ=0,r=1,s=0 | Generator (−2;3); dual-and-swap (−3;2); add 2 gives opposite (−1;4); central product at eⁱπ/⁸ is i; inverse twist gives −i | Consistent | None |
| 4.6 raising operator | r=s=0; r=(1,1),A=[[1,2],[3,4]] | Symbol 1 of degree 0; differences (0,1) give determinant −2 of degree 2, while Δ₁²=1 | Consistent | None |
| 4.7 highest-line projection | normalized minor and scalar rescaling | Coefficient of selected diagonal monomial is 1; rescaling input by 2 changes projected coefficient P to 2P, nonzero if P≠0 | Consistent | None |
| 4.8 critical inducing fiber | m=3,aχ=2,bχ=0,n=1,B=2 | t=2,scrit=3/2; Jχ=2⁻¹2⁻³=1/16; χ_u⁻¹(2)·4⁻¹/²⁻³/²=1/16; phase at eⁱπ/⁴ is i, opposite χ_u gives −i | Consistent | None |
| 4.9 critical nonvanishing | rank-one disk, scalar m=2; projection B=2,P=3 | Integral π/(2−1)=π≠0; scaling by BP gives 6π≠0, zero B would instead give 0 | Consistent | None |
| 4.10 algebraicity and Haar | disk,m=2,3; measure doubled | I=π,π/2; π⁻¹I=1,1/2; doubling Haar gives 2π,π; compact ab=0 needs power π⁰=1 | Consistent | None |
| 5.0 quotient cuspidal support | GL₂ trivial/Steinberg; one spin GL₁ block | Support {ν¹/²,ν⁻¹/²} on both sides, quotient order differs; σ=1,χπ(ϖ)=−1 sends twisted dual to −1 rather than 1 | Consistent | Quotient comparison assigned here |
| 5.1 unipotent character | k=1; k=c=2; k=3,c=1 | Empty trace 0 gives 1; diag(1,2) gives trace 3; product adjacent traces (1+2)+(3+4)=10, top-right cross term 4 absent | Consistent | None |
| 5.1 stabilizer | k=2,c=1; scalars a,b | Adjacent coordinate scales by a/b; a=b=2 gives coefficient 1, a=2,b=1 gives 2, so only diagonal scalings stabilize every character value | Consistent | None |
| 5.1a finite rectangular derivatives | k=2,c=2; generic GL₄ | Orders 2,2 reach rank 0 and prefix sums 2,4; generic first order 4 exceeds the first rectangular bound 2 | Consistent | Local target replaces supplier gap |
| 5.1a associated-variety carrier and comparison | GL₂(ℝ), trivial versus generic representation | Trivial nilpotent orbit has dimension 0; regular nilpotent orbit has dimension 2, with the same dimensions 0 and 2 for their Zariski closures. A zero associated variety cannot represent the generic case | Consistent | Construction explicit here |
| 5.1a archimedean wave-front/Whittaker | GL₂ determinant character and generic module | Orbit (1,1) has ordinary Whittaker dimension 0; generic orbit (2) has ordinary Whittaker dimension 1 | Consistent | Local target replaces supplier gap |
| 5.1a induced wave-front | two GL₁ characters, generic principal series | Induced regular GL₂ orbit partition (2), versus blocks (1),(1); orbit dimensions 2 versus 0+0, accounting for twice the radical dimension 1 | Consistent | Local target replaces supplier gap |
| 5.1a archimedean derivative model | k=1,c=2 | First and second derivative ranks 1,0; terminal vector dimension 1 gives functional dimension 1, not ordinary generic dimension 0 | Consistent | Local target replaces supplier gap |
| 5.1a degenerate principal-series derivative | k=2,c=2 and k=1,c=1 | Ranks 4→2→0, highest order 2 each time; at k=c=1 derivative rank 0 and character value on GL₀ is 1 | Consistent | Local target replaces supplier gap |
| 5.1a exact contravariant functor | direct sum of two identical rectangular models | Functional dimensions in exact sequence 1→2→1; maps reverse quotient/inclusion, with kernel and image dimensions 1 | Consistent | Local target replaces supplier gap |
| 5.2 model definition and Speh comparison | c=1; k=1,c=2 | ρ₁(τ)=τ; ρ₂(character)=character∘det, functional dimension 1 and ordinary GL₂ Whittaker dimension 0 | Consistent | None |
| 5.2 admissible infinite length | ℚ₂, m=1,2,3 | Added determinant-character fixed dimensions max(m−1,0)=0,1,2; no conductor-one character because ℤ₂×/(1+2ℤ₂)=1 | Consistent | None |
| 5.2 coefficient image | 1⊕σ, λ projection to 1 | Every σ-vector maps to zero; input (1,0) has coefficient value 1, input (1,w) has the same value 1 despite unequal vectors | Consistent | None |
| 5.3 doubling geometry | k=1; Sp₂,k=2; GSpin₂ | U=U₀=1 gives inner mass 1; middle entries 1,2 give ψ(3), not ψ(1); spin diagonal (z,z) maps to 1 and central quotient dimension is 1 | Consistent | None |
| 5.3 conjugation into Levi | g=1 | δ·1·δ⁻¹=1 lies in Levi; δ·1=δ has a nonzero off-Levi block in Sp₂,k=2 coordinates | Consistent | None |
| 5.4 c-splitting and determinant twist | k=2,c=3,l=1; c=3,l=2 | Exponent (6−2−3+1)/2=1 and norm 1/2 gives factor 1/2; second instance has c−2l=−1 so no classical transform, though c-splitting exists | Consistent | None |
| 5.4 restriction noninjective | ℚ₃,k=3,l=1,ψ(1/3)=ζ₃ | W′ on diag(a,1,1) is 0; at diag(1,2,1) it is ζ₃²−ζ₃≠0 | Consistent | None |
| 5.5 section families | s=1/2 and s=0 | Determinant norm exponent 0 gives 1; constant compact section entire; multiplying by (1−q⁻ˢ)⁻¹ creates a pole at 0 | Consistent | None |
| 5.6 growth and opposite-unipotent bound | k=c=2 identity; SL₂ real parameter ν=1 | Adjacent determinant ratios 1 give seminorm bound β(ξ); spherical opposite-unipotent integral ∫ℝ(1+x²)⁻¹dx=π finite; at ν=0 exponent −1/2 gives logarithmic divergence | Consistent | Positive chamber and continuity retained as local target |
| 6.1 descended integral | ψ(1/3)=ζ₃; central coefficient scale 2 | Correct V factors ζ₃·ζ₃⁻¹=1; inverse wrong convention gives ζ₃²≠1; central factors 2·1/2=1 versus either omitted factor 2 or 1/2 | Consistent | None |
| 6.2 continuation and nonzero data | torus ℚ₂,k=1,s=1 | Z=3 finite and nonzero; at s=0 its continued denominator has zero, so no assertion that every spherical section stays finite | Consistent | None |
| 6.3 multiplicity one | SO₂ flag ℙ¹; conormal derivative test | One full-torus open orbit, two closed points; restricting to spin-cover points would split it into 8 square classes over ℚ₂; distribution derivative δ′ has degree 1 and is not tested by degree 0 alone | Consistent | None |
| 6.4 normalized intertwiner | s=1/4; λ rescaled by exp(s) | Reflected s=3/4 and twice returns 1/4; scalar correction exp(2s−1), at s=0 exp(−1)≠1 | Consistent | None |
| 6.5 gamma normalization | c=2,k=1,s=1; ℚ₂ versus ℚ₃ | Power-of-two scalar 2 versus 1; at s=1/2 norm factor 1; Sp₀ Tate gamma is (1−q⁻ˢ)/(1−qˢ⁻¹), not 1 | Consistent | None |
| 6.6 duality, twist and ψ change | c=N=2,k=1; αβ=χπ | Two GL factors give χπ(b)χτ(b)²·norm(b)²ˢ⁻¹, matching classical rule; reflection twice gives (s,τ); twisted dual pair swaps α⁻¹,β⁻¹ | Consistent | None |
| 6.7 normalized zero polynomial | P=1−2X; ramified quadratic at ℚ₃ | P(0)=1, root 1/2; γ=−3X² has no root on ℂ×, so P=1,L=1; counting the zero at X=0 would give constant term 0 | Consistent | None |
| 6.7 empty block and non-tempered test | b=1/4, empty classical GL block | Factors L(s+1/4)L(s−1/4); Sp₀ contributes L(s,τ), not 1 | Consistent | None |
| 6.8 spherical denominator | c=2,k=1,χπ=1,s=1,q=2 | Sym² factor L(2)=4/3; wedge² factor 1; SO₂ Z=3 gives bZ=4; Sp₂ has extra L(2)=4/3 | Consistent | None |
| 6.9 holomorphy range | trivial tempered Tate factor; exponent ±1/4 | Tate pole lies at Re(s)=0; shifted poles ±1/4 lie left of 1/2; quotient removing the negative-exponent factor leaves the positive shift with no zero | Consistent | None |
| 6.10 stability | characters fixed before a deeper ramified η | If both products with η remain ramified, their Tate L-factors are 1 and 1; unequal determinants leave a ψ-change ratio χ(b)≠1, explaining central-character matching | Consistent | None |
| 6.11 torus local factors | SO₂ trivial at ℚ₂,s=1; spin pair 1,−1 at q=3 | 4=(1−1/2)⁻² and bZ=(4/3)3; spin factor (3/2)(3/4)=9/8 versus omitted χπ gives 9/4 | Consistent | None |
| 6.11 ramified/nonunitary scope | ℚ₃,μ=ramified quadratic·norm⁻¹,τ=quadratic,s=2 | L(s−1)L(s+1)=(3/2)(27/26)=81/52; no single τ shift makes exponents −1,+1 both zero | Consistent | None |
| 7.1 auxiliary GL integral | k=1,c=2; k=2,c=1; k=c=1 | Exponents s+1/2 and s−1/2; omitting Φ in rank one requires both Re(s)>0 and Re(s)<0, impossible | Consistent | None |
| 7.2 auxiliary sign and uniqueness | c=1,k=2,π=sgn; c=2,k=2,π=sgn∘det | Central sign −1 in first case, +1 in second since det(−I₂)=1; evaluating det character at scalar −1 incorrectly gives −1 in second case | Consistent | None |
| 7.3 common pole divisor | {P⁻¹,XP⁻¹},P=1−X/2; {t⁻¹,t⁻²} | Root X=2 has pole order 1; second family maximal pole order 2 and t²t⁻²=1 attains it; multiplying by exp(s) changes orders by 0 | Consistent | None |
| 7.4 domination direction | L_RS=t⁻¹, auxiliary=t⁻² | L_RS/auxiliary=t entire; attained Z/L_RS=t⁻¹ has a pole yet is nonzero; reverse quotient is not entire | Consistent | None |
| 7.5 open-chart lower model | k=2,c=3,l=1 | Lower restriction twist exponent 1; norm 1/2 yields factor 1/2 rather than 1; only restriction values enter the auxiliary integral | Consistent | None |
| 7.6 pole attainment | ord L=−1, ord Z=−2 | ord Z≤ord L is −2≤−1; Z/L=t⁻¹ is allowed; supplier variable s_G=1/2 corresponds to its s=0 | Consistent | None |
| 8.0 pole detection | Laurent coefficient t⁻²A+t⁻¹B | Nonzero constant term of A retains pole order 2; if it killed A only order ≤1 survives, exactly the excluded failure | Consistent | Local theorem replaces unprovided supplier condition |
| 8.0 Hermitian support | λ=1/4+i | −λbar=−1/4+i; ordinary negation gives −1/4−i and wrong imaginary sign | Consistent | Local theorem replaces unprovided supplier condition |
| 8.1 global Speh datum and θ | SL₂,τ=1,forbidden independent θ | Section norm(a)ˢ⁺¹ gives classical parameter (s+1)/2; classical residue 3/π becomes 6/π at s=1; θ=1 makes τ self-dual and excludes the pole example | Consistent | None |
| 8.2 two-term recursion and normalizers | c=2,c′=1,s=1/2 | M₁ range Re(s)>−1/2; N₂ range Re(s)>0; ratio L(1)/L(2), holomorphic numerator under exclusion and nonzero denominator | Consistent | Speh-block operator theorem assigned here |
| 8.3 residual exponents | c=2,Re(s₀)=1/4,0 | First vector bound −3/4, tail ≤1/4; prefix sums ≤−3/4,−1/2; boundary final bound 0 | Consistent | None |
| 8.4 Eisenstein holomorphy | c=1,τ=1,θ=1 | Exclusion fails at t=0; residue 6/π of SL₂ is therefore outside theorem; unitary-axis parameter has real part 0 | Consistent | None |
| 8.5 twisted square factors | k=1,c=2,s=1/2 | Sym² argument 1, wedge² argument 2, Sp standard argument 3/2; wedge² rank-one factor 1; trivial Sym² has a pole at 1 but fails nonduality | Consistent | Square-factor holomorphy assigned here; partial product wording fixed |
| 9.1 global torus exclusion | SO₂/ℚ,k=1,positive spherical kernel | Weights a/b,ab,(ab)⁻¹,b/a; kernel independent of b; ∫₁ᴿdr/r=log R; nonzero inner product constant forces infinite absolute outer integral for large Re(s) | Consistent after correction | Review note F01: limit divergence claim to demonstrated region/data and use algebraic isogeny |
| 9.1 good-place factorization | good local L=4,b=4/3,Z=3 | bZ=4 and Z=L/b=3; inserting good place into S multiplies partial side by 1/L and restores bZ=L | Consistent | None |
| 9.2 completed product and ψ independence | local L=2; rational b=2 over ℚ | Euler deletion/restoration (1/2)·2=1; norm product 2·(1/2)=1; real-only idele instead has norm 2 | Consistent | None |
| 9.3 completed/crude functional equations | two rank-one Tate factors; reflection | ε-products multiply, s→1−s twice returns s; at the central point 1/2 both arguments equal 1/2; finite strip constants are for fixed representations | Consistent | None |
| 9.4 order argument | ord Q=−1,ord(bZ)=0 | ord L=0−(−1)=1≥0; falsely requiring Q holomorphic would discard a valid zero of L | Consistent | None |
| 9.5 entire iff criterion | π=τ=1 over ℚ; order-three μ over ℚ(√−23) | Λ(s)² has double poles 0,1; μτ=1 gives Λ_F(s)Λ(s,μ⁻²) with pole at 1 despite nonself-dual τ; a sufficiently ramified ν makes both rank-one factors entire | Consistent | Split-torus exception preserved |
| 10.0 automorphic constituent support | no GL block; one GL₁ block | Standard degrees N₀ and N₀+2; omitting the dual would give N₀+1; positive chamber has no coordinates for a torus | Consistent | Local theorem replaces supplier gap |
| 10.0 prescribed classical globalization | unitary supercuspidal; norm twist ζ | Unit exponent 0 gives twist 1; twist and inverse central multipliers norm(z)ᵗ·norm(z)⁻ᵗ=1 | Consistent | Local theorem replaces supplier gap |
| 10.0 controlled GL test globalization | T={v₁},auxiliary w | Cancellation ratios at v₁,w both 1; uncontrolled factors away v₀ count 0, versus 1 if test ramification were permitted at v₁ | Consistent | Local theorem replaces supplier gap |
| 10.1 weak transfer predicate | Sp₂; two GL₁ summands a=3,b=1/3 | Degree 3 for Sp₂; degree-two polynomial 1−(10/3)T+T² for the sum; enlarging excluded set only deletes conditions | Consistent | None |
| 10.2 coarse support characterization | GL₂ trivial versus Steinberg | Shared support {ν¹/²,ν⁻¹/²}; L-ratio L(s−1/2); gamma cancellation (1−q¹/²⁻ˢ)/(1−qˢ⁻¹/²)=−q¹/²⁻ˢ | Consistent | Support theorem assigned here; no nongeneric-isomorphism claim |
| 10.3 twisted converse and Euler convergence | N=2,3; Satake exponents σ₀,1/2 | Testing ranks {1},{1,2}; prime bound qᵛ^(σ₀+1/2−σ) summable for σ>σ₀+3/2; inverse bound q^((N−1)σ₀) when determinant norm 1 | Consistent | Review F02: AL.2 citation retained, distinct from AL.3 factors |
| 10.3 nongeneric epsilon ψ change | N=2,k=1,b=2,s=1 over ℚ | Norm scalars 2 and 1/2 multiply to 1; central Hecke characters on rational 2 multiply to 1; a real-only idele leaves norm 2 | Consistent | Character-change theorem assigned here |
| 10.4 weak transfer existence/twist | SO₂ μ(ϖ)=3; η of 2-adic conductor m≥4 | Polynomial (1−3T)(1−T/3)=1−(10/3)T+T²; squaring conductor becomes m−1, hence can exceed any fixed conductor threshold | Consistent | None |
| 10.5 all-place coarse transfer | T={v₁},auxiliary w; torus α⊞β | Stability cancels v₁, spherical comparison cancels w, so 0 uncontrolled factors; torus gamma product has exactly the two α,β factors | Consistent | None |
| 10.6 local existence | l=1 classical support block | N=N₀+2 and gamma block product γ(σ×τ)γ(χπσ∨×τ); for GSpin₀ tail γ=1, for Sp₀ tail γ=γ(τ) | Consistent | None |
| 10.7 general automorphic transfer | no blocks; one GL₁ block | No blocks returns transferred cusp datum; one block adds two dimensions; Sp₀ tail contributes degree 1, giving Sp₂ degree 3 | Consistent | None |


The following table separately records each API bullet, in its order within the subsection. Formal covariance, naturality and uniqueness computations are restricted to the displayed test data; they do not replace the general source-backed target.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| 0.0 API 1: The U comparison preserves multiplication and identifies the form-preserving automorphisms. | Small-rank or scalar test | Split scalings (2,1/2)(3,1/3)=(6,1/6), preserving pairing multiplier 1. | Consistent | None |
| 0.0 API 2: The GU comparison preserves both the action and the recorded multiplier | Small-rank or scalar test | Rank-zero actions equal 0 but multipliers 1≠2; pairs (0,1),(0,2) are unequal. | Consistent | None |
| 0.0 API 3: The GSpin comparison identifies the even Lipschitz points, the map to SO and e₀∨ with the suppl | Small-rank or scalar test | Scalar 2 is even and its vector action is identity; e₀∨ has rank 1, retained inside rank-two GSpin₂. | Consistent | None |
| 0.1 API 1: In an h-basis the Gram matrix is Matrix.fromBlocks H 0 0 (−H). | Small-rank or scalar test | H=(1) gives blocks diag(1,−1), evaluating (1,1) to 0. | Consistent | None |
| 0.1 API 2: A⊕D≃W has the inverse displayed in the definition. | Small-rank or scalar test | (3,1)→(1,2)→(3,1); missing halves gives (6,2). | Consistent | None |
| 0.1 API 3: The isometry embedding respects multiplication | Small-rank or scalar test | Diagonal norm-one scalars i and −1 multiply to −i in each factor; unequal similitude multipliers 1,4 do not form a pair in the fiber product. | Consistent | None |
| 0.1 API 4: An isometry of hermitian spaces induces the doubled isometry, preserving A and D and commuting  | Small-rank or scalar test | Isometry x↦ix sends (1,−1) to (i,−i) and cross-pairing 2 to 2. | Consistent | None |
| 0.1 API 5: A linear map from W is determined by its restrictions to A and D | Small-rank or scalar test | A,D coordinates (1,2) sum to (3,1); zero on both coordinate axes implies zero on their sum. | Consistent | None |
| 0.2 API 1: Identify M with GL_E(V)×F× and record the restrictions Δ and ν. | Small-rank or scalar test | n=1,B=2,λ=4 gives m=diag(2,2), D-entry 2 and multiplier 4. | Consistent | None |
| 0.2 API 2: The skew-adjoint block space is the additive radical N | Small-rank or scalar test | Trace-zero t=i sends Y=1,2,3 to i,2i,3i and i+2i=3i. | Consistent | None |
| 0.2 API 3: δ_mod(m(B,λ))=∣λ∣_F^(n²)∣det B∣_E^(−n) | Small-rank or scalar test | n=1 gives norm(4)/norm_C(2)=4/4=1; λ=1 gives 1/4. | Consistent | None |
| 0.2 API 4: Two Levi elements agree iff their D-coordinate B and multiplier λ agree. | Small-rank or scalar test | Pairs (B,λ)=(2,1),(2,4) give first blocks 1/2 and 2, so matching B alone fails equality. | Consistent | None |
| 0.2 API 5: Every p∈P factors uniquely as a Levi element times a radical element | Small-rank or scalar test | For m=diag(1/2,2) and n(i), m n(i) has upper entry i/2; n(X)m has upper entry 2X, hence unique X=i/4. | Consistent | None |
| 0.3 API 1: Return the five degrees N and their dual groups. | Small-rank or scalar test | At n=1 the five degrees are 3,2,2,2,2. | Consistent | None |
| 0.3 API 2: Restrict the GSpin central character along e₀∨, with value 1 for the other families. | Small-rank or scalar test | Nonspin restriction is 1; GSpin₂ with χπ(ϖ)=−1 has restriction −1. | Consistent | None |
| 0.3 API 3: For SO₂ and GSpin₂, the split-torus pair (α,β) has product χ_π and sum r∘t_π, independently of  | Small-rank or scalar test | Pairs (1,−1),(−1,1) both have product −1 and polynomial 1−T². | Consistent | None |
| 0.3 API 4: The determinant of each standard transfer has the character specified above. | Small-rank or scalar test | GSp₄ scalar 2 gives determinant 16 and similitude 4, with 4²=16. | Consistent | None |
| 0.3 API 5: Pinned isomorphisms transport r and the distinguished-central-torus embedding, preserving N and | Small-rank or scalar test | Conjugating diag(2,1/2) by the permutation matrix exchanges entries, keeps degree 2 and determinant 1. | Consistent | None |
| 0.4 API 1: The parameter and T(π) are invariant under representation isomorphism and the chosen parameter  | Small-rank or scalar test | Conjugate matrices diag(2,1/2),diag(1/2,2) have the same polynomial 1−(5/2)T+T². | Consistent | None |
| 0.4 API 2: The determinant equals the central character prescribed by §0.3, and the infinitesimal characte | Small-rank or scalar test | Sp₂ weights t,1,t⁻¹ have exponent sum 0 and degree 3; GSpin₃ weights 2,3 have determinant 6. | Consistent | None |
| 0.4 API 3: Contragredients commute with standard transfer, and the resulting Harish–Chandra-module isomorp | Small-rank or scalar test | Dual weights of (2,3) are (1/2,1/3); dualizing twice returns (2,3), and the dual determinant 1/6 equals 6⁻¹. | Consistent | None |
| 1.1 API 1: The covariance is the complete δ_mod^(1/2)χ(det Δ)δ_EHLS^(−s/n)∣ν∣^(sn/2) covariance. | Small-rank or scalar test | n=1,s=0,norm B=4,χ=1 gives 1/2; the full ν=1 factor is 1. | Consistent | None |
| 1.1 API 2: All parameter fibers have the same compact-picture carrier. | Small-rank or scalar test | At K-identity normalized flat sections at s=0 and s=1 both have value 1. | Consistent | None |
| 1.1 API 3: Restriction to multiplier 1 removes exactly the ν factor. | Small-rank or scalar test | ν=1 gives 1 to every exponent; ν=4 gives 4 at exponent 1. | Consistent | None |
| 1.1 API 4: Extend a smooth compact-picture function satisfying the P∩K covariance uniquely to the normaliz | Small-rank or scalar test | For a compact value 1, n=1,s=0,B=2,χ=1 the unique extension value is 1/2. | Consistent | None |
| 1.1 API 5: Sections in a fixed fiber agree if their restrictions to K agree | Small-rank or scalar test | Compact-picture difference 0 extends with covariance times 0=0 on PK=G. | Consistent | None |
| 1.2 API 1: The assignment Φ↦f_Φ is linear on its convergence domain and on the continued family. | Small-rank or scalar test | Φ=0 gives 0; replacing Φ by 3Φ triples every integral, so value 2 becomes 6. | Consistent | None |
| 1.2 API 2: For p=[[A,B],[0,D]], f_Φ(pg)=χ₂(det A)χ₁(det D)∣det A/det D∣^(n/2+s)f_Φ(g) on ν=1. | Small-rank or scalar test | p=diag(4,1),n=1,s=0 gives factor 2 on both sides. | Consistent | None |
| 1.2 API 3: Right translation of g corresponds to the same right translation of Φ. | Small-rank or scalar test | Both translated expressions evaluate Φ at the same row (0,x)gh; at g=h=1 they both evaluate Φ(0,x). | Consistent | None |
| 1.2 API 4: Equal Schwartz functions give equal sections, first on the convergence half-plane and then as c | Small-rank or scalar test | Φ−Φ=0 yields section difference 0 in the chamber and zero continued germ. | Consistent | None |
| 2.0 API 1: The arbitrary-character integral specializes to the splitting-character integral with the same  | Small-rank or scalar test | At a splitting character χ=1 the new restriction to F× is 1, so the old and new integrands coincide termwise. | Consistent | None |
| 2.0 API 2: Its normalized intertwiner and local factors obey the functional equation for the complete indu | Small-rank or scalar test | Angular χ has χʷ(i)=i, not χ⁻¹(i)=−i; twice Weyl transform returns i. | Consistent | None |
| 2.0 API 3: The good-section ideal and the spherical denominator retain the normalization transported in §§ | Small-rank or scalar test | Rank one at X=1/2,Y=1/3 gives d=6/5,Z=5/2,dZ=3. | Consistent | None |
| 2.1 API 1: Z_U is linear in section, vector and smooth dual vector. | Small-rank or scalar test | On compact mass-one specialization f=v=ℓ=1, Z=1; scaling any one input by 3 gives 3. | Consistent | None |
| 2.1 API 2: I_U·ℓ(v)=Z_U whenever ℓ(v)≠0. | Small-rank or scalar test | Pairing 2,Z=6,I=3 gives I·pairing=6; pairing 0 excludes division. | Consistent | None |
| 2.1 API 3: Scaling dg by a scales both Z_U and I_U by a. | Small-rank or scalar test | Mass 7,pairing 2 gives Z=14,I=7; double Haar gives 28,14. | Consistent | None |
| 2.1 API 4: A representation isomorphism and its dual inverse preserve the evaluation matrix coefficient, h | Small-rank or scalar test | Vector transport 2 and dual transport 1/2 give coefficient multiplier 1, so original and transported values 14 agree. | Consistent | None |
| 2.2 API 1: The denominator consists of the n Tate factors with the index r and η parity. | Small-rank or scalar test | n=2 uses shifts 2s+2 and 2s+1 with η-powers 0 and 1. | Consistent | None |
| 2.2 API 2: d_(n+1)(s,χ)=d_n(s+1/2,χ)·L_F(2s+1,χ∣F×·η^n). | Small-rank or scalar test | q=2,s=0 gives (4/3)(2/3)=8/9=d₂. | Consistent | None |
| 2.2 API 3: The right-action spherical identity uses d_n(s,χ⁻¹), not d_n(s,χ). | Small-rank or scalar test | χ(ϖ)=2 gives inverse value 1/2; the rank-one factors (1−2T)⁻¹ and (1−T/2)⁻¹ differ, e.g. at T=1/4 they are 2 and 8/7. | Consistent | None |
| 2.2 API 4: The n=0 product is 1 | Small-rank or scalar test | n=0 gives product 1; induction expression s/n is not used at n=0. | Consistent | None |
| 3.2 API 1: θ²=Id and θ respects multiplication. | Small-rank or scalar test | On norm-one i,j=−1, conjugation sends product −i to i, equal to (−i)(−1); twice conjugation returns i. | Consistent | None |
| 3.2 API 2: π∘θ is isomorphic to the smooth contragredient π∨. | Small-rank or scalar test | Character z² at z=eⁱπ/⁶ changes eⁱπ/³ to e⁻ⁱπ/³, its dual. | Consistent | None |
| 3.2 API 3: Changing the diagonalization changes the involution by an inner automorphism, preserving the is | Small-rank or scalar test | Scalar tori have trivial inner conjugation; both diagonalizations give the same inverse character value e⁻ⁱπ/³. | Consistent | None |
| 3.2 API 4: Pullback by the chosen involution is a functor on representations and continuous intertwining m | Small-rank or scalar test | Two pullbacks send a scalar intertwiner 2 to 2 and a character χ to (χ⁻¹)⁻¹=χ. | Consistent | None |
| 3.3 API 1: Pairing G_f(φ) with φ′ equals the global doubling period. | Small-rank or scalar test | For f=0 both the paired pullback and the period are 0. | Consistent | None |
| 3.3 API 2: The map is linear in f and φ. | Small-rank or scalar test | Replacing f by 3f changes paired value 2 to 6; replacing cusp vector by 0 gives 0. | Consistent | None |
| 3.3 API 3: At the specialized nearly holomorphic section, the Hecke action is transported through the spec | Small-rank or scalar test | On an order-three character with Hecke eigenvalue ζ₃, the specified involution changes dual eigenvalue to ζ₃⁻¹, and returns it under bidual identification. | Consistent | None |
| 3.3 API 4: Transport the chosen cusp embedding and its dual pairing together | Small-rank or scalar test | Embedding scalar 2 and dual 1/2 produce multiplier 1 on the period and its identified output. | Consistent | None |
| 4.1 API 1: The generating subspace is W_κ∨ annihilated by p⁻. | Small-rank or scalar test | κ=(2;−1) has generator weight (−2;1); p⁻ acts as 0 on that generator. | Consistent | None |
| 4.1 API 2: The K-finite dual is D_c(κ) with generating type W_κ annihilated by p⁺. | Small-rank or scalar test | Dualizing again yields weight (2;−1), with the opposite nilpotent p⁺ acting as 0. | Consistent | None |
| 4.1 API 3: In the strongly positive range the specified degree-ab cohomology has dimension one. | Small-rank or scalar test | κ=(1;−1),a=b=1 gives cohomology degree 1 and dimension 1. | Consistent | None |
| 4.1 API 4: A K-map from W_κ∨ into a (g,K)-module, annihilated by p⁻, extends uniquely to a U(g)-map from D | Small-rank or scalar test | Identity on the generating type extends to identity; zero map extends to zero, taking the generator to 1 and 0 respectively. | Consistent | None |
| 4.1 API 5: Two such module maps agree once they agree on the generating K-type | Small-rank or scalar test | For maps agreeing on v, every monomial Xᵈv has equal images Xᵈf(v); at d=0,1 their differences are 0,0. | Consistent | None |
| 4.2 API 1: ι_χ(v_χ)=J_χ on the multiplier-one group. | Small-rank or scalar test | At identity Jχ=1, while zero realization gives 0. | Consistent | None |
| 4.2 API 2: The two canonical factors satisfy the group-action cocycle with their specified block actions. | Small-rank or scalar test | For scalar compact elements z,w, determinant factors obey j(zw)=zw=j(z)j(w); z=i,w=−1 gives −i on both sides. | Consistent | None |
| 4.2 API 3: A GU extension records and verifies its full central character independently of the U restricti | Small-rank or scalar test | Two extensions ν⁰,ν¹ agree at ν=1 and differ at ν=4 by values 1,4. | Consistent | None |
| 4.2 API 4: Transport by a group element carries the base point, compact subgroup and J factors together, a | Small-rank or scalar test | At the transported base point identity factors remain 1; both scalar realizations take their transported generator to 1. | Consistent | None |
| 4.4 API 1: The Cauchy isomorphism has source the degree-d polynomial space and target the displayed direct | Small-rank or scalar test | u=d=2 gives source dimension 10 and target dimensions 9+1=10; d=0 gives 1=1. | Consistent | None |
| 4.4 API 2: Its summand projectors are field-linear pairwise orthogonal idempotents with sum the identity | Small-rank or scalar test | On symmetric/alternating basis vectors, P+ eigenvalues are 1,0 and P− eigenvalues 0,1; product 0 and sum 1. | Consistent | None |
| 4.4 API 3: The minor normalization and these maps commute with extension from the prime field, allowing co | Small-rank or scalar test | Leading diagonal coefficient of Δ₂=X₁₁X₂₂−X₁₂X₂₁ is 1 over ℚ,ℚ(i),ℂ. | Consistent | None |
| 4.6 API 1: The PBW symbol is the displayed minor product. | Small-rank or scalar test | r=(1,1) gives symbol Δ₂, value −2 on [[1,2],[3,4]]. | Consistent | None |
| 4.6 API 2: The operator is defined over the specified algebraic coefficient field. | Small-rank or scalar test | Coefficients of Δ₂ are 1,−1, belonging to ℚ and every allowed E. | Consistent | None |
| 4.6 API 3: Its PBW degree is the sum of all partition parts. | Small-rank or scalar test | Weighted degree 2·1=2 equals 1+1=2; unweighted difference sum is 1. | Consistent | None |
| 4.6 API 4: The PBW polynomial-to-operator map is linear and multiplicative because p⁺ is abelian. | Small-rank or scalar test | Coordinates X,Y commute in Sym(p⁺); operators ∂X∂Y and ∂Y∂X both take XY to 1. | Consistent | None |
| 4.6 API 5: Operators obtained from equal polynomials agree | Small-rank or scalar test | Identical polynomial Δ₂ has identical differential operator; symbol of ∂₁₁∂₂₂−∂₁₂∂₂₁ is Δ₂. | Consistent | None |
| 4.8 API 1: On U(n,n), f∞=Bδ_(χ,κ)J_χ. | Small-rank or scalar test | At zero partitions,B=2,g=1 gives 2=2·1. | Consistent | None |
| 4.8 API 2: Its complete parabolic covariance identifies I_EHLS(χ_u⁻¹,t−n/2) on U(W), with a separately com | Small-rank or scalar test | m=3,aχ=2,bχ=0,n=1 gives t=2,scrit=3/2 and covariance 1/16=4⁻². | Consistent | None |
| 4.8 API 3: Rescaling B rescales the section and its zeta integral by the same factor. | Small-rank or scalar test | B=2→6 multiplies section value 2→6 and every integral by 3. | Consistent | None |
| 4.8 API 4: Replacing B_(χ,κ) by aB_(χ,κ), with a∈E×, multiplies the section and its local zeta value by a. | Small-rank or scalar test | a=−1,B=2 gives −2 instead of 2 and local value −I instead of I. | Consistent | None |
| 4.8 API 5: After the inducing fiber has been identified, equality on its maximal compact subgroup determin | Small-rank or scalar test | Compact restrictions with difference 0 extend with covariance times 0=0. | Consistent | None |
| 5.1 API 1: ψ_(k,c)(uv)=ψ_(k,c)(u)ψ_(k,c)(v). | Small-rank or scalar test | Adjacent traces 3,7 sum to 10, so ψ(3)ψ(7)=ψ(10). | Consistent | None |
| 5.1 API 2: A Levi tuple stabilizes ψ precisely when all its blocks agree. | Small-rank or scalar test | Two scalar blocks 2,2 give ratio 1; blocks 2,1 give ratio 2, so they cannot stabilize all trace-character values. | Consistent | None |
| 5.1 API 3: At c=1 the character is the ordinary GL_k Whittaker character. | Small-rank or scalar test | c=1,k=3 gives ψ(u₁₂+u₂₃), no u₁₃ term. | Consistent | None |
| 5.1 API 4: The identity has zero adjacent trace, so its character value is 1. | Small-rank or scalar test | Identity adjacent trace 0 gives ψ(0)=1. | Consistent | None |
| 5.1 API 5: Replacing ψ(x) by ψ(bx) evaluates the same adjacent-block trace against the scaled additive cha | Small-rank or scalar test | b=2,trace=1/3 at ℚ₃ gives ψ_b(1/3)=ψ(2/3)=ζ₃². | Consistent | None |
| 5.2 API 1: W_ξ(g)=λ(ρ(g)ξ), and W_ξ(ug)=ψ_(k,c)(u)W_ξ(g). | Small-rank or scalar test | k=1,c=2,τ=1 gives coefficient W(g)=1 and U=1, so covariance 1=1·1. | Consistent | None |
| 5.2 API 2: The diagonal GL_c acts on the functional by χ_τ∘det. | Small-rank or scalar test | GL₁ character with τ(a)=aⁱ and diagonal g=2I₂ gives χτ(det g)=4ⁱ. | Consistent | None |
| 5.2 API 3: Rescaling nonzero λ rescales the image functions and gives the canonical scalar comparison of m | Small-rank or scalar test | λ→3λ changes W(1)=1 to 3 and image function scaling by 3. | Consistent | None |
| 5.2 API 4: The coefficient map v↦(g↦λ(ρ(g)v)) is equivariant and has kernel ⋂_g ker(λ∘ρ(g)) | Small-rank or scalar test | For 1⊕σ with λ projection, kernel consists of (0,w); both coefficient map and quotient kill (0,w). | Consistent | None |
| 5.2 API 5: Two elements of the image model agree iff their values agree at every group element | Small-rank or scalar test | Vectors (1,0),(1,w) differ yet both coefficient functions are 1; functions 1 and 0 disagree at identity. | Consistent | None |
| 5.2 API 6: For irreducible generic τ, ρ_c(τ) is of type (k,c), has finite length and has exactly one irred | Small-rank or scalar test | k=1,c=2 gives one-dimensional determinant character, length 1, exactly one constituent of type (1,2). | Consistent | None |
| 5.3 API 1: e is a homomorphism with exactly the stated kernel. | Small-rank or scalar test | Spin diagonal (z,z) maps to 1; isometry pair with first component identity and second nonidentity has distinct block action. | Consistent | None |
| 5.3 API 2: δ transports the V character to ψ_(k,c)⁻¹. | Small-rank or scalar test | At trace 1/3, transported ψ gives ζ₃ and original ψ_U gives ζ₃⁻¹, product 1. | Consistent | None |
| 5.3 API 3: δe(g,ιg)δ⁻¹ lies in the Siegel Levi, giving the invariance of the U₀ integral. | Small-rank or scalar test | g=1 gives δ1δ⁻¹=1∈M_P. | Consistent | None |
| 5.3 API 4: Conjugate P,Q,U,e,δ and ψ_U together | Small-rank or scalar test | Conjugating identity relation gives h1h⁻¹=1; pushing mass 1 on a trivial inner group keeps mass 1. | Consistent | None |
| 5.4 API 1: The c-split functional is the displayed integral on the specified induced carrier. | Small-rank or scalar test | k=1 has trivial integration group; unit vector value 1 integrates to 1. | Consistent | None |
| 5.4 API 2: Its restriction to any nonzero subrepresentation is nonzero. | Small-rank or scalar test | k=1 determinant character has one nonzero subrepresentation, and its unit vector has functional value 1. | Consistent | None |
| 5.4 API 3: For a classical parabolic with Levi GL_l×G_(c−2l), the transform W⊗μ↦(a↦T(diag(a,I_(kc−l))·W,μ) | Small-rank or scalar test | At k=1,l=1 the target restriction is a character line; value 1 is attained, so image dimension 1 equals target dimension 1. | Consistent | None |
| 5.4 API 4: The functions in R_l(τ) carry the displayed determinant twist ∣det∣^((kc−kl−c+l)/2), so they ar | Small-rank or scalar test | k=2,c=3,l=1 gives exponent 1; norm 1/2 yields factor 1/2, not 1. | Consistent | None |
| 5.5 API 1: Left covariance includes the true half-modulus and the displayed model action. | Small-rank or scalar test | s=1/2 gives extra norm twist 1; nontrivial χπ values remain present on both spin Levi factors. | Consistent | None |
| 5.5 API 2: The compact-picture carrier is independent of s. | Small-rank or scalar test | Identity compact value of a standard family is 1 at s=0 and s=1. | Consistent | None |
| 5.5 API 3: At finite places, polynomial sections are generated by standard sections over C[q^s,q^(−s)]. | Small-rank or scalar test | Polynomial (qˢ+2q⁻ˢ) times a flat value-one section evaluates at s=0 to 3, a Laurent combination of the same standard section. | Consistent | None |
| 5.5 API 4: Extend an inducing-model-valued compact-picture function with P∩K covariance to the normalized  | Small-rank or scalar test | Value-one compact data extend at s=1/2 with the true half-modulus; at the identity their extension is 1. | Consistent | None |
| 5.5 API 5: Two sections in the same parameter fiber are equal exactly when their compact-picture functions | Small-rank or scalar test | Zero compact difference extends to 0 throughout PK; equality of all compact values implies equality of every fiber value. | Consistent | None |
| 6.1 API 1: The continued integral is trilinear in section and matrix-coefficient vectors. | Small-rank or scalar test | Zero section gives 0; section multiplied by 3 multiplies each integrand and its continued germ by 3. | Consistent | None |
| 6.1 API 2: The spin integrand is invariant under C_G^•. | Small-rank or scalar test | Central factors 2,1/2 give invariant product 1; dropping either gives 2 or 1/2. | Consistent | None |
| 6.1 API 3: Scaling either Haar measure scales Z by the same scalar. | Small-rank or scalar test | SO₂ spherical value Z=3 becomes 6 under doubling outer Haar. | Consistent | None |
| 6.1 API 4: Intertwining isomorphisms of π and its dual, with the evaluation pairing transported, preserve  | Small-rank or scalar test | Vector/dual transport by 2,1/2 keeps coefficient factor 1 and integral 3. | Consistent | None |
| 6.4 API 1: The target has parameter 1−s and character χ_π⁻¹τ∨, with its specified odd-case parabolic. | Small-rank or scalar test | s=1/4 reflects to 3/4; τ↦χπ⁻¹τ∨ applied twice returns τ. | Consistent | None |
| 6.4 API 2: λ(s)=λ(1−s)∘M*(s). | Small-rank or scalar test | On a normalized test with λ(s)=1 the identity requires λ(1−s)M*=1; multiplying M* by 2 instead gives 2. | Consistent | None |
| 6.4 API 3: C(s) is the meromorphic ratio determined by the nonzero degenerate Whittaker functionals. | Small-rank or scalar test | λ rescaled by exp(s) changes C by exp(2s−1); at s=0 factor exp(−1). | Consistent | None |
| 6.4 API 4: Among meromorphic scalar multiples of the fixed raw operator, the degenerate-Whittaker function | Small-rank or scalar test | On a common test where raw functional value is nonzero, two scalars a,b giving identical values satisfy (a−b)·1=0, hence a=b. | Consistent | None |
| 6.4 API 5: Intertwining isomorphisms of the inducing model commute with the normalized operator when both  | Small-rank or scalar test | Transport both functionals by scalar 2 multiplies numerator and denominator by 2, leaving their ratio 1. | Consistent | None |
| 6.5 API 1: The displayed identity holds for every matrix coefficient and entire section, meromorphically. | Small-rank or scalar test | At zero section both sides are 0; a nonzero common datum fixes the scalar equation rather than a single zero test. | Consistent | None |
| 6.5 API 2: Any scalar satisfying the same identity for all data equals γ. | Small-rank or scalar test | For a datum Z=1, equality aZ=bZ gives a=b; a zero datum alone gives 0=0 for every a,b. | Consistent | None |
| 6.5 API 3: The Sp₀ and small-spin tail conventions are exactly the stated GL or trivial factors. | Small-rank or scalar test | Sp₀ gives nonconstant Tate gamma; SO₀,SO₁,GSpin₀,GSpin₁ give 1. | Consistent | None |
| 6.5 API 4: Isomorphic π and τ give the same meromorphic gamma-factor | Small-rank or scalar test | Replacing representation by an isomorphic model rescales numerator and denominator by the same 2, leaving quotient 1. | Consistent | None |
| 6.7 API 1: L is the reciprocal normalized gamma-zero polynomial at a finite tempered place. | Small-rank or scalar test | P=1−2X has P(0)=1 and L=1/(1−2X); a constant multiple 3P fails normalization. | Consistent | None |
| 6.7 API 2: The displayed classical and GL Langlands product holds with the specified central twist. | Small-rank or scalar test | Spin pair (1,χπ) with χπ(ϖ)=−1 has product factor 1/((1−T)(1+T))=1/(1−T²). | Consistent | None |
| 6.7 API 3: γ=εL(1−s,π∨×τ∨)/L(s,π×τ). | Small-rank or scalar test | Ramified quadratic ℚ₃ gives L=Ldual=1 and ε=γ=−3X², so γ=ε·1/1. | Consistent | None |
| 6.7 API 4: Transport of the tempered or Langlands data through a representation isomorphism preserves L an | Small-rank or scalar test | Representation transport keeps zero root set {1/2} of 1−2X and constant term 1, hence the same reciprocal polynomial. | Consistent | None |
| 7.1 API 1: Expose the displayed determinant integral and its multilinearity. | Small-rank or scalar test | At k=c=1 with unit cutoff, exponent s agrees on both integral formulas; zero Φ gives 0. | Consistent | None |
| 7.1 API 2: For k>1 the family generated after convolution equals the family without Φ. | Small-rank or scalar test | At k>1 zero convolution gives 0 model vector and integral 0; scaling Φ by 3 scales the convolved vector and integral by 3. | Consistent | None |
| 7.1 API 3: At k=1 recover GJ with Φ, and at c=1 recover GL_k×GL₁ RS after the stated conventions. | Small-rank or scalar test | k=1,c=2 exponent s+1/2; c=1,k=2 exponent s−1/2, precisely the two claimed boundary exponents. | Consistent | None |
| 7.1 API 4: Transport σ, its dual coefficient and the (k,c)-model realization together | Small-rank or scalar test | Coefficient transport 2·1/2=1 leaves each determinant-integral summand unchanged. | Consistent | None |
| 7.3 API 1: For every datum, Z_GL/𝔏 is entire. | Small-rank or scalar test | For {t⁻¹,t⁻²}, common divisor t⁻² gives quotients t,1, both entire. | Consistent | None |
| 7.3 API 2: At every point a quotient Z_GL/𝔏 is nonzero. | Small-rank or scalar test | At t=0 the second quotient is 1≠0, while the first is 0; existence is not a claim about every datum. | Consistent | None |
| 7.3 API 3: The product formula includes an entire defect A | Small-rank or scalar test | Defect A=t can vanish at 0 and is entire; assuming A is a unit excludes that value. | Consistent | None |
| 7.3 API 4: Representatives with the same entire-quotient and local-attainment properties differ by a nowhe | Small-rank or scalar test | Two representatives t⁻² and exp(s)t⁻² have quotient exp(s), with order 0 and no zeros; finite normalization P(0)=1 rejects constant factor 3. | Consistent | None |
| 8.1 API 1: In its convergence region E is the P(F)⧸H(F) sum of the section. | Small-rank or scalar test | For zero section each Eisenstein summand is 0 and sum is 0. | Consistent | None |
| 8.1 API 2: The local inducing representation matches the Layer 5 family under the stated twist and shift. | Small-rank or scalar test | Local exponent s_G−1/2 equals the global exponent s_E; at s_G=1/2 both equal 0. | Consistent | None |
| 8.1 API 3: At a local doubling variable s_G, the global series is evaluated at s_E=s_G−1/2 | Small-rank or scalar test | s_G=1 gives s_E=1/2; s_G=1/2 gives 0. | Consistent | None |
| 8.1 API 4: The series is linear and right-translation equivariant in its section in the convergence region | Small-rank or scalar test | Multiplying section by 3 multiplies every convergent summand by 3; zero section remains 0 after right translation. | Consistent | None |
| 9.1 API 1: On the initial half-plane, the global period equals its open-orbit matrix-coefficient integral. | Small-rank or scalar test | Zero cusp vector makes the double period and open-orbit coefficient integral 0. | Consistent | None |
| 9.1 API 2: For factorizable data its normalized Euler identity is exactly b^S Z=L^S∏_S Z_v. | Small-rank or scalar test | At the SO₂ local spherical normalization b=4/3,Z=3,L=4 gives the good-place relation 4=4. | Consistent | None |
| 9.1 API 3: Changing one local quotient measure changes the global factorization by the corresponding expli | Small-rank or scalar test | Changing one local Haar by factor 3 changes its local Z=3 to 9 and the corresponding factored period by factor 3. | Consistent | None |
| 9.1 API 4: The continued global period is trilinear in the section and the two cusp vectors in their chose | Small-rank or scalar test | Scaling a cusp vector by 2 and the other by 3 gives coefficient multiplier 6; zero section gives multiplier 0. | Consistent | None |
| 9.2 API 1: The complete product is the partial product times the local factors in S. | Small-rank or scalar test | If Lpartial=3 and local correction 2, both expressions for completion give 6. | Consistent | None |
| 9.2 API 2: Enlarging S does not change L or its continued function. | Small-rank or scalar test | Moving a good factor 2 into S gives (3/2)·(2·2)=6, same as 3·2. | Consistent | None |
| 9.2 API 3: The global epsilon product is invariant under ψ↦ψ_b for b∈F× by the product formula and global  | Small-rank or scalar test | b=2 over ℚ gives norm product 2·1/2=1 and global central-character product 1. | Consistent | None |
| 9.2 API 4: Two meromorphic continuations agreeing with the same convergent Euler product on a right half-p | Small-rank or scalar test | Difference of two continuations is 0 on the convergence half-plane; its germ is identically 0 there and hence throughout the connected plane. | Consistent | None |
| 10.1 API 1: At every place outside some finite set, the Satake classes match through r_G. | Small-rank or scalar test | Pair roots 3,1/3 gives the same good-place Satake polynomial 1−(10/3)T+T². | Consistent | None |
| 10.1 API 2: At infinity the induced infinitesimal characters match. | Small-rank or scalar test | Sp₂ standard exponent multiset (a,0,−a) has sum 0 and length 3, identical to its receiving GL₃ infinitesimal character. | Consistent | None |
| 10.1 API 3: The predicate is invariant under isomorphism of both automorphic representations. | Small-rank or scalar test | Conjugating diag(3,1/3) exchanges the roots; polynomial coefficients stay 10/3 and 1. | Consistent | None |
| 10.1 API 4: A finite exceptional set, compatible unramified Satake classes outside it and the required arch | Small-rank or scalar test | An exceptional set S enlarged by one place deletes one equality; the same witness still satisfies all remaining equalities. | Consistent | None |
| 10.2 API 1: It is equality of gamma-factors against all generic GL tests. | Small-rank or scalar test | Trivial/Steinberg GL₂ have gamma ratio 1 for every generic test despite different L-factors. | Consistent | None |
| 10.2 API 2: Testing only supercuspidal twists is equivalent. | Small-rank or scalar test | For a generic principal series induced from two characters, test gamma is the product of the two character tests, so two equalities yield product ratio 1. | Consistent | None |
| 10.2 API 3: At finite places it is invariant within a GL supercuspidal-support class, and two coarse transf | Small-rank or scalar test | Shared support {ν¹/²,ν⁻¹/²} gives the same product; nongeneric isomorphism count remains two distinct representations. | Consistent | None |
| 10.2 API 4: Isomorphisms of π and Π preserve every gamma test and hence the coarse-transfer predicate. | Small-rank or scalar test | Transported equal meromorphic factors have ratio 1; an isomorphism changes no supercuspidal support multiplicity. | Consistent | None |


Pull request: #1756 (roadmap/automorphic-l-functions-and-local-factors-part-ii at 843d267)
