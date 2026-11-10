# Port report: PotentialAutomorphyInfrastructurePartII

Branch: `roadmap/potential-automorphy-infrastructure-part-ii`.
Head: `7c7757508843fe272fb01a9aa2c1fafbfb1a2f5f`.
Commit message: `PotentialAutomorphyInfrastructurePartII: roadmap (README, Suggested.lean, metadata)`.

The commit adds only `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md`, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/Suggested.lean` and `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/metadata.toml`. The worktree is clean. Nothing was pushed and no pull request, issue or comment was written.

## Validation

The initial checkout was clean at `4ec889e`. The actual guidance files are the checkout's root `README.md` and `CONTRIBUTING.md`; the parent-relative paths in `AGENTS.md` do not exist in this worktree layout. Both root files were read. Repository models included RootSystemsPartII, ReductiveGroupsPartII and the shorter main-branch roadmaps; the port preserves the package's fuller prose, API and Checks structure.

Pinned Mathlib: `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.
Pinned Tau Ceti: `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

Command: `lake build TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII.Suggested`.
Exact outcome: `Build completed successfully (18239 jobs).`
Warnings: **0**, including **0 sorry warnings**. The first build found the pin's module-system warning; adding the `module` header eliminated it. The final build was run after the final Lean change. No Lean process remains running.

The complete push gate passes on the committed tree. Its preliminary invocation found only the uncommitted folder; because this gate requires a clean tree, the passing invocation follows the commit.

```text
gate PotentialAutomorphyInfrastructurePartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The explicit dependency check, with the supplied merge order, movable placement and content checkout, returned:

```text
depcheck: 228 roadmaps, 2080 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. `git diff --check` passed. The README has 109 retained numbered targets in 11 layers; every target has at least three Checks.

## Draft pull request body

Builds polarized automorphy lifting over CM and totally real fields from definite unitary groups, integral and ordinary Hecke algebras, and Taylor–Wiles patching. The resulting library proves minimal, ordinary, dyadic, potentially diagonalizable and residually reducible lifting and deformation-ring finiteness, adjoint Bloch–Kato Selmer vanishing, rigid integral R = T and lifting from generic local domains. The self-dual Dwork geometry is supplied by PotentialAutomorphyDworkMotivesPartII; this roadmap proves the automorphic consequences.

AI-assisted port and mathematical self-review by Codex (GPT-6).

## Suppliers and ownership

Suppliers still carried by open roadmap pull requests, by name:

- AdelicAlgebraicGroups
- ArithmeticGaloisDuality
- ArithmeticGaloisRepresentations
- ArithmeticLocallySymmetricSpaces
- AutomorphicFormsOnReductiveGroups
- AutomorphicGaloisRepresentationsPartII
- DeformationAndDerivedPatchingAlgebra
- EndoscopicTransferAndUnitaryTraceComparison
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- GlobalGaloisDeformations
- IntegralHeckeAndGaloisDeterminants
- LocalGaloisDeformationRings
- PadicFamilies
- PadicHodgeTheory
- PotentialAutomorphyInfrastructure
- PotentialModularityAndCompatibleSystems
- SelmerIwasawaCohomology
- SmoothRepresentationsOfLocalGroups

PotentialAutomorphyDworkMotivesPartII is an earlier merge-order package, read at `packages/PotentialAutomorphyDworkMotivesPartII/README.md`; it is not on main or in the indexed open pull requests. Its precise sections exist in that package and dependency checking accepts this edge. This is the sole unresolved-roadmap lead from `roadmaps resolve`, whose search covers main and open heads rather than earlier packages. It is not a missing mathematical owner. No citation is defined only by an open revision. ClassicalSerreModularity and DeformationAndDerivedPatchingAlgebraPartII occur as ownership comparisons, not prerequisites of a proof here.

The object sweep used `roadmaps grep` across the 430 indexed open heads and main, plus searches across the board packages and pinned sources. The five closest scopes were read: PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems, ModularityAndLanglandsExtensions, LocalGaloisDeformationRings and AutomorphicGaloisRepresentationsPartII. Further matches were checked in ClassicalSerreModularity, the Dwork package and the supplied AutomorphyLiftingBeyondTaylorWiles head. The latter owns unpolarized derived lifting, not these definite-unitary polarized theorems. Open work was checked through the supplied index and readable heads; no additional unprovided pull-request heads were sought.

Ownership changes and supplier replacements:

1. The self-dual Dwork construction formerly §6.1 duplicates the earlier Dwork package's §§1.1–1.4, 2.3–2.7, 4.6, 5.6, 5.10–5.12, 6.8 and 7.4, 7.7–7.10, 9.4. Its construction target and proof were deleted; the exact contract, corrected twist witness and section mapping remain. Section 6.2 retains the automorphic conclusion, which the geometric switching theorem does not prove. The earlier package uses LocalGaloisDeformationRings' local ordinary predicate, so importing it creates no cycle. This supersedes the old package report's cycle rationale, checked against the actual earlier package.
2. PotentialModularityAndCompatibleSystems §§8.3–8.6 and ClassicalSerreModularity's rank-two finite-level action retain ownership of their rank-two specializations. The retained general-rank statements explicitly identify this extension and use the same carriers and normalizations.
3. The generic Weil–Deligne predicate and LLC criterion remain supplied by AutomorphicGaloisRepresentationsPartII AG2.6; the port keeps the accepted deletion of that duplicate. It also keeps the accepted arbitrary-regularity AG2.3 contract, the local ordinary and connects suppliers, and the exclusion of the generic Serre weight/change-of-weight theorem.
4. Matlis duality now cites its actual owner DerivedModuleAlgebra §§1.M.1–1.M.2 on main, rather than its consumer DeformationAndDerivedPatchingAlgebraPartII §K0.7.
5. The abstract nilpotent-kernel step in §8.6 consumes Mathlib `Module.finite_of_surjective_of_ker_le_nilradical` from `Mathlib/RingTheory/Finiteness/NilpotentKer.lean` line 23; the deformation application and finite-product reduction remain here.
6. Local geometric reciprocity now cites the pinned `TauCeti.ClassFieldTheory.geometricArtinMap` and its continuity, Frobenius and norm API in `TauCeti/NumberTheory/ClassFieldTheory/Local/GeometricArtinMap.lean` lines 68, 76, 112 and 145. There is no Tau Ceti import because the Lean file uses none of those declarations.
7. The three resolver leads for proposed adequacy/enormity declaration spellings were checked in ArithmeticGaloisRepresentations §§7.9–7.10. The concepts are there as planned interfaces, not declarations at the pin; the README now cites the concepts by section without pretending their spellings are pinned declarations.

ModularityAndLanglandsExtensions still independently restates the PD criteria and several lifting/Selmer results in §§2.1–2.2, 2.9–2.16, 4.1–4.2. This roadmap precedes it and retains ownership of these general polarized statements. Its read-only consumer should be aligned to these suppliers in that consumer's own port; no upward edge was introduced here and no external file was edited.

## Lean acceptance file and signature audit

Nothing moved from Lean to README: the accepted `Suggested.lean` already contained zero declarations and zero sorry'd data. At the new pins the automorphic representation, polarized deformation-ring, local component-condition and constrained pseudodeformation carriers required by the headlines are still absent. Searches by mathematical object found neighboring native spin/polarization and homological deformation code, not these arithmetic carriers.

The file retains only `import Mathlib`, its module docstring and namespace, with a `module` header for the new pin. The docstring additionally lists the minimal/ordinary/fixed-type and generic R = T headlines and the pseudodeformation residue-field endpoint as not statable, identifying their missing carriers. No weakened stand-ins were added.

Mechanical declaration extraction returned the empty list. Consequently the requested `#check @name` signature audit has zero entries: there is no target declaration to elaborate in a scratch file, no retained section variable, and no binder to change. No scratch Lean elaboration was run for this empty list. Metadata remains the main-repository form `topic = "math.NT"`.

