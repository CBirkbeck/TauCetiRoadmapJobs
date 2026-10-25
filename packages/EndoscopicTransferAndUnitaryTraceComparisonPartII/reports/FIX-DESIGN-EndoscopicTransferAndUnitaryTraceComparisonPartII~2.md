# Design repair report

The edited specification is `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md`; its graph is `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json`. Bibliographic records are in `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml`. No Lean file exists in this design package, and none was created. No other package, merge order, tooling, issue or pull-request text was changed. No commit was made.

## F01 (P1) — not actionable in this package: Jacquet–Rallis ownership and supplier proofs require the maintainer

Anonymous G1 → owned fibre-integration target §0.6, with sections, surjectivity, invariant cutoffs and three Checks. G3/G5/G6 → explicit parent-supplier gaps jr-local-comparison, jr-weil-descent and jr-product-base-change, each wired into direct consumers. Allocating and proving the independent Jacquet–Rallis continuation cannot be settled here. The preserved split proposal remains in plan.restructure; it is not an accepted supplier.

Evidence: Leslie25 line 642–671; Leslie19 line 1338 and line 1379–1393. Local product charts prove compact lift surjectivity; the invariant cutoff is clopen in the ambient Hom space, so multiplying a compact test by it preserves compactness. The cutoff itself need not be compact. The gap entries name EndoscopicTransferAndUnitaryTraceComparison and explicitly requested continuation sections, without claiming those sections exist. Their actual additions or a separate supplier require the maintainer. All FJ.0/FJ.1 consumers and the local/spherical Jacquet–Rallis consumers were updated.

## F02 (P1) — applied

G4 → the finite-inversion proof of §3.3; G2/G7/G8 and their three unused targets were deleted. The precise full spherical operator remains in §5.1. Scope now distinguishes Leslie19 Conjecture 4.4 and Leslie25 Remark 3.7 from theorem targets. E12 records the general four-form sign discrepancy; the spherical reduction uses only the reference/reference contribution.

Evidence: Xiao18 line 914–916 gives the forward identity and line 932–945 its torsor coordinates. Orthogonality gives H Hᵗ=2ʳI, hence the inverse coefficient 2⁻ʳ. Leslie25 line 493–497 fixes the centralizer measures, and line 1169–1180 supplies the full-module research boundary. All coverage and gap records were updated, not only the README paragraphs.

## F03 (P1) — not actionable in this package: the all-quadratic ordinary factor extension belongs to the parent

Fictitious ET stages and requests → the parent’s actual numbered sections throughout. The missing cyclic-factor/Jacobian comparison is owned in §3.5. The larger ordinary factor formula → gap:unitary-factor-all-quadratic on parent §2.12, explicitly consumed by matching and spherical results. The parent’s dyadic/ramified extension needs a supplier edit.

The proposed determinant identity needs an ordered-block sign over a ramified extension: with D=∏(λa−λb), the cyclic determinant ratio is (−1)^(ab)D. For a=b=1 it is λb−λa. Section 3.5 and E14 retain this sign; the unramified application has η(−1)=1. Evidence: Xiao18 line 1015–1028 and line 1181–1187. Parent §§1.1, 1.4, 1.5, 1.14, 1.17, 2.1, 2.4, 2.9, 2.11, 2.12, 3.3, 4.7 and 4.9 were read at the supplied open head. Its §2.12 explicitly assumes unramified E and odd p.

## F04 (P1) — not actionable in this package: the missing Hermitian classification exports require supplier edits

The false dyadic classification import → three explicit GN gaps: hermitian-field-classification, unramified-hermitian-lattice-orbits and unramified-unit-vector-transitivity. Existing lattice/adjoint/density references now use §§2.7, 2.9 and 3.2. The sign comparison and unit-vector rescaling instead consume the pinned norm-surjectivity theorem, so existence of a norm −1 unit has no lattice-classification gap.

The pinned `TauCeti.map_normUnits_unitFiltration`, `TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126`, has finite-dimensional unramified local-field hypotheses and no restriction on residue characteristic. Depth zero gives the required unit. GN §2.9 still restricts local classification to odd residue characteristic. Its broader §3.2 dyadic density results were read, but do not state the three missing classification/transitivity exports. These supplier obligations cannot be proved by editing this package. Each has boundary Checks and graph consumers.

## F05 (P1) — applied differently

