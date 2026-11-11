<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6783349155 -->
Review (codex) of 297b5dc

Verdict: needs_changes

1. **F01** (P1) Raw compact-open volume does not normalize geometric trace

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:548,554,559–564: “multiplied by `vol(K₁)/vol(K₂)`”; “does not depend on the levels”.

   **Claim:** The degree of every sufficiently small Shimura level cover equals its compact-open index, so this Haar ratio makes geometric trace independent of levels.

   **Witness:** For `T=Res_{ℚ(√2)/ℚ} G_m` with trivial datum, principal levels `K(9)⊂K(3)` have index `9`, but their Shimura sets have `3` and `1` points. Normalized pull-push is `3/9=1/3`, not `1`.

   Take the identity morphism of this datum, with trivial coefficients. It is an abelian-type compact zero-dimensional example, with rational weight and reflex field `ℚ`; all the added surjectivity hypotheses hold. Neatness does not remove the infinite central-unit stabilizer. The unit calculation and arbitrarily small variants are recorded below.

   The relevant supplier already distinguishes the effective tower: #933, `TauCetiRoadmap/ShimuraVarieties/README.md`:1180, §4.3, uses `T(𝔸_f)/closure(T(ℚ))`. The groupoid trace of #871, `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md`:2987, §ALS.3.6, is not a license to replace the degree of a coarse Shimura-variety cover by `[K₂:K₁]`. IP23 Remark 2.2, IP23 line 735, has the same overly general normalization.

   **Exact repair:** Normalize geometric traces using the effective adelic action, with compatible Haar measures after quotienting by the closure of the trivially acting rational centre. State and prove the degree/measure compatibility. For neat `K₁⊂K₂` in one group the degree is `[K₂:(K₂∩Z(G)(ℚ))K₁]`, not necessarily `[K₂:K₁]`. Use this effective degree in both Checks and propagate the corrected normalization to §§7.3 and 10.3. Equivalently construct compatible degree-normalized geometric traces and identify their effective measures. Preserve the general central-quotient statement; do not exclude real central units. On the witness the effective index is `3`, so the corrected pull-push is `3·(1/3)=1` at both levels.

2. **F02** (P2) Rank-zero Hermitian volume still needs an involution

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:678–680,687,696: “a ring endomorphism `σ`”; “Hermitian when `H` is”; “the volume lies in the fixed field”.

   **Claim:** Hermitian symmetry of the original form alone makes the determinant pairing Hermitian and its volume fixed, in every dimension.

   **Witness:** Set `E=ℚ(t)`, `σ(t)=t²`, `U=0`, `H=0`, and `d_U(a)=ta` on `⋀⁰U=E`. Then `H` is Hermitian, but `vol=t⁻³` and `σ(vol)=t⁻⁶`.

   The induced form is `h(a,b)=σ(a)b`: the empty Gram determinant is `1`. Consequently `h(1,t)=t`, whereas `σ(h(t,1))=t⁴`. The layer's assertion that a **nonzero** Hermitian form forces an involution does not apply to `H=0` on the zero space.

   **Exact repair:** Assume `σ²=id` in the Hermitian conclusions of §1.1, including the induced Hermitian pairing, fixed-field value and discriminant assertion. Keep the general sesquilinear determinant and inverse-rescaling formulas. Add the displayed rank-zero negative control. With `σ=id` the same trivialization gives volume `t⁻²`, fixed as required; with a quadratic involution the denominator is a norm and is fixed. Do not narrow the four-dimensional Lean statements, which handle the zero form correctly.

3. **F03** (P2) The cited supplier assumes the exact rational model it is said to provide

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:602–603: “The `L`-model ... is supplied by GL2AutomorphicRepresentationsAndTransfer §R17.3.8.” Here `L=ℚ(π)` is fixed by §0.1.

   **Claim:** The cited section constructs the finite-part model of the quaternionic transfer over this exact field, permitting the `L`-rational multiplicity realization.

   **Witness:** At #931, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md`:1780, §R17.3.8 assumes both `L`-models for its comparison and explicitly permits a finite extension to obtain them. Equality of rationality fields is explicitly insufficient.

   Section R17.3.7 supplies equality of rationality fields, not descent. The general reductive statement in #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`:870, §5.7, likewise gives a finite extension; its exact-field conclusion is for `GL_n`. IP23 line 823 asserts the additional exact-field model in the special quaternionic situation. An assertion in the paper is not an owned supplier target.

   **Exact repair:** Declare a precise additional gap, with matching README and plan slug, owned by GL2AutomorphicRepresentationsAndTransfer §R17.3.8: for the totally real, even cohomological weight, trivial-central-character JL data of §0.1, construct the quaternionic finite-part model over `ℚ(π)` and its compatible Hecke models at finite levels. Alternatively state and supply this special descent adapter here from named inputs. Cite the resulting contract at §0.5 and carry it into the endpoint dependencies. Do not enlarge the endpoint's coefficient field. The repaired contract must provide the model already when `L=ℚ(π)`, rather than merely compare two models after assuming their existence. Also cite §R17.3.6 for the multiplicity-one input used to compute rank `2^d`.