## Mathematical and locator corrections

The accepted review's decisions and all seventeen conditional supplier extensions are preserved. Both non-blocking notes were checked against the registered source texts and applied:

- The stray factor 1/2 occurs at the end of the proof of Tho15 Theorem 7.1 on p. 70, not p. 69: Tho15 line 3360 starts p. 70 and line 3371 is the display.
- Section 10.5 now prescribes splitting at every p-adic place of the auxiliary CM field. At an initially inert place, the local unramified quadratic extension is included in the totally real completion, giving a split tensor product and retaining unramifiedness. LLHLM23 lines 6233–6248 do not assume initial splitting; §4.8 needs it. The supporting auxiliary-field contract is PotentialAutomorphyInfrastructure §2.5.

The final mathematical reading also repaired:

- **§0.7:** both rank-one isobaric summands have shift −1/2, not opposite half-powers; substitute n₁=n₂=1 in CT14's formula.
- **§3.8:** omitting the weight normalization does not always give positive slope. Weights (1,1) and (−1,−1) give slopes +1 and −1 respectively. The Check now computes both.
- **§3.9 / Conventions:** the level ideal is the radical product of the places above l, not the rational ideal (l) in a ramified completion. The ℚ₅(√5) Check gives tame unit quotient of order 4 versus order 20 for rational-(5) reduction. This makes the Iwahori levels, the universal inertial coefficient ring and Teichmüller splitting agree.
- **§3.11:** the final faithfulness consequence requires a nonzero Hecke algebra. Zero forms give the zero algebra and annihilator the whole weight algebra.
- **§3.13:** ordinary image points with prescribed inertial characters need a finite coefficient extension to obtain a flag. Ger19 lines 1424–1437 use the proper flag scheme's image, which gives geometric flags; an unramified ℤ₃ Frobenius matrix with polynomial (X−1)²−18 has no ℚ₃ eigenline but two after adjoining √2. The signature in prose and a negative-control Check now agree with this geometric conclusion, as does the earlier rank-two supplier.
- **§4.4:** when q=0 the empty datum is unique. Existence is stated uniformly; the infinitely-many assertion is restricted to q>0. The proof's chosen data may avoid a prescribed finite set in that case. Tho17 lines 604–610 contain the unqualified infinite-family wording.
- **§8.6:** finiteness over the auxiliary weight algebra descends because its action factors through the original weight algebra when the p-adic places split; this coefficient-action argument is now explicit.
- **§8.7:** the division-algebra transfer citation is §3.5(3), not nonexistent §3.5(4).
- **§8.20:** the ramified rank-one negative control now fixes O=ℤ_l[ζ_l] and ϖ=ζ_l−1, so the claimed inertial value 1+ϖ is a genuine tame character satisfying τ^q=τ when q≡1 mod l.
- **§9.3:** the polarization pairing need not be symmetric before oddness is assumed. The adjoint action uses the pairing specified by r(c); symmetry is asserted in the totally odd case.
- **§9.6:** the integral comparison explicitly assumes ρ semistable above p with weights in [a,b]. Otherwise the claimed point of the semistable pseudodeformation ring need not exist. A weight-one character against [0,0] supplies the negative control.
- **§10.3:** eigenvalue ratios need not be algebraic integers. For roots of X²−X+5, the two conjugate ratios sum to −9/5. The proof now clears denominators using α^j−qβ^j or β^h−qα^h and excludes the residue characteristic. The nonzero norms still exclude only finitely many primes; the theorem's generality is unchanged.
- The library commit labels and three shifted Mathlib source lines were updated. PadicFamilies §0a.14 now supplies the projector on finite modules over complete local rings, alongside the finite-set projector and torsion colimit.

The locator notes in `packages/PotentialAutomorphyInfrastructurePartII/reports/RT-PotentialAutomorphyInfrastructurePartII~1b.md` were independently checked at the source lines and applied: Tho17 lines 905, 958, 997, 1038; Tho12 lines 2339, 2404; Tho15 lines 1326, 1362, 1450, 2180, 2286, 2446, 3111; NT21 lines 3441, 3455; NT23 lines 197, 578, 605; ANT20 lines 456, 491, 523, 577, 583, 606, 684, 731, 762, 763, 890. These fix pages in §§5.3, 5.6–5.7, 7.5–7.11, 7.16, 7.18–7.19, 8.1–8.4, 8.7, 8.11 and 9.1, 9.4. No source file or source manifest was changed.

## Remaining conditions

The seventeen accepted supplier extensions remain explicit contracts, not completed implementations. Their computed probes appear in the table below. No claim is made that a successful sorry-free empty Lean module proves these results. The literal arbitrary-finite-residue-field primitivity forms and the generic Serre weight/change-of-weight extension remain outside the accepted scope, as the accepted review requires.

The only coordination items are publication/availability of the earlier Dwork package and alignment of the later ModularityAndLanglandsExtensions consumer. The dependency gate reports no order defect. No suspicious instruction-bearing source text was acted on; fetched reviews and roadmap files were treated as claims to verify.

## Adversarial mathematics pass

The following are finite probes and symbolic substitutions, not proofs of the admitted mathematics. A row identifies a mathematical assertion, including its repeated API formulation. Definitions are tested by an accepted instance and a rejected model where available. Standing field, nonzero coefficient, rank and regularity hypotheses exclude the zero ring, rank zero and inseparable number-field cases except where a quotient is expressly allowed to be zero. Source-dependent existence conclusions are tested through their necessary local and numerical conditions; a finite calculation cannot independently establish an automorphy theorem.