Unassigned Igusa criterion → a direct proof of the full invariant coordinate-ring assertion in §0.3. On det(B)≠0, invariance implies P(A,B)=P(AB,I); polynomial density extends the equality everywhere. Conversely every polynomial in AB is invariant, and the section makes pullback injective. Affine descent now cites SchemeAndStackFoundations §1.24.

This retains both categorical quotients at their full stated generality, rather than weakening them to invariant coefficients. It needs no separate generic Igusa theorem. The split action and section are Leslie25 line 559–575; the coordinate-ring proof is given in the roadmap itself. At n=0 the dense open is the entire point and both coordinate rings are F.

## F06 (P2) — applied

Repeated supplier obligations → imports: §§2.1/2.5 of MetaplecticAutomorphicForms provide the Weil index/operators, parent §1.17(b) the pure-form torsor, parent §2.4 basepoint reindexing, and Tau Ceti the norm unit. Here §3.1 proves the cyclic-coordinate bijection, §3.7 extends agreeing descended actions to their sum, and jr-weil-descent asks only for orbital descent and agreement.

The four changes propagate through supplier contracts, individual prerequisites and the sign/unit-vector proofs. Evidence: the actual supplier sections, BP21 line 217 onward and Proposition 1, p. 7; Xiao18 line 932–945; the pinned norm declaration at line 126. No new Weil representation or second inv map is introduced.

## F07 (P3) — applied differently

Layers 0–1 now allow quadratic étale E, with an explicit split dual-pair model instead of applying a field-only carrier to F×F. Generalized nilpotent integrals and germ inversion allow every quadratic field extension. Spherical and Lie-descent applications remain unramified. The split Check also records that GL_n has no proper elliptic block datum with a,b>0.

Evidence: Leslie25 line 510–513 and line 559–575; Xiao18 line 108–116 and line 196–203. Over split E the norm is (u,v)↦uv, U(W)=GL_n and there is one Hermitian form class. Thus the requested split example must not retain the field case’s four relative form pairs or assert an elliptic product datum that does not exist. All rank-one germ examples were explicitly labelled unramified specializations after widening the theorem.

## F08 (P3) — applied

Unqualified rank-one −N(z) → −(a1/a2)N(z) for Wi=⟨ai⟩. Corrected conventions, contraction acceptance clauses, quotient acceptance clauses and their Checks. The nonnorm example W1=⟨1⟩, W2=⟨ε⟩ now gives −ε⁻¹N(E×), distinct from the standard norm coset. Standard-form spherical witnesses retain their justified specialization.

The adjoint equation gives a1 z̄=a2 X^τ, hence the ratio. This is also consistent with Leslie25 line 535–555. At z=1 the two examples give −1 and −ε⁻¹ respectively, so the previous formula fails unless the forms have the same coefficient ratio modulo norms.

## F09 (P3) — applied

Theorem 2.12 locator → p. 21; BP21 §2, Lemma 1 → pp. 4–5. The relative-orbital integral now names its actual direct consumers, κ-orbital-integral and orbital-comparison. The same pattern was repaired in all 14 direct-consumer lists by recomputing them from plan prerequisite edges.

Evidence: Leslie25 line 873; BP21 line 137–216. The graph no longer presents the indirect unit-theorem use as a direct dependency of relative-orbital-integral. The historical source correction about text *after* Theorem 2.12 on p. 22 keeps its different, correct locator.

## F10 (P3) — applied differently

Field lists and proposed Lean test names → six prose layers with hypotheses, locators, Needs, APIs, unnamed Checks, Examples and Dependencies. Added Summary, Scope and exact supplier contracts; removed dangling links and mathematical TeX. Every retained target has at least three Checks. The added fibre-integration and factor-comparison targets stay inside existing layers; the precise FJ.5 construction remains Layer 5.

Zero-function tests were replaced by nonzero values, scaling witnesses and failed hypotheses. The old 115 proposed test names are no longer promises of Lean declarations. All mathematical content not removed under F02 is retained, with supplier ownership separated from local work. Hironaka’s operator is fixed by its actual normalized spherical-function integral and the measure on all X_n, not merely by its two cyclic-module properties.

## F11 (P3) — applied

Implementation status, route counts, report provenance, access narrative and tooling/build claims → timeless mathematical prose. E01–E13 remain Source corrections, without provenance lines; E14 records the ordered determinant sign required by the added comparison. The split proposal and original route records remain solely in plan.restructure.

The README contains no packet, WORKERS, lean-check, unchecked, current or previously-reported prose. This does not claim that any supplier gap is implemented or any theorem accepted.