4. **F04** (P3) The compact empty-sum Check fails in dimension zero

   **Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:1245: “The compact formula with `p = 0` is not the empty-sum case of the first formula: that sum is zero.”

   **Claim:** Substituting `p=0` in the noncompact combinatorial sum always gives zero.

   **Witness:** At `p=q=ℓ=0`, both indexing sets of zero-tuples are singletons. The empty products and wedge equal `1`; the formal sum and the compact degree-zero vector both equal `1`, not `0`.

   **Exact repair:** Say that the first sum at `p=0` vanishes when `q+ℓ>0`, and explicitly record value `1` for `q=ℓ=0`. Retain zero-dimensional quadratic spaces. The corrected Check gives `0` at `(p,q,ℓ)=(0,6,0)` and `1` at `(0,0,0)`.

Four findings: one P1, two P2 and one P3. The three Lean theorems elaborate and none is padding. The remaining defects concern the normalization of geometric trace, the rank-zero Hermitian construction, an exact-field rational-model prerequisite, and a boundary Check. No package input was edited.

The previous review was checked first, finding by finding. The repair report marks none “not actionable in this package”. The following are checks of the repairs, not assumptions that the repair report is correct.

| Previous finding | Status and repaired passage in `packages/HodgeClassesForJacquetLanglands/README.md` | Verification |
| --- | --- | --- |
| R01, source-following organization | **Repaired.** Summary: “attached to one cuspidal representation of `GL₂(𝔸_F)`.” | The source-following phrase is gone. Exterior algebra → group diagram → local coefficients → theta cohomology → descent is supported by the individual Needs lines. |
| R02, arbitrary coefficient purity | **Repaired.** §0.2: “whose summand ... is pure of weight `i + w`”. | For the CM torus and `1⊕Norm`, the degree-zero weights remain `0,−2`; the text now takes their direct sum. The added rational-weight hypothesis supplies rational summands. The definite-group Check specifies trivial coefficients. |
| R03, central kernel without surjectivity | **Repaired.** §0.3: “surjective as a morphism of algebraic groups with central kernel”. | The diagonal of a curve into its square has dimensions `1→2` and is excluded from finite étale pushforward. The surviving Haar normalization has a different defect, R01 below. |
| R04, Hermitian volume without symmetry | **Partly repaired.** §1.1: “Hermitian when `H` is”; “If `H` is Hermitian, the volume lies in the fixed field”. | The new `diag(i,1,1,1)` Check correctly gives `i` versus `−i`. But rank zero does not force the endomorphism to be involutive: R02 below. The four-dimensional Lean signatures remain correct. |
| R05, degenerate quaternionic freeness | **Repaired.** §1.6: “is nondegenerate Hermitian”; “`J = vol(H, d_U)` lies in `F^×`”. | Order-two involution and characteristic zero are explicit. The zero form gives right-`j` ranks `0` versus `3`, and is excluded. Unit diagonal gives `J=1` and a split quaternion algebra. The global field case is followed by split étale localizations in §3.1; generality of the endpoints is preserved. |
| R06, compact Schwartz sign | **Repaired.** §4.6: “The two factors `(−1)^ℓ` cancel.” | At `x=e₁`, degrees `0,1,2` all give `+exp(−π)`. Negative Fock coordinates and the negative coefficient pairing each supply `(-1)^ℓ`. No restriction to even degree was introduced. |
| R07, zero vectors in nonvanishing | **Repaired.** §7.10: “be a nonzero pure tensor”; “whose local factors are all nonzero”. | §§7.4–7.5 carry the same data. A zero local factor gives pairing `0` and is explicitly excluded; the common finite tensor is retained across real signs. |
| R08, unidentified finite factors | **Repaired.** §10.9: “Every subscript is the multiplicity space of §0.2”. | For `d=1` and finite invariant ranks `2,1`, the assertion is now `2≃2`; no `4≃2` full-summand isomorphism is claimed. Finite-level representatives use chosen vectors. |
| R09, splitting comparison at `d=0` | **Repaired, by a different valid route.** §6.2: “No condition on `Σ` is imposed and no comparison of splittings is used”; §10.7: “For `d = 0` the realizations are rank-one of type `(0,0)`”. | The Periods-I lift is covered by the revised declared Shimizu contract. The splitting comparison and theta nonvanishing route explicitly require `d≥1`. The `d=0` Hodge theorem uses rank one; constant canonical models give trivial Galois action. Both endpoint theorems still include `d=0`. The previous proposed norm-support shortcut does not suffice on the full isometry subgroup, so it was not required again. |

## Verified sound

All 75 numbered targets, their API bullets, Checks and Needs lines were read. The changed passages were tested again, including the new weight hypothesis, the nonzero-vector clauses, the quaternionic assumptions, the compact sign, the finite-level interpretation and both branches of the `d=0` repair. The same patterns were searched elsewhere in the package. For unchanged mathematics, reliance on round 2 was limited to its explicit computed rows, not its prose assurances. The table below gives the required fresh sample, headline and finding evidence; it is not a claim to have formally proved the proposed library.

There are 11 numbered layers, all ending in Examples and Dependencies. Each of the 75 targets has a Needs line and at least three Checks; definitions retain prose API lists. Main-branch shape was compared with ClassFieldTheory, ComplexKahlerGeometry and RepresentationTheory. No route-specific prime restriction, re-planning of a main roadmap, compulsory source chapter order, copied source passage, algorithmic procedure, forbidden supplier, process path, sorry'd data, `set_option`, or prohibited import was found. This package owns the exterior/exceptional adapters, the explicit harmonic restrictions and the JL correspondence; it imports their general foundations. The four own Lean names resolve in Suggested.lean. Supplier names in backticks are supplier plans, not claims that this package declares them.