| Statement | Instances tried | Values on the two sides / negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: ranks and coefficients | n=0, n=1; O=0, O=ℤ₅ | 0 has no nonzero pairing or Jordan block; rank one has identity matrix (1); 0≠1 in ℤ₅ | Degeneracies distinguished | Positive rank and nonzero DVR explicit |
| Conventions: Frobenius and Artin direction | K=ℚ₅, uniformizer 5, unit 2 | geometric unramified coordinate −1 versus arithmetic +1; ε(Art(2))=2 versus 1/2 | Consistent | Cite native geometric Artin map |
| Conventions: Hodge sign | ε and its dual | HT(ε)=−1, HT(ε⁻¹)=1; φ eigenvalues 1/5 and 5 | Consistent | None |
| Conventions: polarization and multiplier | n=1, c of order 2 | µ(c)=−1 gives pairing symmetry +1; µ(c)=1 gives skew symmetry and zero alternating line | Oddness necessary | None |
| Conventions: automorphic weight | n=2, λ=(0,0) | λ_i+2−i gives (1,0), not (0,−1) | Consistent | None |
| Conventions: tame level ideal | ℚ₅(√5), ϖ=√5 | #(O/ϖ)ˣ=4; #(O/5)ˣ=20 | Rational ideal gives wrong tame factor | Radical ideal 𝔩 specified |
| Conventions: full versus Hecke multiplier | n=2, Hecke µ=1 | full multiplier ε⁻¹, HT=1; omitting ε gives HT=0 | Consistent | None |
| §0.1 definition / flag / uniqueness | ε, Tate curve, supersingular curve | ε: weight −1; Tate: λ=(−1,−1), HT=(0,−1); supersingular slopes (−1/2,−1/2) sum −1 but no integral-slope line | Positive and negative models distinguished | None |
| §0.1 restriction and scalar extension | degree-two local extension; rank one | HT at τ′ equals HT at τ′ restricted, −1 on both; algebraic exponent −1 unchanged | Consistent | None |
| §0.1 twist API | λ=(0,0), ψ=ε | weights (1,0)+(−1)=(0,−1), new λ=(−1,−1) | Consistent | None |
| §0.1 dual API | n=2, λ=(2,0) | HT=(3,0); dual=(0,−3); µ=(−1,−3), µ+(1,0)=(0,−3) | Consistent | None |
| §0.1 dual-twist Check | λ=(0,−1), n=2 | dual λ=(0,−1); twisting ε⁻¹ adds 1, giving (1,0)=negative reverse | Consistent | None |
| §0.2 principal-series criterion | n=1; n=2, q=3, λ=0 | rank one slope λ; rank two slopes (−1/2,1/2); Jacquet of full induction has dimension 2, each constituent dimension 1 | Genericity and full induction distinguished | None |
| §0.2 genericity / ordinary line | trivial and Steinberg on GL₂(ℚ₃) | trivial U=3 nonunit; Steinberg U=1 unit; unnormalized Jacquet terms 1 and δ_B | Consistent | None |
| §0.3 automorphy, level and finite realization | rank-one Hecke character; Tate curve | rank one multiplier at c=−1; Tate N has rank 1 and stays nonzero under finite restriction, unlike unramified N=0 | Level refinements distinct | None |
| §0.3 parity API | n=1, purity w=1 | corrected χ(−1)=1 gives µ(c)=−1; old χ(−1)=−1 gives +1 | Consistent | None |
| §0.4 ordinary automorphic ⇒ ordinary Galois | ordinary elliptic H¹ | flag line unramified of weight 0; quotient ε⁻¹ times unramified of weight 1; {0,1}={λ₂,λ₁+1} | Consistent | None |
| §0.5 ordinary Galois ⇒ ordinary automorphic | n=1; Tate curve excluded by good-level premise | rank-one principal series dimension 1; Tate N=1 versus potentially unramified N=0 | Level premise retained | None |
| §0.6 Steinberg ordinarity | GL₂(ℚ₅), ψ(5)=1 | δ_B(diag(5,1))=1/5; correction 5 gives U=1; omission gives 1/5 | Normalization pinned | None |
| §0.7 isobaric sums | two rank-one summands; two embeddings | both shifts (1−2)/2=−1/2; interleavings (1,2) versus (2,1) at same p-place disagree | Wrong opposite shifts detected | Corrected ∓1/2 to two copies of −1/2 |
| §0.8 twisting and level | ψ=ε; ramified quadratic ψ | ε: HT −1 but automorphic norm character unramified; finite ramified ψ has inertial order 2 versus original 1 | Potential level preserved, actual level conditional | None |
| §0.9 soluble descent | M=F; induced quadratic rank-two seed | identity restriction degree 1; induced seed restricts to two rank-one characters, hence loses cuspidality | Irreducibility premise necessary | None |
| §0.10 induced automorphy descent | m=1; GL₁(ℂ), k=1, t=0 or 1 | induction rank n·1=n; at t=0 conjugate and dual are angular exponent −1; at t=1 radial exponents i and −i differ | Archimedean half-integrality distinguished | None |
| §0.11 norm-prescribed characters (1) | χ(c₁)=1, χ(c₂)=−1 | transfer sends each c_v to c_v²=1, so θ(Vc_v)=1 at both; mixed signs cannot equal one global quadratic twist | Negative control retained | None |
| §0.11 residual lifting (2) | l=5; χ residually trivial | correction square root: (1+T)^(1/2) squared =1+T; 2 invertible modulo 5, but 2=0 modulo 2 | Odd-prime hypothesis used | None |
| §1.1 strong connection definition | one smooth component; empty C | unique component count 1 gives strong connection; C=∅ gives ring 0 and no map to O | Positive and empty cases distinguished | None |
| §1.1 component quotient API | C⊂C′ with counts 1⊂2 | supported component sets {Q₁}⊂{Q₁,Q₂}; quotient kernels reverse containment | Direction correct | None |
| §1.2 transitivity / asymmetry | node with components x=0, y=0 | origin belongs to 2 components; a nonzero point on x=0 belongs to 1; common-component relation through origin need not join the other branches | Strong premise distinguished | None |
| §1.2 inertia and conductor assertions | unramified versus ramified l-power character | inertia eigenvalues 1 versus ζ_l≠1 despite equal residual value 1 | Equal reduction insufficient | None |
| §1.2 monodromy / strong connection | Frob diag(1,q), N=E₁₂ or 0 | rank N=1 versus 0; sN specializes to rank 0 at s=0 on Steinberg branch | Weak connection does not fix N | None |
| §1.2 filtration lemma | triangular matrix with extension entry b | conjugation scales b to tb; t=1 gives b, t=0 gives 0, diagonals unchanged | Correct direct-sum limit | None |
| §1.2 l=p equivalence | crystalline rank-one character | one component through character; reflexive, reverse and composed relations all equal that component | Consistent special case | None |
| §1.3 generic smoothness | 1⊕ε, N=0; rank-one χ | Hom(ε,1(1)) has dimension 1; Hom(χ,χε) has dimension 0 because ε has infinite order | Genericity required | None |
| §1.3 density and unramified-after-K′ ring | n=1, K′=K | unramified lifting ring O⟦X⟧ has relative dimension 1=n²; H²=0, h¹=h⁰=1 | Numerical statement consistent | None |
| §1.4 diagonalizability definitions / lattice transport | character; Tate curve | character is a one-term crystalline sum; Tate N has rank 1 after every finite restriction and cannot be crystalline | Wrong flag-only model excluded | None |
| §1.5 ordinary potentially crystalline case | 1⊕ε⁻¹; Tate curve | first N=0 and weights (0,1); Tate N≠0 with same graded weights | Potential crystallinity necessary | None |
| §1.5 Fontaine–Laffaille range | l=5, k=4 and k=6 | weights {0,3} fit interval length 3; {0,5} do not | Boundary correct | None |
| §1.6 rank-two potentially Barsotti–Tate | 1⊕ε⁻¹; l=2 excluded | weights {0,1}; opposite convention {0,−1}; ordinary and nonordinary component statuses differ 1 versus 0 | General-base supplier premise retained | None |
| §1.7 tensor operations | Sym⁰, Sym² of 1⊕ε⁻¹; tensor with ε | Sym⁰=1; Sym²=1⊕ε⁻¹⊕ε⁻², weights {0,1,2}; tensor shifts all weights by −1 | Includes degree zero | None |
| §2.1 Schur condition / semisimplicity | two distinct self-dual characters; repeated χ | distinct characters have multiplicities (1,1); repeated χ has (2), violating forbidden pair condition | Definitions distinguish models | None |
| §2.1 conjugacy from trace and multiplier | same trace, change multiplier by sign self-twist | trace unchanged; µ(c)=−1 versus +1 gives symmetric versus alternating form | Multiplier equality indispensable | None |
| §2.1 H⁰ vanishing | d=2, k=𝔽₅ and 𝔽₂ | c acts on block scalars by −1; invariants 0 over 𝔽₅, dimension 2 over 𝔽₂ | Characteristic assumption correct | None |
| §2.1 extension torsor | d=2, k=𝔽₅ | kˣ/(kˣ)² has 2 classes, product has 4; over algebraic closure each quotient has 1 | Counts correct | None |
| §2.2 bounded generators | Λ versus Λ⟦Y₁,…,Y_m⟧ | tangent generator count rises by m, unbounded in m | Coefficient datum must be fixed | None |
| §2.2 finite P⊂R / absolutely irreducible case | d=1 | sign group acts through µ₂/µ₂=1, so invariant ring R=P and finite rank 1 | Consistent | None |
| §2.2 invariants and generic étaleness | d=2, conjugation diag(1,−1) | b↦−b, c↦−c, bc↦bc; effective sign group order 2; free generic orbit size 2 | Scalars factored out | None |
| §3.1 definite unitary group / integral identifications | n=1; split place | norm-one real points S¹ compact versus ℂˣ noncompact; (a,a^(−c)) maps to a in first factor | Carrier and direction correct | None |
| §3.1 existence parity / division variant | n=2,D=2; n=1,D=2; n=2,D=1 | (n/2)D=2 even; nD=2 not divisible by 4 but U₁ exists; D=1 gives odd product and excluded ramified case | Correct parity scope | None |
| §3.2 coefficient-valued forms / trace | class set size h, M rank r; A=0 | small-level rank hr; zero coefficients give 0; inclusion then trace multiplies by [U:V] | No arbitrary-function substitute | None |
| §3.2 base-change negative model | C₅ acting on augmentation ideal I | rank_O I=4; I^C₅=0; mod 5 invariant norm vector dimension 1 | Exactness not automatic | None |
| §3.3 Hecke algebra / split conjugate place | n=1; n=2,j=1 | T_wc=T_w⁻¹; on Satake (a,b), a⁻¹+b⁻¹=(a+b)/(ab) | Inverse-transpose correct | None |
| §3.3 zero forms | S=0 | End(0)=0, Hecke algebra 0, rank_O 0 | Zero permitted | None |
| §3.4 exactness and group-ring freeness | Δ=C₅, rank r=2; Δ=C₂, l=5 | free module O[C₅]² has O-rank 10 and coinvariant rank 2; trivial O[C₂]-module has rank 1, not regular rank 2 | l-group and stabilizer hypotheses needed | None |
| §3.5 descent and base change | U₁; φ=absolute norm | φ^c=φ, but norm at a uniformizer q⁻¹ differs from inverse q; norm character cannot be U₁ base change | Self-duality necessary | None |
| §3.5 division-algebra transfer | n=2, unramified principal series versus Steinberg | principal series has N=0, Steinberg rank N=1; only second is discrete series partner | Transfer hypotheses retained | None |
| §3.6 constituent Galois representation | n=1; λ=0,n=2 | r^c=r⁻¹ in rank one; HT={1,0}; local dual-twist inverts α then multiplies by q^(n−1) | Normalizations distinguished | None |
| §3.7 residual polynomial and Hecke lift | n=2,q=2,det=1 over 𝔽₇ | constant term qT²=1 gives T²=4; dropping q gives 1 instead | Consistent | None |
| §3.7 strict conjugacy / multiplier parity | a=2,A=I,b=1; n=1 | scalar conjugation gives (4I,1)j, unchanged ν; n=1 exponent µ=1 gives ν(c)=−1 | Conjugacy statement scoped correctly | None |
| §3.8 Iwahori operators / projector | U diagonal (1,5) on ℤ₅²; zero module | U^(r!) tends to diag(1,0); e²=e; e(0)=0 | Ordinary versus merely invertible over ℚ₅ distinguished | None |
| §3.8 weight normalization | λ=(1,1) and (−1,−1), n=2 | normalized eigenvalue 1 becomes ϖ or ϖ⁻¹ without factor; slopes +1 and −1 | Universal positive-slope claim false | Replaced by computed signed examples |
| §3.9 big algebra and twisted Λ-action | n=2, ν=(1,0), u=(2,3) | w₀ν=(0,1); twist=1/3, not 1/2; zero ordinary part gives algebra 0 | Correct ordering | None |
| §3.9 tame-torus splitting | l=5, ramification degree 2 | radical residue units 4, rational-(5) residue units 20 | Distinguishes two ideals | Explicit Check added |
| §3.10 datum and Hecke comparison | X=∅; m_D=(1); q=2 over 𝔽₇ | coefficients O; T_D=0 and J_D=P_D; generator T²−4 selects det 1 versus printed T²−2 selecting det 4 | Comparison has correct domain | None |
| §3.11 ordinary freeness (a,b,d) | rank r=0 and r=2; n=1,D=2 | dual module 0 or Λ²; Λ has dimension 3; nonzero module over Λ_b₀ has annihilator 0, zero module annihilator Λ_b₀ | Faithfulness requires nonzero | Consequence repaired |
| §3.11 rank-one torsion control | kernel C₅ in T(l)→C∞ | quotient module kills g−1 for generator g, versus faithful regular module where g−1≠0 | Nonfree case distinguished | None |
| §3.12 weight comparison / arithmetic prime | n=1, λ=1 and λ=0 | [u]↦u⁻¹ versus 1; twisted exponent 1−1−λ=−λ | Direction pinned | None |
| §3.12 classical quotient and nilpotents | K′[ε]/ε²→K′ | kernel (ε)≠0 but square 0; maps to a field kill it, map to dual numbers need not | Reduced classicality only | None |
| §3.12 residual coefficient independence | ℤ₅[ζ₅], ϖ=ζ₅−1 | difference ζ₅−1 has valuation 1; equality modulo ϖ but not ϖ² | Consistent | None |
| §3.13 ordinary image / geometric flag | unramified Φ=((1,6),(3,1)) over ℤ₃ | charpoly (X−1)²−18; roots 1±3√2; 2 nonsquare mod 3, so 0 ℚ₃ eigenlines versus 2 over ℚ₃(√2) | O_E-only triangularization false | Finite coefficient extension required |
| §3.13 arithmetic specialization and flag nonuniqueness | λ=0,n=3; coincident residual inertia | diagonal inertia 1,ε⁻¹,ε⁻²; modulo p when coincident, more than one flag versus single ordered rational ordinary flag | No universal ring-module filtration asserted | None |
| §3.14 Hecke eigensystems → GL_n | two cuspidal blocks of ranks 1,1 | base change has 2 summands and Galois representation reducible, versus non-Eisenstein 1 irreducible block | Irreducibility needed | None |
| §4.1 Taylor–Wiles datum / augmentation | Q=∅; rank-two q_v=11,p=5 | Δ=1, R_aug=R; (1+ε)^11=1+ε over 𝔽₅[ε], so scalar ramification can ramify forbidden s-block | Block condition differs from unrestricted | None |
| §4.1 tangent annihilator | ψ-block rank divisible by l | tr(I_ψ)=dim ψ=0 in k, while tr on matrix units can be 1 | No division by block rank used | None |
| §4.2 parahoric projection / freeness | Q=∅; Δ=C₅,r=2 | empty product pr=1; projected module O-rank 10, coinvariants rank 2 | Correct ranks and augmentation | None |
| §4.2 projection not idempotent | spectral factors Q(X)=X−1,R(X)=X−3, eigenvalue 3 | Q(3)=2 on the image, square 4≠2 although the image is unchanged | Image projector differs from polynomial operator | None |
| §4.3 adequate Taylor–Wiles count | n=2,l=7; n=l=3 | bound 2(n+1)=6≤7; tr(I₃)=0, H⁰(ad⁰) contains scalar line | Adequacy notions separated | None |
| §4.3 cyclotomic exceptional case | F=F⁺(ζ_l) | cyclotomic image in connected component fixes scalar I, dimension H⁰≥1 versus required 0 | Version (a) fails | None |
| §4.4 dyadic adjoint calculation | n=2 over 𝔽₂, A=I or Ψ₂ | X+Xᵗ has diagonal (0,0), misses I; Ψ₂ action gives (a+d)I, contains I | Strong oddness essential | None |
| §4.4 cardinality / presentation | n=1, q=0 or 1, |T|=1 | g=q; Q=∅ has 1 possible datum, not infinitely many; q=1 admits auxiliary-prime variation | Empty datum handled | Infinite-family phrase conditioned on q>0 |
| §4.5 minimal patching / parity | n=1,D=2, wrong multiplier parity | dim R∞ loses Dn=2 versus fixed dim S∞; correct parity loses 0 | Depth forces parity | None |
| §4.6 ordinary patching / Ihara avoidance | n=2, R={v}, distinct versus trivial χ | distinct-type component count 1; unipotent generic fibre has at least unramified and Steinberg branches (2) | Special-fibre comparison needed | None |
| §4.7 GHT replacement | l=n=3 | scalar trace 3=0 prevents Thorne adequacy; quotient ad/scalars condition avoids that H⁰ test | Generalization meaningful | None |
| §4.8 fixed-type patching | rank-two trivial type, regular weights {0,1} | ordinary status 1 versus 0 on different Barsotti–Tate components; over ℚ_l det reduces to ω⁻¹≠1 | Domain/seed-component condition necessary | None |
| §5.1 minimal lifting | n=1; cuspidal local seed | rank-one weights and type agree; non-generic unramified rank-two parameter has Hom dimension 1, so cannot be the generic seed | Conditions compatible | None |
| §5.2 strong residual oddness definition | σ(c)=((1,1),(0,1)) or I over 𝔽₂ | A=((1,1),(1,0)) diagonal (1,0), versus Ψ₂ diagonal (0,0) | Exactly first is strongly odd | None |
| §5.2 lift sign | symmetric I versus alternating Ψ₂ | skew lift of Ψ₂ exists with determinant 1; skew lift of I would require diagonal 0 reducing to 1 | Strong case forces µ(c)=−1 | None |
| §5.3 every-prime lifting | p=2,n=2, σ(c)=I; p=3,n=3 | first fails strong oddness; second has trace(I)=0 so requires GHT form | Exceptional hypotheses used | Correct source pages |
| §5.4 relaxed adequacy definition | trivial group,n=2; p∤n | H¹(1,k)=H¹(1,ad)=0 but trace on E₁₂ line is 0; if p∤n then ad=k⊕ad⁰ | Trace condition indispensable | None |
| §5.4 GHT ⇒ relaxed implication | H¹(H,k)=0 | exact sequence starts 0→H¹(H,ad)→H¹(H,ad/scalars), so target 0 forces source 0 | Direction correct | None |
| §5.5 ordinary lifting | rank one; nonordinary Barsotti–Tate lift | rank one graded weight h is ordinary; nonordinary rank two has flag dimension 0 versus required 1 | Residual ordinarity insufficient | None |
| §5.6 fixed-component finiteness / κ | n=1, κ=1 versus 0 | ν(c)=+1 versus −1, line-pairing sign −1 versus +1 | Wrong extension excluded | Correct source page |
| §5.7 ordinary fixed-weight finiteness | n=2,H={0,1},w=1 or 2 | w−H={1,0} or {2,1}; first compatible with weight-one multiplier, second not | Weight symmetry necessary | Correct source page |
| §5.8 dimension / characteristic-zero point | h⁰=0 versus 1; finite O-algebras O and k | lower bound 1 versus 0; dim O=1 has char-zero point, dim k=0 does not | Missing-invariants pitfall excluded | None |
| §5.9 nonsplit places | unramified quadratic K′/K, base L=K′ | K′⊗_K L=L×L versus inert K′ over K; n=1 local dimension 1=n² | Splitting prescription necessary | None |
| Supplied former §6.1 pairing / twist | n=2,N=5,q=11 | twist t=(5−1−2)/2=1; det untwisted 11³=1331, twisted 11; roots ±11,±121 versus ±1,±11 | Source twist correction retained in contract | Duplicate family assigned to earlier owner |
| Supplied former §6.1 torsor and modulus | n=2,k=𝔽₅; m=2,l=3,N=5 | #GL₂(𝔽₅)=480, #Sp₂=120, full isomorphism cover has ≥4 components; ord₅(3)=4 divisible by 2 | Pairing-preserving torsor needed | Exact supplier sections |
| §6.2 potential ordinary automorphy | I=∅; one n=2 factor | empty product torsor is Spec K, no automorphic witnesses to choose; one factor determinant ε̄⁻¹ and HT={0,1} | Empty family and multiplier consistent | Geometry imported |
| §6.3 ordinary crystalline lifts | n=1,h=2,w=3; n=2,w=1 | conjugate weight w−h=1; ψ-weight sum 2n−1−w=2 for second case | Polarization weights consistent | None |
| §6.4 tensor trick | HT sets {0,1},{0,1}; {0,1},{0,3} | tensor sums {0,1,1,2} have 3 distinct values, versus {0,1,3,4} with 4=n² | Regularity hypothesis essential | None |
| §6.5 PD lifting | n=1,d=1; n=2,m=3 | l≥2(d+1)=4 gives odd l≥5; {0,1}+{0,3} has 4 distinct sums | Bound and spacing consistent | None |
| §7.1 weak/strong primitivity definition | regular C₂ module over 𝔽₂ and its semisimplification | regular has one size-2 Jordan block; semisimplification has two size-1 blocks, both dimension 2 | Notions distinct | None |
| §7.2 large character ratios | C₃,three characters; two characters over 𝔽₇ of ratio order 3 | rank 3 regular is induced, ratio order 3=rank; rank 2 has ratio 3>2 and cannot be induced from index 2 | Strict bound necessary | None |
| §7.3 rank below characteristic | n=2,p=7; n=p=2 | index d≤2 gives d!=2 invertible mod 7; 2!=0 mod 2 and regular C₂ semisimplification changes | Strict rank bound correct | None |
| §7.4 strong primitivity and image | S₃ standard over 𝔽₅ and 𝔽₂₅ | index-2 induction needs character order 3; 𝔽₅ˣ has 4 elements, 𝔽₂₅ˣ has 24 | Coefficient dependence real | None |
| §7.5 finite pseudodeformation restriction | Σ=Γ; rank-one index-2 subgroup | identity map finite rank 1; subgroup group algebra maps by x↦(1+y)²−1, quadratic integral relation | Finiteness direction correct | Correct source page |
| §7.6 split/reducibility ideals | d=1; two-block upper triangular matrix | empty partition product=1; b≠0,c=0 gives bc=0 while b survives | Split ideal differs from determinant ideal | None |
| §7.7 reducible-locus bound | B=∅; n=2,n₁=n₂=1 | d₀=0, bound 2D; one Steinberg relation Ψ₁(Frob)=Ψ₂(Frob) removes 1 independent direction | Correct dimensions | Correct source page |
| §7.8 genericity definition | A=k; A=k⟦T₁,T₂⟧ | residual pro-l characters all 1, so relation exponent (1,0) holds; (1+T₁)^a(1+T₂)^b=1 forces a=b=0 | Genericity not residual | Correct source page |
| §7.9 countable avoidance | R=k⟦x,y⟧, ideals (x−f(y)); d=1 domain | dim R=2, each quotient dimension 1; all such primes cannot be avoided simultaneously; in d=1 minimal prime has dim 1 and avoids m-primary ideals | Countability indispensable | Correct source pages |
| §7.10 strong generic restriction | eigenvalues 1+T and −(1+T) | distinct at power 1, equal at power 2; multiplicative relation (1,−1) squared=1 | Regular semisimple alone inadequate | None |
| §7.11 determinant splitting | n=1,l=5, ε(g)=6 | ψ₀ψ₀^c(g)=1, µ(g)=1/36; difference 35/36 has v₅=1; corrected d₀=ε⁻¹ has norm 1/36 | Teichmüller-only form false | Retain prior correction, fix pages |
| §7.11 twists and completed components | ψ=1; two sign blocks | twisted prime equals original at ψ=1; action group size 4, effective size 2 | Identity and quotient correct | None |
| §7.11 restriction map / Hecke kernel | nested good extensions L⊂M⊂N | composed pullback equals restriction to N; kernel image J_N⊂J_M, opposite inclusion not implied | Ring-map direction correct | None |
| §7.12 Schur reduction and imprimitivity | block-adapted weights 0,1; ramification T=u² | midpoint weights 0,1/2 become 0,1 after scaling by 2; residue field remains k on both sides | No hidden residue-field enlargement | None |
| §7.13 weak-primitive restriction | value 1+Tf in char l | (1+Tf)^(l^m)=1+T^(l^m)f^(l^m); equals 1 only for f=0 | Restriction cannot kill nontrivial torsion-free characters | None |
| §7.14 image-preserving weak primitivity | S₃→C₃ restriction over ℂ | S₃ standard induced from index 2; C₃ restriction rank 2 cannot be induced since no index-2 subgroup | Image equality essential | None |
| §7.15 splitting coefficient field | S₃ standard over 𝔽₅,𝔽₂₅,𝔽₆₂₅ | order-3 chars absent for 4-element units; present for 24- and 624-element units; induced over last two | Splitting hypothesis necessary | None |
| §7.16 relative cotangent / block signs | d=3,l=5 | 2^d=8≡3 mod 5, inverse 2; effective sign group size 4; no N-dependence | Averaging denominator a unit | Correct source pages |
| §7.17 uniform cotangent control | n=2,D=2,q_TW=3 | a=n(n−1)D/2=2; free rank q_TW−a=1, not 3; E/A summand rank 1 | Euler correction correct | Matlis supplied directly |
| §7.18 equivariant patching | d=3; k[x]/x^N | all 8 sign actions, effective 4; dim_k k[x]/x^N=N unbounded, inverse limit k⟦x⟧ not finite | Uniform generator bound essential | Correct source pages |
| §7.19 strong generic R=T | residual field extension 𝔽₅→𝔽₂₅ | standard S₃ representation primitive over first, induced over second | Normalization residue field must occur in premise | Correct source page |
| §7.20 weak generic R=T | localization and nilradical | primes of R_p correspond to Q⊂p; J⊂all such Q gives J⊂√0 in R_p; in Noetherian ring (√0)^m=0 | Containment direction correct | None |
| §8.1 good extensions definition | M=L; M=E≠L; ramified quadratic at (1+i) | degrees 1, [M:L]>1, and local e=2 respectively; only first automatically disjoint and split | Positive and negative controls | Correct source page |
| §8.1 tower and subset API | degree 2 then 3, both completely split at P | 2·3=6 primes over P versus degree 6; deleting P leaves no splitting constraint | Stable under towers | None |
| §8.2 potentially pro-automorphic prime | J=(1),0; ℤ→ℤ/2,J=(2) | extended ideals whole ring,0,0; prime condition false,true,true | Correct ring for containment | Correct source page |
| §8.3 residual invariants | good extension versus image-index 2 extension | same image size h versus h/2; weak primitivity stable only first | Avoidance hypothesis used | Correct source page |
| §8.4 propagation direction / degree bound | D=2,|R|=1,extension degree 3 | new D=6, |R_M|=3, so 6>3; D=1 would give 3=3 | Strict bound needed | Correct source pages |
| §8.5 connectedness bound | n=2,D=10,|R|=1 | pre-special bound 20−2−2=16; after special fibre and triviality 16−1−4=11; formula 20−6−3=11 | One-dimensional loss charged | None |
| §8.5 numerical threshold | n=2,|R|=1 | |R|n(n+1)+3=9; d₀,d_l>9, not >8 | Matches corrected route | None |
| §8.6 component finiteness | R=Λ[x]/x²; Λ[x] | first generated by {1,x}, reduced quotient rank 1; second infinitely many independent x^j | Nilpotents included, finite type insufficient | Native nilpotent-kernel input; Λ-action explained |
| §8.7 ordinary Steinberg finiteness | n=2, B=∅ versus many B | d₀=0 versus 2δ; required d₀>positive bound fails first | Steinberg input necessary | Fix §3.5(4)→(3), source page |
| §8.8 residually reducible lifting | n=2, local unramified semisimplification | Frob eigenvalues ψq,ψ, ratio q; N can be 0 locally, so theorem correctly specifies semisimplification | No false local monodromy premise | None |
| §8.9 two adequate constituents | n₁=n₂=1, forbidden cross duality | χ₂^c=ε⁻¹χ₁⁻¹ gives forbidden Schur pair; distinct individually polarized lines avoid it | Schur hypothesis explicit | None |
| §8.10 character-sum finiteness | n=2,p=5; Σ=∅ | doubled rank 4<5; empty Σ loses d₀, allows bound 2D+2 versus 2D | Strict p>2n and nonempty Σ matter | None |
| §8.11 lifts of every weight | n=2,λ=0,w=1 or 3 | w−{1,0}={0,1} or {2,3}; only w=1 matches conjugate λ=0 | Multiplier weight needed | Correct source page |
| §8.12 trace equations / dimension | n=p=2, Φ=aI | tr Φ=tr Φ²=0 for every a; det=a² variable, not forced 1; p>n permits Newton division | Characteristic bound necessary | None |
| §8.13 reducible bound | n=2,n₁=n₂=1,d_R=1; x²=y² in 1+m, p=5 | dimension bound 2D+1; square map on pro-5 group injective, x=y | Rank-one supplier required | None |
| §8.14 generic prime in quotient | R₁=R₂=∅ | threshold nD+n exceeds dim Λ/(ϖ)=nD by n>0 | Empty level-raising case vacuous, identified | None |
| §8.15 Schur global dimension | n=1; n=2,D=2 | 1+0−0=1; 1+2·1−2·1=1; ζ_p case subtracts h⁰≥1 | Lower bound needs Schur cyclotomic condition | None |
| §8.16 prescribed-type lifts | n=3,p=3 or 5 | 3>max(3,3) false, 5>3 true; p∤n true only second | Source hypothesis excludes bad characteristic | None |
| §8.17 weak ANT lifting | n<l versus n=l+1 | n=2,l=5 uses rank comparison; n=6,l=5 cannot use n<l but remains prime-to-l | No small-rank shortcut | None |
| §8.18 weak ANT finiteness | S₃ standard over 𝔽₅ versus splitting field | induced-character multiplicity 0 available over 𝔽₅, 1 over 𝔽₂₅; primitivity over algebraic closure fails | Arbitrary finite-k form not asserted | None |
| §8.19 weak two-constituent theorem | two adequate rank-one blocks versus sum | two block projectors E₁₁,E₂₂ fixed; trace on off-diagonal line 0, so reducible sum not adequate | Adequacy is per constituent | None |
| §8.20 unobstructed auxiliary place | n=1,q=2,l=5; n=2,q=2,a=4 in 𝔽₇ | scalar operator q−1=1≠0; adjoint eigenvalues (2,1,4,2) include 1, so a=4 is excluded | Criterion retains Tate twist and eigenvalue restrictions | None |
| §8.20 nonscalar accepted model | n=2,q=2,a=3 in 𝔽₁₁ | eigenvalues (2,6,8,2), none 1; determinant of (qAdΦ−1)=1·5·7·1=35≡2 | Nonscalar auxiliary data allowed | None |
| §8.20 ramified negative model | O=ℤ₅[ζ₅], q=11 | τ=ζ₅=1+ϖ, τ^11=τ, residual τ=1; H⁰(k(1)) dimension 1 | Genuine ramified character supplied | Specified root-of-unity coefficient ring |
| §9.1 generic Galois definition / transport | 1; 1⊕|·| with N=0 or linked N | Hom dimensions 0,1,0; rank-one determinant twist changes by |·|≠1 | Monodromy cannot be forgotten | None |
| §9.2 f=g criterion | n=1,K=ℚ_p; unramified (1,q) | h¹=2, h_f=h_g=1, φ on E(1)=p⁻¹≠1; (1,q) has h_g−h_f=1 | Equality tested both ways | None |
| §9.3 adjoint Selmer definition | rank-one odd pair | j acts −1, ad=E(δ); class-group homomorphisms to E vanish: dimension 0, ambient H¹ dimension ≥D | Selmer condition nonvacuous | Pairing described without unjustified symmetry |
| §9.3 odd fixed-space formula | n=2,D=2 | fixed skew-adjoint dimension n(n−1)/2=1; ambient lower bound Dn(n+1)/2=6 | Sign normalization correct | None |
| §9.4 semistable determinant quotient | ω over ℚ,p=5,weights [0,0]; a>b | ω inertia order 4 versus allowed unramified order 1; empty weight interval has only zero module | Quotient can be 0 | None |
| §9.4 self-dual involution | interval [0,2], w=2; w=3 | dual-twist interval [0,2] versus [1,3] | a+b=w necessary | None |
| §9.5 cotangent comparison | n=1,F=ℚ,S={p},ρ=1,[0,0] | unrestricted H¹(O/ϖ^m) has length m; constrained H¹_E=0 and cotangent 0 | Local condition cannot be dropped | None |
| §9.5 irreducibility / denominator control | ρ=χ₁⊕χ₂ | infinitesimal off-diagonal cocycle contributes trace 0; rank-one comparison c=0 | Reducible case can have growing kernel | None |
| §9.6 trace equivariance | n=1, ψ(1+εφ) | conjugate-dual-twist gives ψ^(c,−1)χ(1−εφ^c); source action −φ^c agrees | Minus sign pinned | None |
| §9.6 point and local-condition hypotheses | rank-one weight 1 with interval [0,0] | 1∉[0,0], so no determinant point and no cotangent there | Missing premise detected | Added semistability and weight interval |
| §9.6 rational comparison | n=1, CM anti-invariant group | fixed-weight anticyclotomic quotient finite, Hom( finite group,E)=0; both rational spaces dimension 0 | Consistent | None |
| §9.7 adjoint vanishing / R_S | n=1; Steinberg rank 2 | n=1 Selmer dimension 0 by class groups; Steinberg generic Hom dimension 0 supplies f=g; R_S completed tangent dimension 0 | Endpoint consistency, not independent proof | None |
| §9.8 pseudodeformation residue field | local A=E[ε]/ε² versus E | cotangent dimensions 1 versus 0; Nakayama forces m=0 only second | No nilpotent thickening hidden | None |
| §9.9 ordinary tangent weight | n=1, unramified ψ versus log ε | unit restriction ψ=0 versus log ε≠0; first H¹_g line dimension 1, second not Hodge–Tate | Weight-zero tangent hypothesis necessary | None |
| §10.1 presentation and parity | N=2,d=1,µ odd,a=1 | κ=−1,δ=1; g=b−f−2+1; local dim=A+f−1; sum 1+A+b−2 versus depth 1+A+b | Odd-level correction cancels | None |
| §10.1 even parity and no LR places | N=2,µ=0,a=0 | δ=κ=0; g=b−f; dimension 1+A+b | Matches depth | None |
| §10.2 integral rigid R=T | ξ=0,N=2; d(V)=0 or 1 | aξ=0,bξ=1, D0 gives ℓ≥3; D1 gives ℓ≥6, hence prime ℓ≥7; cohomological degree 0 or 1 | Hypotheses meaningful | None |
| §10.3 elliptic ratio test | E:y²=x³+3x+2 over 𝔽₅,ℓ=7,N=3 | #E=5; roots 2,6; α/β=5; old exponents give {4,1,2}, full exponents {2,3,1,5,4}; 11904 mod 7=4 | Old sparse test misses ramified lift | Prior correction retained |
| §10.3 denominator clearing | roots of X²−X+5 | α/β+β/α=(1−10)/5=−9/5, not integer; α−5β is integral and nonzero | Ratio not generally integral | Clear denominators and exclude residue characteristic |
| §10.3 ramified lift witness | Φ=diag(2,10,1),τ=I+7E₂₁ | ΦτΦ⁻¹=I+35E₂₁=τ⁵; τ mod 7=I but τ≠I | Negative control recomputed | None |
| §10.3 supercuspidal irreducibility | unramified induced Weil parameter, degree b=2 | inertia restriction has 2 summands while full Weil parameter rank 2 irreducible | Full Weil group required | None |
| §10.4 weight conversion | n=1,λ=1; n=2,λ=0; n=3,λ=(2,1,0) | converted −1; (−1,−1); (−2,−3,−4); applying conversion twice gives original in each | Involution, dominance, dual twist verified | None |
| §10.5 generic-domain lifting | inert unramified p-place, local extension degree 2 versus 3 | tensor K′⊗K′=K′×K′ for quadratic prescription; odd-degree extension remains inert degree 2 | Patching requires splitting | Added local prescription and negative Check |
| §10.5 source polynomial and seed | n=2,λ^s=0 | source index λ^s+η=(1,0), common index (0,−1) differs; no prescribed-type seed means premise (vi) false | Neither convention nor seed may be dropped | None |
| Contract: equal-characteristic projective image | Sp₄(𝔽₅⟦T⟧) | torus product ab·a⁻¹b⁻¹=1; projective dimensions 10 versus PGL₄ dimension 15 | Independence hypothesis excludes wrong image | Accepted conditional contract retained |
| Contract: arbitrary-base Barsotti–Tate components | rank 2, weights {0,1} | ordinary flag rank 1 versus nonordinary flag rank 0; both have two Hodge weights | Both component classes needed | Accepted conditional contract retained |
| Contract: dyadic 𝒢_n archimedean ring | n=2, alternating versus nonalternating residual form | symmetric tangent dimension 2·3/2=3; X+Xᵗ misses I whereas Ψ₂ image contains I | General GL₂ involution ring cannot replace it | Accepted conditional contract retained |
| Contract: completed-product components | abstract countermodel O[x]/x(x−ϖ) | 2 generic minimal primes (x),(x−ϖ), only 1 special-fibre minimal prime (ϖ,x) | Desired uniqueness is substantive for supplied rings | Accepted conditional contract retained |
| Contract: semistable stable category | [0,0], ρ̄=ω at p=5 | allowed inertia 1, ω inertia order 4 | Quotient may be zero | Accepted conditional contract retained |
| Contract: nonsplit minimal ramification | n=1, inert place | fixed-multiplier relative dimension 1=n²; derived dimension 0 plus one free direction | Not the dimension-zero formula alone | Accepted conditional contract retained |
| Contract: generic tame crystalline domain | empty type versus nonempty generic type | empty quotient 0 has no field-valued point; nonempty seed gives ≥1 point | Domain-or-zero formulation necessary | Accepted conditional contract retained |
| Contract: dyadic global presentation | n=2,D=2 | archimedean term per place 3, total 6; odd-characteristic ad⁰ shortcut loses scalar effects since 2=0 | Requires dyadic contract | Accepted conditional contract retained |
| Contract: nonsplit polarized presentation | N=2,d=1,µ odd,a=1 | local correction −1, generator correction +1, net 0; archimedean deficit 2 | Actual local tangent defects retained | Accepted conditional contract retained |
| Contract: square-zero determinant cotangent | n=1, r(1+εφ) | determinant-fixed implies φ=0; determinant is r(1+εφ), no additional tangent parameter | Relative cotangent interpretation consistent | Accepted conditional contract retained |
| Contract: rank-one ordinary finiteness | n=1,D=2 | weight algebra special-fibre dimension 2; fixed weight removes 2 directions; Steinberg means unramified in rank 1 | Separate input from n≥2 theorem | Accepted conditional contract retained |
| Contract: enormous-image Taylor–Wiles primes | p=2 and rank-one scalar mod p | residual scalar image has 1 element, whereas characteristic-zero detection concerns E-submodules and need not factor through it | No residual adequacy substitution | Accepted conditional contract retained |
| Contract: group-equivariant patching | d=3, l=5 | sign group order 8, effective order 4, 8 inverse modulo 5 is 2 | Full fixed finite action must survive patching | Accepted conditional contract retained |
| Contract: Brochard / ultrapatching | A=B=k, M=k; M=0 | edim 0=0, free rank 1; zero module has rank 0 and cannot certify nonzero support | Nonzero premise used | Accepted conditional contract retained |
| Contract: bounded denominator determinant lifts | ρ=χ₁⊕χ₂ versus n=1 | off-diagonal infinitesimal trace 0 in first; rank-one determinant map identity, exponent k₀=0 | Absolute irreducibility needed | Accepted conditional contract retained |
| Contract: integral unitary Shimura cohomology | N=2, signature (1,1) versus (2,0) | d(V)=1 versus 0; rank-one monodromy only at prescribed nonsplit special level | Degree-zero forms do not supply arbitrary signature | Accepted conditional contract retained |
| Contract: unitary dual conjugate self-duality | GL₁(ℂ), angular k=1, radial t=0 or 1 | conjugate and dual radial powers 0=0 versus i≠−i; half-integral parameters only t=0 | Half-integrality is substantive | Accepted conditional contract retained |


Pull request: #2135 (roadmap/potential-automorphy-infrastructure-part-ii at 7c77575)