## F12 (P3) — applied

Old baseline commits → Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, exactly as in the content manifest. The eight original matrix/polynomial declarations, the implicit function and both norm declarations were read at those pins; their contracts and file locators are recorded in the README.

The pin is not inferred from GitHub’s default branch. Searches were used as leads; statements relied on the explicit pinned file URLs.

## F13 (P3) — applied differently

Missing manifest → five certified, legally fetched source records, with exact citing targets, hashes and version notes. Leslie25 and BP21 explicitly use arXiv v3 pagination. Hironaka99 uses the publisher’s OCR scan. No Jacobowitz, Shalika or Zhang text was newly cited directly: the local proof and explicit supplier gaps use the five texts actually read.

The publisher-URL fetch initially needed an explicit legal class; the successful publisher-open fetch resolved it. Its bibliographic fields were completed from Hironaka99 line 7–10 after the source checker identified them as missing. There are no unresolved reference requests. No source text or PDF was copied into the repository.

## F14 (P3) — applied differently

The proposed five matrix milestones and admitted examples → an acceptance specification with zero declarations, the four headline theorems, their missing analytic carriers and the required namespace/import/docstring. README and plan agree. There is no Suggested.lean to edit in the permitted design files; no matrix surrogate, admitted example or sorry-valued data is proposed.

The one-step matrix facts are imported background targets only. At the pins, `Matrix.isHermitian_mul_conjTranspose_self` is at `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:285` and `Matrix.charpoly_mul_comm` at `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:271`. `TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean:13–31` describes an arithmetic p-local Hecke ring, not the spherical local-field algebras required here. Mechanical binder comparison has zero declarations to compare; no Lean command was run or claimed.

## F15 (P3) — applied differently

“Ordinary endoscopy remains in the parent” → a precise Scope boundary at parent §§1.17, 2.12 and 4.4–4.7, followed by this Part II’s symmetric-space objects and end theorems. Jacquet–Rallis inputs are named supplier gaps, rather than an unsupported claim that this package owns a separate global spectral programme.

GanGrossPrasadUnitaryGroups’ supplied open head was read: its relative continuation gaps include global geometry and finite/archimedean transfer, beyond this package’s lattice theorem. Resolving that larger ownership is the maintainer decision recorded under F01, not an inferred expansion of this roadmap.

## Adversarial mathematics pass

Values below were computed from the definitions and the cited forward identities. A boundary computation is not a proof of a supplier gap. Rows labelled “gap retained” verify the claimed scope or normalization while leaving the supplier theorem explicitly outstanding. The table covers the 36 target statements, their API laws, standing conventions and mathematical source corrections; purely bibliographic corrections are recorded with their source lines above.