### Seeded source verification

The manifest contains one work, IP23, the legally cached publisher-open published text. Its version note distinguishes the preprint numbering. No author locator is marked unverified; all 15 seeded targets were readable, so no source fetch or missing-reference request was needed. The numbers below are printed pages and extraction line numbers, not PDF viewer indices.

| Sampled target | Locator checked | Support and limitations |
| --- | --- | --- |
| 0.1 Jacquet–Langlands Hodge data | §3.1–3.3, pp.17–20; IP23 lines 740–856; §2.2, pp.15–17, lines 648–706 | Totally real field, common real splitting, even weights, central norm normalization, reflex field and multiplicity convention agree. The package's explicit constant model at `d=0` supplies that boundary. Exact-field model ownership is R03. |
| 0.4 division reduction | §4.1 pp.20–21, lines 865–896; §10.1 p.65, lines 2806–2832; §12.2.1 p.94, lines 4306–4314 | Brauer product and same real ramification agree. Full ramification/embedding classification is correctly a ClassFieldTheory gap, not claimed to be proved in §12.2.1. |
| 0.6 archimedean sign lines | §3.3 p.19, lines 832–856; Proposition 12.3 p.98, lines 4513–4523, with the coefficient/Matsushima conventions in §2.2 | The `2^d` multiplicity and all sign pairings match. Actual Hodge degrees include the coefficient shift, so they are not just cochain `(1,0),(0,1)`. |
| 2.2 two-plane decomposition | §5.3.1 p.32, lines 1315–1338 | `1+4+1=6`, preservation under `L`, and rank-two plus rank-one quaternionic splitting agree. |
| 2.4 projective block isomorphism | Proposition 5.11, (5.13), p.32, lines 1341–1348; pp.35–36, lines 1475–1480 | Equal multipliers, scalar quotient and the factor `Nrd(b₁)α₁⁻¹α₂` agree. |
| 2.5 quaternionic block groups | Proposition 5.13, pp.34–35, lines 1401–1436 | Identity component, reduced-norm multiplier and the other rank-one normalizer component are distinguished. |
| 2.8 exceptional group diagram | §4.1 pp.21–23, lines 883–985 | Arrows, diagonal versus anti-diagonal scalars, norm formula and quotients agree. The rank-one group subscript in the printed diagram is a misprint. |
| 3.3 real exceptional torus map | Lemma 6.2 p.44, lines 1862–1888 | Compact-circle factors and the negative-similitude component agree, including the diagonal central quotient. |
| 4.4 harmonic restriction | §8.5, (8.3), pp.52–54, lines 2220–2239 and 2296–2304 | The composite includes harmonic projection. Raw restriction alone does not preserve the harmonic kernel. |
| 4.6 compact Schwartz restriction | Proposition 8.2 p.55, lines 2335–2346, checked against §§8.2–8.4, lines 2103–2119,2164–2168,2203–2215 | The repaired formula correctly cancels the two negative-signature signs; it corrects the printed proposition rather than copying its error. |
| 7.5 simultaneous sign theta vectors | §10.6 and Lemma 10.3, pp.73–75, lines 3234–3360 | Nonzero pure tensors, common finite factors, discrete-series signs and the nonzero gamma factors agree. |
| 8.7 coefficient/cochain Hodge weights | Proof of Proposition 11.6, pp.88–90, lines 4044–4116 | Both middle Kostant rows are included; the shift `(2−k_v,2−k_v)` is applied to both coordinates. |
| 9.2 degree-`2d` Kottwitz hypothesis | Proposition 11.9 p.90, lines 4129–4132; computation pp.92–93, lines 4243–4286 | Conditional degree is `2d`, lowest line is `ℚ_ℓ(−d)`, and the twist `(d)` kills it. No semisimplicity conclusion is substituted for unipotent triviality. |
| 9.3 de Rham additive characters | Remark 11.10 p.90, lines 4133–4148 | `H¹_g(K,ℚ_ℓ)=H¹_ur(K,ℚ_ℓ)` is the local assertion used. De Rham, rational coefficients and finite local field are retained. |
| 10.1 auxiliary Hilbert representation | §12.2.4 pp.96–97, lines 4451–4461 | Odd auxiliary weight and contragredient archimedean signs match the prescribed real theta factors and norm-subgroup restriction contract. |

### Computed adversarial table

“Pass” means the stated test agrees; it does not certify an unresolved supplier contract. Inputs outside a stated characteristic, dimension or nondegeneracy hypothesis are recorded as excluded, not silently substituted into the theorem.

| Statement | Instances | Computed values on each side / wrong model | Result; change |
| --- | --- | --- | --- |
| 0.1 coefficient normalization | Scalar `t`, `k=4`; `k=2` | `t⁻² Sym²(t)=1`; `Sym⁰(t)=1`; untwisted `k=4` gives `t²` | Pass. |
| 0.2 repaired weights | CM torus, `1⊕Norm`, degree zero | Two types `(0,0),(−1,−1)`, weights `0,−2`; respective formulas `0+0,0−2` | Pass; no false single weight. |
| 0.2 componentwise comparison | Two conjugate components | Induced rank `1+1=2`, versus rank `1` if one component is forgotten | Pass. |
| 0.3 normalization | Real-quadratic torus, levels `9→3` | Compact index `9`, geometric degree `3`, raw Haar-normalized pull-push `1/3≠1`; effective degree normalization `3/3=1` | R01. |
| 0.3 repaired surjectivity | Diagonal compact curve; identity map | Tangent dimensions `1→2` versus `1→1` | Diagonal excluded; identity still exposes R01. |
| 0.4 division reduction | Ramification `{∞₂,𝔭}` and `{∞₂,𝔮}` | Product ramifies at `{𝔭,𝔮}`; same algebra gives empty set and Brauer class `0` | Pass; division used only for distinct classes. |
| 0.5 multiplicity | `d=0,1,2`; finite rank `3` | Multiplicity dimensions `1,2,4`; full dimensions `3,6,12` | Rank convention passes; R03 concerns the rational model. |
| 0.5 rational-model inference | Supplier’s `Q₈` descent negative control, not an automorphic counterexample | Two-dimensional complex character values `2,−2,0` lie in `ℚ`; matrices `diag(i,−i)` and `[[0,1],[−1,0]]` give a model over `ℚ(i)` of degree `2`, but the rational quaternion division algebra forbids a two-dimensional `ℚ`-model | Rationality field does not imply definition field. R03 requires the special JL descent theorem. |
| 0.6 sign types | Split weights `(2,4)` | `(3,−1),(0,2),(2,0),(−1,3)`; each total `2`; opposite signs exchange coordinates | Pass. |
| 0.7 correspondence direction | Curve symplectic basis `e,f`, trace `e∪f=1` | Class `f⊗e−e⊗f` sends `e↦e,f↦f`; Hom weight `1+1−2=0` | Pass; cup order/sign distinguished. |
| 1.1 Hermitian determinant form | `U=0`, `σ(t)=t²`, `d(a)=ta` | `vol=t⁻³`, `σvol=t⁻⁶`; `h(1,t)=t`, `σh(t,1)=t⁴` | R02; involution hypothesis repairs both. |
| 1.1 repaired non-Hermitian exclusion | `diag(i,1,1,1)` over `ℚ(i)` | Volume `i`, conjugate `−i`; Hermitian condition fails | Pass for the positive-rank repair. |
| 1.1 scaling and denominator | `diag(1,2,1,−5)`, top coordinate `−1,−2` | `−10/1=−10`, `−10/4=−5/2`; wrong direct-norm scaling gives `−40` | Pass; top trivialization ensures coordinate nonzero. |
| 1.3 exterior existence/uniqueness | Unit diagonal and zero form, dimension four | `L(e₁₂)=−e₃₄` gives wedge value `1=det I₂`; zero operator gives `0≠1`. For zero form all six wedge-dual coefficients are `0` | Pass; defining law determines the operator. |
| 1.4 square headline | Diagonal `(1,2,1,−5)` | Images of `e₁₂,e₁₃,e₁₄,e₂₃,e₂₄,e₃₄`: `−2e₃₄,e₂₄,5e₂₃,−2e₁₄,−10e₁₃,5e₁₂`; every square is `−10e_I` | Pass. |
| 1.4 small characteristic / degenerate form | Hyperbolic form over `𝔽₂`; rank-two diagonal | In characteristic two `L²=id`, `det=1`; in rank two `L²=0`, `det=0` | Pass; Lean is not narrowed to characteristic zero. |
| 1.4 noninvolutive endomorphism | Nonzero Hermitian value `h`; zero form | Symmetry twice gives `(σ²(a)−a)h=0`; if `σ²≠id`, all values vanish and `L²=0=det H` | Pass in dimension four, unlike rank-zero 1.1. |
| 1.5–1.6 repaired assumptions | `H=0`; unit diagonal | Right-`j` ranks `0` versus `3` for the square-zero free symbol module; unit diagonal has `J=1`, invertible `L` | Degenerate quaternionic freeness now excluded. |
| 1.7 similitude headline | Scalar `2+i`, multiplier `5` | `det=−7+24i`, norm `625=5⁴`; wedge scalar `3+4i`; `25/det=(-7−24i)/25`, product `3−4i` | Pass, matching conjugate semilinearity. |
| 1.7 zero form | Invertible `g`, arbitrary multiplier including `0` | Both sides `0`; denominator `det g≠0` | Pass. |
| 1.8 exceptional projectivization | `g↦gα`, correction `β↦βα⁻²`; `β↦2β` | Exterior scalar `α²` cancels `α⁻²`; latter ambiguity is scalar `2∈F×`; central `−1` acts as `+1` | Pass; kernel `μ₂`, not pointwise bijectivity. |
| 2.2 exterior blocks | Two planes | Dimensions `1+4+1=6`; quaternionic dimensions `2+1=3` | Pass. |
| 2.4 projective block map | `Nrd b₁=8, α₁=2, α₂=4`, common multiplier `2` | Image scalar `8·(1/2)·4=16`; determinant form `(8/4)·2·4=16`; anti-diagonal `(2,1/2)` acts as `1` | Pass; diagonal scalar would act as `4`. |
| 2.5 block groups | Scalar pair `(2,1/2)`; `α=2+i`; rank-one `j` | Product multiplier `4·1/4=1`; `Nα=5`, versus `α²=3+4i`; `jij⁻¹=−i` | Pass; nonidentity component detected. |
| 2.8 diagram | Equal-multiplier/special block dimensions; scalar `−1` | `5+5−1−1=8=7+2−1`; exterior of `−1` is `1` and quotient kernel has length `2` | Pass with characteristic-zero group hypotheses. |
| 3.3 real torus map | Inputs `(1,1,1,−1)` and `(1,1,i,i)` | Images `(-1,-1,-1)` and `(1,1,−1)` respectively | Pass; component and central quotient distinguished. |
| 4.1 pairing and projection | Positive degree-two plane | `⟨v²,w²⟩=2⟨v,w⟩²`; contraction `e₁²−e₂²↦0`, `e₁²↦1` | Pass; factorial not normalized away. |
| 4.3 compact boundary | `(p,q,ℓ)=(0,0,0)` and `(0,6,0)` in first formal sum | Empty-tuple sum `1` and empty-index sum `0`, respectively | R04. |
| 4.4 harmonic restriction | `e₃²−e₄²`; `e₁²` in signature `(2,2)` | First restricts to `0`; projected second is `e₁²−(e₁²+e₂²−e₅²−e₆²)/4`, contraction `1−4/4=0` | Pass; raw second restriction has contraction `1`. |
| 4.5 restriction headline | `x=2e₁`, `ℓ=0,2` | Polynomial factors `w²,w⁴` give `4,16`; wrong compact exponents give `1,4` | Pass with the stated differential-form factor. |
| 4.6 repaired compact headline | `x=e₁`, `ℓ=0,1,2` | `(-1)^ℓ(-1)^ℓ exp(−π)=exp(−π)` in every case | Pass; printed extra sign fails at `ℓ=1`. |
| 6.2 repaired splitting scope | `Ram B₁={∞,2}`, `Ram B₂={∞,3}` | `d=0`, product ramification `{2,3}`; Periods-I construction applies, full splitting-comparison threshold `d≥1` does not | Pass via declared lift contract; no false comparison. |
| 6.3 residue normalization | `q=2,s=3/2` | Levi exponent `4`; `a=−16/7`, `b=262144/240975`, `b/a=−16384/34425`; global pole factor `ζ^S(1)` | Pass under declared quaternionic residue contract. |
| 6.5 near-equivalence headline | Unramified determinant-one parameter | Dual swaps `(a,a⁻¹)` to `(a⁻¹,a)`, same unordered pair | Pass; conjugate is accounted for. |
| 7.5 simultaneous vectors | `k=2,4`, split and compact gamma factors | Split constants `−1/(16π²),3/(64π⁴)`; compact constants `1/(8π),−1/(32π³)`. Both signs give the same nonzero values since exponents are even | Pass for nonzero local tensors. |
| 7.10 nonvanishing headline | One zero factor; all nonzero sign factors, `n=2,d=1` | Zero factor gives pairing `0`; source sign choices number `4`, multiplicity dimension `2` | Zero input now excluded; different counts intentional. |
| 8.7 six Hodge types | `k=4` | Before shift `(0,8),(3,3),(4,4),(4,4),(5,5),(8,0)`; after `(-2,-2)`: `(-2,6),(1,1),(2,2),(2,2),(3,3),(6,-2)` | Pass. |
| 8.8 purity headline | `d=0,1,2` | `(d,d)` twists to `(0,0)` by subtracting `(d,d)` | Pass; coefficient normalization has weight zero. |
| 9.2 Kottwitz lowest line | One factor; two factors | Determinant `|·|` times `|·|⁻²` is `|·|⁻¹`; tensor gives `|·|⁻²`; `ℚ_ℓ(−d)(d)=ℚ_ℓ` | Pass; arithmetic Frobenius and twist convention agree. |
| 9.3 de Rham additive character | Unramified `c(Frob)=1`; `c=log χ` | First has inertia `0`; second has value `log(4)≠0` on suitable `3`-adic inertia (`log(5)≠0` for `ℓ=2`) and nonzero Sen class | Pass; non-de-Rham countermodel excluded. |
| 9.4 geometric unipotent headline | Class group of order `m`; coefficients `ℚ_ℓ` versus `𝔽_ℓ`, `m=ℓ` | `mc=0` forces `c=0` over `ℚ_ℓ`; `c=1` survives over `𝔽_ℓ` | Pass; coefficient scope essential. |
| 10.1 auxiliary weight | Odd `r=3`, positive and negative real sign | Holomorphic versus dual weights `3,−3`; `k=2` with auxiliary weight `1` gives `2+1=3` | Pass; both signs retained. |
| 10.4–10.6 invertibility/descent | `diag(2,3)` versus `diag(2,0)`; polynomial `iX` | Determinants `6` and `0`; `P(1)=i≠0`, but conjugate average of scalar `i` is `0` | Pass; all sign lines and polynomial descent are required. |
| 10.7 Hodge headline | `d=0` rank one; `d=1` diagonal `(2,3)` | Nonzero scalar gives rank-one isomorphism; weight-zero diagonal Hom has determinant `6` | Pass as endpoint, subject to R03's model contract. |
| 10.8 all-prime headline | `d=0`; general twist | Constant zero-dimensional model has Galois action `1` for each `ℓ`; lowest line `ℚ_ℓ(−d)(d)=1` for the same rational class | Pass; conditional route only needed for positive `d`. |
| 10.9 repaired weight-two headline | `d=1`, finite ranks `2,1`, all `k_v=2` | Multiplicity dimensions `2=2`; full dimensions `4≠2`; coefficient degree `k−2=0` | Pass; no identity between finite factors. |