| Statement | Instances tried | Computed values on the two sides | Result; change |
|---|---|---|---|
| Characteristic/field conventions | F=Q₂; residue F₂; q=1; characteristic-two field | char F=0, 2≠0 in F, #k=2; q=1 is no field residue cardinality; characteristic-two F fails char-zero hypothesis | Retain dyadic places; exclude invalid inputs explicitly |
| Rank/empty conventions | n=0,1; GL₀,U₀ | Empty determinant and charpoly are 1; both zero-rank groups have one element | Rank-zero comparison is defined |
| §0.1 block embedding and inverse | n=1, X=1; n=2, diag(1,π) | δ* =−δ; top-right(δ(X))=X; δ² has entries −1,−π² twice | Positive lower-left sign fails |
| §0.1 action composition | Two changes (g1,g2),(h1,h2) | g1(h1Xh2⁻¹)g2⁻¹=(g1h1)X(g2h2)⁻¹ | Noncommutative order retained |
| §0.1 split Hermitian pairing | E=F×F; scalar (a,b) on first argument | h((av,bℓ),(w,m))=(bℓ(w),a m(v))=(b,a)h((v,ℓ),(w,m)) | Conjugate-linearity; explicit split carrier |
| §0.1 split unitary group | g on M, t on M* | Pairing preserved iff t=(g⁻¹)*; paired Hom adjoint sends (A,B) to (B,A) | U(W)=GL(M), no field instance on F×F |
| §0.1 split action witness | Rank one, (A,B)=(1,1),(g,h)=(2,1) | New pair (2,1/2); product 1=1 | Distinguishes the inverse/right action |
| §0.2 adjoint coefficient | W1=⟨1⟩, W2=⟨ε⟩, z=1 | X^τ=ε⁻¹; r1=r2=−ε⁻¹, versus old −1 | Corrected every general rank-one formula |
| §0.2 standard contractions | z=1; X=diag(1,π); X=0 | r1=r2=−1; both diagonal contractions diag(−1,−π²); at zero both 0 | Sign and conjugation pinned |
| §0.2 self-adjointness | General X; standard n=1 | (−XX*)*=−XX*; (−X*X)*=−X*X; value at 1 is −1 | Existing Mathlib facts imported |
| §0.2 equivariance | Unitary g1,g2 | (g1Xg2⁻¹)^τ=g2X^τg1⁻¹; r1 transforms to −g1XX^τg1⁻¹ | Order agrees in a nonabelian matrix group |
| §0.2 swap and charpoly | X and X^τ; diag(1,π); empty matrix | r2(X)=r1(X^τ); both polynomials (T+1)(T+π²); empty case 1=1 | Existing charpoly identity; no acceptance padding |
| §0.3 quotient invariant ring | Split (A,B), det B≠0; section (−Z,I) | h=B⁻¹ gives (AB,I); −(−Z)I=Z | Full invariant ring proved directly |
| §0.3 singular quotient | Rank-one pairs (0,1),(1,0) | Invariant 0=0, but nonzero-factor positions differ and cannot be exchanged by the action | Quotient is not a singular-orbit classifier |
| §0.3 rational image | ⟨1⟩,⟨ε⟩ | Images −N(E×), −ε⁻¹N(E×) are different cosets | No rational surjectivity claimed |
| §0.4 regular iff invertible contraction rss | z=0; split A=diag(1,0),B=I | δ charpoly T²; second case T²(T²+1), although −AB has distinct roots 0,−1 | Nonzero determinant is essential |
| §0.4 regular positive example | X=diag(1,π) | p_r=(T+1)(T+π²); p_δ=p_r(T²)=(T²+1)(T²+π²), distinct roots in char 0 | Both directions’ boundary fixed |
| §0.5 torsor fibres | Rank-one unramified; split T≠0 | −1 lifts, −π does not; split fibre {(u,−T/u)} has free transitive F× action | Geometric versus rational surjectivity separated |
| §0.5 stabilizer projection | t centralizes −XX^τ | Inverse (t,X⁻¹tX) projects to t; substituting fixes X | Source/target and inverse specified |
| §0.5 rational-class kernel | n=1 field; split | Field kernel of C₂→C₂ is {0}; split H¹ is trivial | Neutral class preserved; classification gap visible |
| §0.6 local section derivative | Rank-one norm at z≠0; split uv at (1,t) | Norm derivative is N(z)Tr(z⁻¹dz), onto F; split derivative t du+dv is onto | Local section at every image point, including dyadic F |
| §0.6 compact fibre lifts | Chart B×J, vol J=2, h=1_B | Integral of (1/2)1_J is 1; unnormalized 1_J integrates to 2 | Nonzero denominator justified by Haar positivity |
| §0.6 orbitwise cutoff | Unramified n=1, f=1_OE,B=OF× | χ⁻¹(B)=OE×; f1_U=1_OE×; pushforward 1_OF× | Clopen cutoff lies away from singularity |
| §0.7 RO and linearity | n=1, unit orbit; tests f and 2f | Values 1 and 2; quotient integral of their sum is 3 | Excludes zero distribution |
| §0.7 Haar covariance | Group scales 2,3; torus scale 4 | 2·3/4=3/2 versus original 1; torus scale 2 alone gives 1/2 | Correct inverse centralizer factor |
| §0.8 fibre independence | X replaced by Xu₀ | ∫f(Xu₀u)du=∫f(Xu)du; unit-fibre value 1=1 | Haar translation, not lift choice |
| §0.8 compact versus ambient support | 1_OE and 1_OE×, unramified rank one | First is 1 at π^(2j), j≥0, and accumulates at 0; second gives only valuation 0 | Full pushforward not compact in F× |
| §0.8 support/linearity/surjectivity | Chart lift h1_J/vol J | Pushforward h; sum of lifts of h and 2h pushes to 3h; image support stays in B | Compact nonsingular map is onto |
| §0.9 orbital comparison | n=1, X=1,π,π⁻¹, f=1_OE | Both sides respectively 1,1,0; torus doubled gives 1/2 on unit orbit | No unjustified global compactness |
| §1.1 relative labels | a=b=1, field versus split | Field labels form C₂², cardinality 4; split classes cardinality 1; centres of GL_a×GL_b and GL_n have dimensions 2 and 1 | Split proper elliptic datum excluded |
| §1.1 form transport/contractions | β=ε versus β=1 at X=1 | Second contraction −ε⁻¹ versus −1 | Isomorphic abstract unitary groups do not erase form labels |
| §1.2 matching and factor | a=b=1, x−y=π or unit; x=y | Δ=−q⁻¹ or 1 in unramified case; at x=y resultant 0 and G-regular hypothesis fails | p=2 included; ordinary factor extension is a gap |
| §1.2 unmatched and rational correction | Wrong product charpoly; C₂ orbit change | Factor 0 in unmatched case; κ(inv)=−1 flips a factor’s sign | Imported inv orientation retained |
| §1.3 κ sum and basepoint | C₂, orbital values 2,5 | Stable 7; weighted −3; shifted weighted 3=(−1)⁻¹(−3) | Parent reindexing imported |
| §1.4 transfer relation | Δ=−1/2, source κ integral 2; unmatched target value 1 | Matching target must be −1; unmatched target must be 0, so 1 fails | Both clauses necessary |
| §1.4 linearity and quotient class | Pairs with target values −1,−2 | Sum target −3 equals Δ times summed source 6; adding a target with all regular stable integrals 0 changes none | Relation on orbital classes, no preferred representative |
| §1.5 nonsingular transfer | 1_OE× versus 1_OE | Compact nonsingular pushforward 1_OF×; full indicator has infinitely many grades and includes 0 | Theorem’s support hypothesis retained |
| §1.5 target lift normalization | vol J=2 | Target lift (1/2)1_J has integral 1; naive lift integral 2 | Invariant cutoff plus fibre lift specified |
| §2.1 full spherical module/basis | e₀,e₁,e₋₁, n=1 | Values at valuation 1: 0,1,0; supports are three disjoint compact open shells | Both forms and negative coweights kept |
| §2.1 module laws/extension by zero | Unit 1_K; shell e₋₁ | 1_K*e₋₁=e₋₁; shell is zero on a neighbourhood of 0 in F | Genuine compact test after zero extension |
| §2.2 Satake/BC commutation | a=b=1 | (q⁻¹/²X)²=q⁻¹X²; central monomial scale q⁻² | Twists and base-change direction agree |
| §2.2 support counterexample | n=2,q=2 | BC(T10)=T20−T11; coefficient at (1,1) is −1 | Entrywise-even support shortcut rejected |
| §2.3 fixed transform/measure | n=1, additive Haar OF=1 | μ₀(OF×)=1−q⁻¹; C=(1−q⁻¹)⁻¹; each valuation shell has μ mass 1 | Single measure fixes both field-form components |
| §2.3 Fourier values/inverse | n=1,j=0,1,−1 | H(e_j)=T_j; inverse returns e_j; H(e₀)=T₀=1 | Odd-orbit normalization made explicit |
| §2.3 cyclic image/freeness | n=0,1,2 | Ranks 1,2,4; n=1 algebra basis {1,T} over C[T²,T⁻²]; e₁ not an even shift | Full transform does not collapse to cyclic image |
| §3.1 cyclic coordinates/characters | r=0,1,2 | Quotient sizes 1,2,4; ζ=(ε,1) gives κ_{1}=1 and κ_{2}=−1 | Imported torsor; complementary character coordinates fixed |
| §3.2 raw generalized integral | Unramified rank-one shells OF×,πOF×,OF | Values 1,−1,1/(1+1)=1/2 | No averaging hidden in definition |
| §3.2 equivariance/reference scaling | Scalar π in a surviving vector coordinate | η(π)=−1 multiplies raw lattice germ 1/2 to −1/2; scaling twice returns 1/2 | Explicit surviving-coordinate character law |
| §3.2 ramified scope | Ramified η on OF× | Integral of η over OF× is 0; the shell value 1 is only an unramified specialization | Widened theorem without widening its unit Check falsely |
| §3.3 inversion, r=0,1,2,3 | All characters of C₂ʳ | H Hᵗ diagonals 1,2,4,8, off-diagonals 0; inverse coefficients 1,1/2,1/4,1/8 | G4 replaced by proof |
| §3.3 reference signs | v=1 and v=π,v*=π⁻¹ | First ωG=1·1/2; second (−1)(−1/2)=1/2; RHS (1/2)(1+κ·0) | Sign and finite coefficient agree |
| §3.4 additive Lie descent | a=b=1,m1=π,m2=1, φ=T10, q=2 | Additive integral 1; group unnormalized integral 2; normalized group √2, determinant twist 1/√2, product 1 | Additive Jacobian is required |
| §3.4 vector lattice and unit test | Integral matrix/lattice indicator; one vector coordinate π⁻¹ | Descended integral unit 1 at integral blocks; vector-lattice value 0 for the nonintegral coordinate | Vector support and absence of extra δ half fixed |
| §3.5 full reference versus truncation | a=b=1, v=(1,1), u=(1,0), u*=(0,1) | Reference cyclic determinant xb−xa≠0; u*u=0 and each block has exactly one surviving vector/covector | Distinct arguments prevent a contradictory cyclicity hypothesis |
| §3.5 ordered determinant | a=b=1,va=vb=1 | det[[1,xa],[1,xb]]=xb−xa=−D | General formula includes (−1)^(ab) |
| §3.5 ramified negative control | F=Q₃,E=Q₃(√3),xa=0,xb=1 | ω=η(1)=1; η(D)=η(−1)=−1; η(−D)=1 | Corrected proposed general identity; E14 |
| §3.5 Lie determinant and final factor | D=π, unramified | Jacobian q⁻¹, inverse q; reversed comparison multiplier η(π)q⁻¹=−q⁻¹ | No division by D=0: disjoint spectra required |
| §3.6 germ factors cancel | r_n=2,r_a=r_b=1 | 2⁻²=2⁻¹·2⁻¹=1/4 | No spurious factor 2 in endoscopy |
| §3.6 reference-only four-form test | Values (R,0,0,0) | Either displayed four-form sign convention gives R+0+0+0=R | E12 remains a source correction, not a prerequisite |
| §3.7 sum representation | A+B=A′+B′; C=A−A′ | Image difference W_GL C−W_U C=0 on intersection | Action is on sum before equality of images |
| §3.7 group law/uniqueness | g,h acting on A+B | W(g)W(h)(A+B)=W_GL(gh)A+W_U(gh)B=W(gh)(A+B) | Extension determined on generating subspaces |
| §3.7 trace pairing | u=w=w′=1 | Tr(2)=4=2+2; N(2)=4≠1+1=2 | Norm Fourier kernel excluded |
| §3.8 integral splitting | h(w,w)=1 | p(w)=w; p²=p; h(w,v−p(v))=0 | Unit denominator, no division by 2 |
| §3.8 unipotent support | q(a)=π,t∈π⁻¹OF; then q(a) unit | ψ(tπ)=1 throughout first case; some ψ(tq(a))≠1 in second | Defect support forces vanishing once all N(F) acts |
| §3.8 generation | Weyl element plus N(π⁻¹OF) | Diagonal π⁻¹,π scales N by π⁻²; union π^(-1-2j)OF=F | Works also q=2 |
| §4.1 sign comparison | N(c)=−1,X=1 or diag(1,π) | −N(c)=1; r_−(cX)=diag(1,π²)=r_+(X) | Norm lemma replaces false classification import |
| §4.1 ramified failure | E=Q₃(√3) | Unit norm residues are squares; −1 mod 3 is 2, a nonsquare | No ramified norm −1 unit claim |
| §4.2 spherical pushforward | Rank-one shells d=1,−1 | r_!T_d=e_(2d), respectively e₂,e₋₂; value on odd valuation is 0 | Haar coefficient 1 and doubled valuation |
| §4.3 product contraction | Φ=1_Km⊗φ; vol Km=1 or 2 | Integrals φ(g) and 2φ(g) respectively | Unit Haar normalization fixed |
| §4.3 rank-zero/factor | n=1,m=0; γ1=I | Contraction is φ; Ω=ω(γ2); ω in rank one is η(1)=1 | No missing rank shift or volume |
| §4.4 adjacent-rank theorem | n=1,φ=T_d; valuation 2d versus odd | Both sides 1 on π^(2d)OF×, both 0 on odd shells | Product theorem remains explicit supplier gap |
| §4.4 nonreference clause | Nonreference form test | Target function 0, hence every target orbital value 0 | Kept separately from reference matching |
| §4.5 augmented theorem | Rank-one unramified integral unit; φ=T₁ | Reference regular unit value 1; singular raw germ 1/2; shifted matrix grade 2 | Distinguishes augmented theorem from raw germ equality |
| §4.6 cyclic endoscopy | Unit; n=2,φ=c_(2,1) | Target e₀⊗e₀; respectively e₂⊗e₀+e₀⊗e₂ | Nonreference/odd module not inferred |
| §4.7 compact grades | n=1,d=−1,0,1,2 | Grades 0,e₀,0,e₂; total Φ has value 1 at every π^(2j),j≥0 | Compact grade, noncompact total |
| §4.7 density adapter/denominator | n=1,q=2, standard lattice and Gram π | Raw reference density 3/2, normalized count (3/2)/(3/2)=1; odd Gram density/count 0 | No invented GN m0 export; positive normalization |
| §4.7 self-dual-overlattice count | Rank-one Gram π^(2j),j≥0; Gram π | Unique self-dual overlattice at index π^j; no self-dual overlattice in odd valuation | Count fixes coefficient, not arbitrary rescaling |
| §4.8 Satake degree identity | n=2,d=1; d=0; a=b=1,d=2 | q(Z1+Z2)↦X+Y; units 1↦1⊗1; degree two X²+XY+Y² | Complete homogeneous polynomial, not elementary one |
| §4.8 exponents and finite splitting | da+db=d | d(n−1)−b da−a db=da(a−1)+db(b−1) | Correct twists in every degree |
| §4.9 grade equivalence | (da,db)=(2,4); odd/negative total | Only total grade 6 contributes; invalid totals give 0=0 | No exchange of an infinite sum and integral |
| §4.10 unit theorem all form pairs | a=b=1; q=2,x−y=π | Target functions (1_End⊗1_End,0,0,0); factor −1/2; (ε,ε) still gets 0 | Full all-form and dyadic statement retained |
| §5.1 Fourier-defined extension | Unit; c_(2,1)e₀; central πI | Outputs e₀⊗e₀; e₂⊗e₀+e₀⊗e₂; central scale q⁻² at a=b=1 | Precisely defined algebra operator |
| §5.1 intertwining and full module | f=H_n⁻¹(T10), not cyclic | (H_a⊗H_b)ξ_X(f)=ξ_F(T10); unit/product identities are conjugates of ξ_F’s | No unsupported orbital characterization |
| Hermitian field classification gap | n=0,1; split algebra | Classes 1 in rank zero; 2 norm classes in positive field rank; 1 split class | Gap retained at all dyadic/ramified scope |
| Integral orbit classification gap | Rank-one Gram 1,π,π⁻¹ | Valuations 0,1,−1; dual quotient length for Gram π is 1; only unit Gram is self-dual | Gap retained, no good-prime restriction |
| Unit-vector transitivity gap | n=1, norm-one w; w=0 | Multiplication by w⁻¹ sends w to 1; zero has norm 0≠1 | Exact orbit and exclusion; gap retained |
| E01/E02 object and symbol types | V rank 1; ξ(Ia,Ib), η(π) | Centralizer rank 1; ξ sends identity blocks to I_n while η(π)=−1 is scalar | U(V) and embedding ξ retained |
| E03 reduction locator | n=2,d=1 | Φ_(2,2) maps to e₂⊗e₀+e₀⊗e₂, the Proposition 3.12 reduction | Correct theorem reference |
| E04 Hermitian invariants | y=2,w norm 1,i=1 | h(w,yw)=2; substituting unrelated x=0 would give 0 | Correct variable y |
| E05 Hermitian embedding | y=2,w=1 | Block [[2,1],[1,0]] has trace 2; replacing y by unrelated 0 gives trace 0 | Correct upper-left entry |
| E07 zero evaluation | n=1,φ=T₁,y=π²,w=0 | (φ*e₀)(y)=1, whereas φ(y)=0 | Correct upper augmented test |
| E08–E11, E13–E14 | Pairing, q=2, rank-one germ, sum ambiguity, ordered determinant | Respectively 4=2+2; BC odd coefficient −1; germ 1/2; ambiguity 0; determinant −D | Witnesses retained in their consuming sections |
| E12 general sign boundary | Reference/reference spherical family | Nonreference three contributions are 0; sum R on either convention | General conversion not claimed |