For R01, the elementary unit computation is as follows. In `O=ℤ[√2]`, the fundamental unit is `ε=1+√2` and the class number is `1` (Minkowski bound `√8/2<2`). The residue-unit orders modulo `3` and `9` are `8` and `72`. The image of `O×` has orders `8` and `24`: `ε⁴=17+12√2`, `ε⁸=577+408√2≡1+3√2 mod 9`, and `ε¹²≡−1 mod 9`. Thus the double quotients have sizes `8/8=1` and `72/24=3`. The compact-open index is `72/8=9`. Central units contribute the missing factor `3`. At successive conductor levels `3^a,3^(a+1)` the compact index stays `9`, the unit-image index stays `3`, and the geometric degree stays `3`; this persists at arbitrarily small neat levels. This computes an actual failure, not just a possible stabilizer objection.

### Pins, elaboration, signatures and padding

Pins inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Library near-matches were used as leads and opened at these pins. In the following table paths start at the respective pinned library root.

| Opened declarations | File and line | Comparison with this package |
| --- | --- | --- |
| `wedge`, `wedgePairing`, `topVector`, `isUnit_apply_topVector`, perfectness | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean`:36,42,78,92,130 | Finite free wedge duality and unit top coordinate; no conjugate-linear exterior operator square law. |
| `pairingDual`, `pairingDual_ιMulti_ιMulti` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean`:64,73 | Native determinant pairing, including evaluation on pure wedges. |
| `map`, `map_apply_ιMulti`; bilinear exterior form | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`:260,273; `Mathlib/LinearAlgebra/ExteriorPower/BilinForm.lean`:34 | Functorial linear exterior map and bilinear form; the latter does not accept a general conjugate-linear first slot. |
| `exteriorPower.hodgeStar` | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean`:48,53 | A linear star for a bijective bilinear form on a finite free module. It does not cover degenerate forms or arbitrary `σ`, and its defining identity is not one of the three proposed theorem statements. |
| `map_exteriorPower_finrank_eq_det_smul`, `exteriorPowerTopEquiv` | `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`:157,174 | Determinant action and real-bodied basis trivialization; correct names and nonzero top value. |
| `MvPolynomial.funext`; `H1ofAutOnUnitsUnique` | `Mathlib/Algebra/MvPolynomial/Funext.lean`:83; `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`:107 | Infinite integral-domain polynomial identity and multiplicative Hilbert 90. Number fields/quadratic fields meet the needed hypotheses. |
| `SchwartzMap`; `Complex.Gamma` | `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean`:75; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`:287 | Smooth rapid-decay functions and gamma function, not Weil/Fock cochains. |
| `HodgeStructureOn`, `tateTwist`, `internalHom` | `TauCeti/Geometry/Hodge/Structure.lean`:62; `TauCeti/Geometry/Hodge/Tate/Twist.lean`:63; `TauCeti/Geometry/Hodge/InternalHom/Basic.lean`:271 | Opposed filtration at weight `n`; twist weight `n−2m`; Hom weight `n₂−n₁`. A commuting coefficient-field action is additional data. |
| `rescaleJEquiv`, `normMulEquiv` | `TauCeti/Algebra/Quaternion/SymbolEquiv.lean`:226,426 | Unit-parameter symbol equivalences, correctly imported. They do not make the square-zero symbol a central simple quaternion algebra. |
| `tensorAlgEquivTensorMatrix`, `quaternionClass_mul` | `TauCeti/Algebra/Quaternion/TensorProduct.lean`:192; `TauCeti/Algebra/Quaternion/BrauerClass.lean`:255 | Common-slot algebra/Brauer identities already supplied; not replanned. |
| `symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`:57 | Native symmetric-power representation used by `τ_k`. |

The required `lake env lean` invocation on `packages/HodgeClassesForJacquetLanglands/Suggested.lean`, from the pinned content checkout and using the absolute argument required by the brief, exited **0**, with exactly three warnings: `declaration uses 'sorry'` at lines 70,81,95. There are no Tau Ceti imports to build. Nothing remains running.

A scratch copy with `#check @` for **all four declarations** elaborated. The three theorem types retain `Field`, `Module`, `FiniteDimensional`, `σ`, `H`, the top trivialization and `2+2=finrank`, as well as Hermitian symmetry or the similitude equation in the relevant theorem. The real-bodied predicate has no silently lost section hypothesis. The dimension equality excludes `finrank=0` junk and the zero module from these four-dimensional statements. No signature changed.

Every sorried theorem was probed with `simp [IsExteriorStar]`, `rfl` and `infer_instance` on a copy; no probe closed any of the three. The pinned near-matches supply components of proofs, not one library theorem usable by a single `exact` for the full target. Reading the defining equation also rules out a tautology: existence constructs a semilinear map, the square is an additional determinant identity, and equivariance relates it to an exterior action. None is a small-value Check or a boundary theorem. **Zero padding findings.**

| Headline from README | Disposition in Suggested.lean |
| --- | --- |
| Exterior existence/uniqueness, square and similitude, §§1.3,1.4,1.7 | All three are present on native carriers, with the same generality. |
| Exceptional isogeny and projective isomorphism, §§1.7–1.8 | Named in the module docstring; missing unitary similitude group schemes, their components and quotients. |
| Harmonic Schwartz restriction formulas, §§4.5–4.6 | Named; missing real Weil/Fock representation and harmonic coefficient cochains. |
| Near-equivalence rigidity and simultaneous nonvanishing, §§6.5,7.10 | Named; missing automorphic representation and global theta/cohomology carriers. |
| Rational theta eigenspace purity, §8.8 | Named; missing Shimura coefficient cohomology and Hodge decomposition. |
| Geometric unipotent triviality, §9.4 | Named; missing the number-field Galois-cohomology/de Rham interface needed for the assertion. |
| Rational Hodge class, conditional all-`ℓ` class and weight-two case, §§10.7–10.9 | Each named; missing Shimura varieties, compatible automorphic realizations, global transfer, and the conditional Kottwitz carrier. |