## Verification outcomes

Required dependency check, after the edits, exit 0:

```text
candidate: EndoscopicTransferAndUnitaryTraceComparisonPartII is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 52 roadmaps, 583 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The check uses the configured design-first gate, this package’s design README and `merge-order/ORDER.txt`; no order file was changed.

The source check, after completing Hironaka’s missing bibliographic fields, exit 0:

```text
packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml: 0 problem(s)
```

The earlier source-check failure reported exactly three missing Hironaka fields, authors/title/year; those are now populated from the publisher scan. The earlier unclassified publisher fetch is resolved, and no missing text remains. No gate failures were supplied separately in the brief.

Citation resolution, exit 0, against main e98875d and the 363 supplied open heads: no cross-roadmap citations found nowhere; no Lean names found nowhere. Its absence of local pinned Lake packages is not used as proof of a pinned declaration: the cited declarations were separately opened at the manifest pins through GitHub.

The structural audit, exit 0: 36 unique targets, seven complete supplier gaps with exactly their direct consumers, acyclic target graph, six Examples/Dependencies endings, at least three Checks per target, five unique certified source records, no mathematical TeX/process residue, and no machine paths in edited content. Explicit finite-character-table calculations in ranks 0–3 gave diagonal products 1,2,4,8, all off-diagonal entries zero. The initial notation audit also caught a quotient backslash immediately followed by a parenthesis; it was rewritten as words to avoid a TeX delimiter.

`git diff --check`: exit 0, no output.

Lean signature/binder comparison and elaboration: not applicable. This design has zero Lean declarations and no Suggested.lean; the permitted edits do not include creating one. The acceptance specification contains zero declarations and states the four missing-carrier headlines. No Lean process was started, and no build success is claimed.

## Ownership, source audit and maintainer consequences

Ownership was checked by object with the supplied roadmaps grep/show service over main e98875d and all 363 indexed open heads, including the named siblings, and with read-only searches in board packages. Searches covered Friedberg–Jacquet, Jacquet–Rallis, Igusa’s criterion, generalized nilpotent integrals, Hermitian classification/diagonalization and transitivity. The ordinary endoscopic, lattice, density, Haar, Satake and Weil owners were read by their actual sections. Two main-branch roadmaps were read for shape: `TauCetiRoadmap/LocalGaloisGroups/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md`. No new owner of this symmetric-space contraction/module/germ reduction was found. The split invariant-ring proof and the local determinant comparison belong here because they concern these particular representations and retain the full general statement; they do not duplicate an assigned generic foundational theorem.

The seven supplier gaps remain outstanding. Four are on EndoscopicTransferAndUnitaryTraceComparison: local Jacquet–Rallis comparison, orbital Weil descent, independent product-group spherical base change, and the all-quadratic ordinary factor formula. Three are on GeometryOfNumbersAndQuadraticArithmetic: field classification at dyadic places, unramified integral congruence classes, and unit-vector transitivity. F01/F03/F04’s external portions therefore require a maintainer/supplier decision and are not represented as closed by this repair. GanGrossPrasadUnitaryGroups’ broader continuation contracts are not silently promised by this package. The independent product-group input must remain earlier than the FJ theorem and independent of it.

Pinned files read include the eight original Mathlib declarations in ConjTranspose, Hermitian, Charpoly/Basic, Symmetric/Defs and MvPolynomial/Monad, the implicit-function file at line 464, the Tau Ceti unramified norm file at lines 126 and 158, and its arithmetic Hecke-ring file at lines 13–31. Native matrix Hermitian means only Aᴴ=A; it provides no local-field form classification, orbital measure or endoscopic data. No headline can be made statable merely by wrapping arbitrary functions or scalars in a predicate.

The legally read sources are identified by their five manifest keys. Central evidence: Leslie25 line 510–575, line 642–671, line 766–798, line 873, line 1119–1180, line 1197–1244, line 1400–1455, line 1715–1757, line 1830–1914; Leslie19 line 697 and line 1338–1393; Xiao18 line 108–116, line 196–203, line 914–945, line 1015–1028 and line 1181–1187; BP21 line 137–216 and Proposition 1, p. 7; Hironaka99 line 469–470 and line 697–712. The published Annals/Duke pagination is not claimed to agree with the arXiv pagination.

No existing Lean declaration name changed. Graph targets retired under F02: FJ.1/contraction-independence, FJ.5/full-smooth-transfer and FJ.5/full-spherical-transfer-factors, each with no consumers. Added graph targets: FJ.0/fibre-integration (§0.6) and FJ.3/factor-descent-comparison (§3.5). Other FJ target identifiers remain stable even where numbered README subsections changed. All 14 direct-consumer lists were recomputed; no external consumer was rewritten. The original route records and separate-continuation proposal remain data in plan.restructure.