Object searches in the pins do not supply these geometric/automorphic constructions. Generic Hodge structures or Schwartz functions alone do not make the headline statable with a few simple definitions. No statable headline was found omitted; there is no free-predicate, matrix-only or scalar stand-in. The single `import Mathlib`, namespace, one module docstring and four declaration docstrings satisfy the required Lean form.

### Ownership, current suppliers and order

The board package index was read before absence conclusions. Main/open-head object searches were run through `roadmaps grep` and the supplied current heads were read through `roadmaps show`; pinned searches used the mathematical objects as well as names. The overlap data has no conflicting head, dropped cited ID or revision-only citation requiring a merge dependency. The closest scopes were inspected: #1063 MetaplecticAutomorphicForms, #1756 AutomorphicLFunctionsAndLocalFactorsPartII, #1736 ExceptionalThetaCorrespondencesForG2, #1404 GanGrossPrasadUnitaryGroups and #1038 ShimuraData. They own, respectively, general oscillator/theta inputs, general local factors, the different G₂ exceptional pairs, unitary Bessel periods, and datum/VHS foundations. None supplies a second owner of the three Lean targets or this JL Hodge correspondence. This package imports the shared theory; the rank-three quaternionic residue extension is explicitly contracted to its earlier owner.

All supplier paragraphs and every Needs line were read. Current resolutions are summarized below. The paths for each row are `TauCetiRoadmap/<Supplier>/README.md`, except the explicitly nested RepresentationTheory paths. These are roadmap contracts, not claims that the declarations are already compiled at the pins.

| Supplier | Sections resolved at main/current supplied head | Evidence or boundary |
| --- | --- | --- |
| ShimuraVarieties (#933) | 4.2,4.3,4.9,6.7,8.1,8.5–8.7 | Lines 1149,1178,1310,1897,2362,2476,2497. All planned names in the automated missing-name leads occur here. Closure of rational torus points matters in R01; §8.7's simply connected hypothesis is correctly avoided. |
| ShimuraData (#1038) | 3.1,3.3,3.10,4.3 | Lines 355,417,578,820. Rational weight is included in repaired §0.2. |
| ArithmeticLocallySymmetricSpaces (#871) | ALS.1.1,1.2,1.8,3.3,3.6,5b.1,5b.4 | Lines 2987 and 4383 distinguish groupoid trace and the comparison conditional on `FrankeInput`. Compact unconditional comparison remains a declared gap. |
| MotivesAndAlgebraicCycles (#1313) | 2.2,2.3,2.6,2.7,7.1,7.15 | Lines 354,371,1292,1581 include realizations and `HT`. Scalar extension of `HT` is only a map, not asserted surjective. |
| ComplexKahlerGeometry (main) | K6.0,K6.1 through former-numbering map | Twisted identities and constant-coefficient Hodge decomposition do not already provide the full VHS-cohomology contract. |
| ComplexComparisonPartII (#848); EtaleCohomologyFoundations (main) | C6; F.2.1,F.2.2,F.3 | Artin/adic comparison in C6; proper and smooth base change at lines 504,522 and finiteness at 676 of the latter. Coefficient invertibility holds in characteristic zero and after removing bad finite places. |
| GL2AutomorphicRepresentationsAndTransfer (#931) | R16.1.8,R16.4.4–4.5,R16.6.3,R17.3.1,3.5–3.8,R17.4.2,4.13,4.16 | Sections exist. R17.3.8 at line 1778 has the overclaimed scope recorded in R03. Norm-subgroup restriction is a separate declared contract. |
| AutomorphicFormsOnReductiveGroups (#1037) | 2.6,4.2,5.1,5.2,5.4,5.7 | Vogan–Zuckerman bidegrees at line 808; rational-model restrictions at line 870. |
| AutomorphicSpectralTheory (#925) | 0.25–0.26,4.7 | Whittaker/Bessel functions and compact quotient discrete spectrum; no unconditional general Eisenstein comparison inferred. |
| AutomorphicLFunctionsAndLocalFactors (#924) | AL.3.6.3 | Line 1772: zero-free boundary allows poles. The package correctly does not call a pole a finite nonzero value. |
| MetaplecticAutomorphicForms (#1063) | 0.15–0.17,2.5,3.3c,3.7,3.9,3.16,3.23–3.28,3.32a–3.36,3.38,5.6,6.4,6.10–6.15,6.22 | Splitting comparison line 1010 requires a common split real place; real theta convention line 1034; conjugated global input line 1366. Repaired usage respects these. Quaternionic residue and Shimizu extensions remain declared gaps. |
| AdelicAlgebraicGroups (#792) | 3.4 | Compact anisotropic quotient input, applied to the indicated isometry groups. |
| ClassFieldTheory (main) | Layers 6–8,10,11; former §5.4 | Former §5.4 maps to W.4 at line 275; old `sumLocalInv_eq_zero` and injectivity names have explicit mappings at lines 301–302. Layer 10 lines 1696–1699 imports Brauer reciprocity. Those mappings prevent a false drift finding. Full quaternion ramification/embedding classification remains a gap. |
| GlobalNumberFields (main) | Layers 1,2,4,6,9,10 | Mixed-place weak approximation, finite ray classes, finite-idele class group and Hecke infinity types. No unrestricted extension of prescribed local characters is inferred. |
| ReductiveGroups; ReductiveGroupsPartII (main) | Layers 3,6; RG2.5.1–RG2.5.2 | Group quotients/isogenies at lines 1262,1949; dual and L-group sections at 6724,6931 of Part II. |
| EndoscopicTransferAndUnitaryTraceComparison (#999) | 1.8 | Unitary similitude dual group with Galois action; the general root-datum supplier handles the relative factor and the factor permutations. |
| RepresentationTheory (main) | `RepresentationTheory/SchurWeyl` Layer 9; `RepresentationTheory/SpinRepresentations` Layer 6 | Harmonic tensors at SchurWeyl line 1308 include all contractions. The symmetric part and Fock normalization here are adapters, not another ownership of general traceless tensors. |
| GeometryOfNumbersAndQuadraticArithmetic (#851) | 4.3 | Positive-definite Fischer decomposition; the retained variant states arbitrary real signature. |
| PadicHodgeTheory (#1062); PadicPeriodRings (#940) | 3.3,4.4,7.2,8.1; 1.4 | Fontaine/Sen/coefficient comparison at lines 682,894,1250,1378 of the former. The missing stalk rigidity/subquotient closure is explicitly contracted, not confused with supplied comparison. |
| SelmerIwasawaCohomology (#869); ArithmeticGaloisRepresentations (#856) | 2.7,4.9; conventions and 1.2 | Bloch–Kato trivial-representation case at line 1923; arithmetic Frobenius and cyclotomic Hodge–Tate weight `+1` agree with the twist computation. |

The seven declared gap slugs agree between the README and `packages/HodgeClassesForJacquetLanglands/design/plan.json`: `compact-matsushima`, `vhs-hodge-decomposition`, `quaternion-ramification-classification`, `norm-subgroup-restriction`, `quaternionic-doubling-residue`, `quaternionic-shimizu-lift`, `derham-local-system-cohomology`. Each names an earlier supplier and a specific mathematical input with its hypotheses. The closely related residue constructions constitute one quaternionic doubling contract. The updated Periods-I choice makes the Shimizu contract precise without pretending that the splitting comparison holds for `d=0`. No existing gap was treated as an unowned prerequisite merely because it is not yet implemented. R03 identifies an additional undeclared requirement.

The prescribed dependency command, with the supplied configuration, name, merge order, `--movable` and pinned content checkout, returned exit 0 and exactly:

    depcheck: 236 roadmaps, 2155 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. The numerical order passes; it does not repair the supplier-scope mismatch in R03.

## Not verifiable

- No sampled source was inaccessible; all fifteen seeded targets were read in the published IP23 extraction. No missing text was requested.
- The seven declared gaps are future supplier contracts. Their ownership, precise scope and matching declarations were checked; their completion as formal library results is not certified.
- The missing geometric and automorphic carriers prevent formal elaboration of the README-only headlines. The three actual Lean theorems were elaborated, but `sorry` is not a proof. The computed mathematical checks above do not claim a formal proof of all proposed targets.
- Ownership against open work was checked on the supplied searchable heads and main. No unavailable head was independently discovered or fetched outside those supplied sources.

## Source issues

- **Error** in IP23 at Remark 2.2, printed page 17: the source says raw compact-open Haar volumes normalize geometric trace independently of level; it should account for the closure of trivially acting rational central units and the effective covering degree; affects a stated result.
- **Error** in IP23 at Proposition 8.2, printed page 55: the source says compact contraction has an extra factor `(-1)^ℓ`; it should cancel the negative Fock and coefficient-pairing signs; affects a stated result.
- **Error** in IP23 at §4.3, printed page 24: the source says to evaluate a norm-one character at `(t₁t₂)⁻¹α`; it should use an appropriate full idele-class character, since that argument need not have norm one; affects a stated result.
- **Misprint** in IP23 at §3.2, printed page 19: the source says quaternionic isotypic cohomology is concentrated in degree `2d`; it should be degree `d`, as used on page 98; affects nothing.
- **Misprint** in IP23 at the proof of Proposition 11.6, printed page 88: the source says the `(1,1)` Hodge pair with an unclosed parenthesis; it should close both coordinates, yielding `(k_v−1,k_v−1)`; affects nothing.
- **Misprint** in IP23 at the group diagram of §4.1, printed page 22: the source says the rank-one quaternionic block is an `E`-unitary group; it should be the `B`-unitary group used in §5.3.1; affects nothing.
- **Gap** in IP23 at the proof of Proposition 9.5, printed page 61: the source says the backward lift of the conjugate supplies the required local representation; it should identify the conjugate components using self-duality on the norm subgroup, or conjugate the lift; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "297b5dce5914e1abd6d472856d782aecf2a3d90a", "job": "REV-PKG-HodgeClassesForJacquetLanglands~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
