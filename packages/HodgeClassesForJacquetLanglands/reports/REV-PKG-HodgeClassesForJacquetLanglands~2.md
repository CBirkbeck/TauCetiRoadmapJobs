# Review of HodgeClassesForJacquetLanglands (package, round 2)

**Verdict:** needs changes

Nine findings: one P1 and eight P2. The five findings from the preceding review are repaired. The three Lean target theorems elaborate and are not padding; the new defects are in the README's mathematical contracts and scope. No roadmap, Lean, metadata, plan or source-manifest file was changed by this review.

Previous findings, checked first against the repaired package and suppliers:

| Previous finding | Status and repaired passage | Verification |
| --- | --- | --- |
| F01, duplicated de Rham comparison | **Repaired.** README:384–386 now imports “the Galois-equivariant strictly filtered comparison”; :394–396 retains “is de Rham in the sense of §7.2, and every subquotient of a de Rham representation ... is de Rham”. | PadicHodgeTheory §7.2 supplies coefficient comparison; §8.1 supplies algebraic–analytic comparison. The matching plan gap now contains only rigidity and subquotient closure. The new componentwise route at :485–492 respects geometric connectedness. R02 below concerns a different, pre-existing purity overclaim. |
| F02, missing exterior-power declarations | **Repaired.** README:191 names “`LinearMap.map_exteriorPower_finrank_eq_det_smul` and `Module.Basis.exteriorPowerTopEquiv`”. | Both occur at the Tau Ceti pin, `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`:157,174. Mathlib's top-vector unit statement supplies the nonzero denominator. All uses of the former names in the reviewed README were replaced. |
| F03, invented global-transfer names | **Repaired.** README:285 says “global Jacquet–Langlands `JL_D` with its local-components, central-character and inverse clauses”. | GL2AutomorphicRepresentationsAndTransfer §R17.3.1, `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md`:1703–1725 at its supplied head, states those clauses. |
| F04, missing Bloch–Kato name | **Repaired.** README:389–390 says “§4.9 the Bloch–Kato local condition `H¹_f`, with `H¹_f(K, ℚ_p) = H¹_ur(K, ℚ_p)`”. | SelmerIwasawaCohomology §4.9, `TauCetiRoadmap/SelmerIwasawaCohomology/README.md`:1923–1949, contains the trivial-representation specialization. The nonexistent identifier is gone. |
| F05, incorrect nonvanishing locator | **Repaired.** README:272 names “§AL.3.6.3, Rankin–Selberg nonvanishing on the boundary”. | AutomorphicLFunctionsAndLocalFactors §AL.3.6.3, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md`:1772–1782, gives zero-freeness, allowing poles. All five uses now point there. |

The repair report has no finding marked “not actionable in this package”. None of the findings below re-raises a settled finding.

## R01 (P2) — The introduction explicitly presents the roadmap as following a source

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:5: “following Ichino and Prasanna (IP23)”.

**Claim:** The source supplies the organizing route.

**Witness:** The quoted sentence is the precise case prohibited by the binding organization principle: a README must not say that it follows a source.

**Repair:** Replace the phrase by a citation attached to the end theorem, and describe the construction in its own mathematical terms. Keep the dependency-forced exterior algebra → local representations → theta cohomology → rational descent order. Deleting the source-following assertion leaves those dependency edges and every mathematical target unchanged; no layer reordering is requested.

## R02 (P2) — Arbitrary coefficient representations do not have one pure weight

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:462–467: “a finite-dimensional representation” and “the pure `L`-Hodge structure on `H^i(Sh_K(ℂ), 𝕍)`”. The definite-group Check at :506–507 has the same problem.

**Claim:** Every allowed representation produces a pure coefficient-cohomology object; in dimension zero its Hodge type is asserted to be `(0,0)`.

**Witness:** Take the CM torus `T = Res_{ℚ(i)/ℚ} G_m`, its usual Shimura datum, and `ρ = 1 ⊕ Norm`. Its zero-dimensional fibre is `ℚ(0) ⊕ ℚ(1)`, with weights `0,−2`.

Here `Z_s = 1`: the real-split subtorus is already rationally split. Thus the example satisfies the stated factorization condition. A disjoint finite Shimura set does not remove either weight. IP23 line 681 states a Hodge structure, not this additional purity assertion. The imported pure variations have a fixed weight: ShimuraData §§3.1 and 3.3, `TauCetiRoadmap/ShimuraData/README.md`:354,416, at #1038.

**Repair:** Decompose an arbitrary `ρ` into its central-weight summands. For a summand of Hodge weight `w`, state purity of `H^i` of weight `i+w`; assert purity of the whole object only when `ρ` has a single weight. Qualify the dimension-zero `(0,0)` Check by trivial coefficients. Preserve arbitrary representations by taking the direct sum of their weight pieces. On the witness this gives two pure pieces of weights `0` and `−2`, and makes no false single-weight assertion.

## R03 (P2) — Central kernel alone does not make the Shimura map finite étale

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:532–534: “If `G → H` has central kernel but is not surjective on adelic points ... finite étale onto a union of components”.

**Claim:** The second branch requires only a central kernel, dropping algebraic surjectivity.

**Witness:** The diagonal datum map of a compact Shimura curve into its square has trivial, hence central, kernel. Its dimensions are `1 → 2`; the diagonal is not an étale component.

IP23 line 719 imposes algebraic surjectivity with central kernel as condition (i); Remark 2.2, IP23 line 726, drops the adelic-surjectivity condition (ii), not (i).

**Repair:** Repeat “surjective as a morphism of algebraic groups, with central kernel” in the normalized-trace branch. Keep the general pullback statement for arbitrary datum morphisms. The diagonal then has pullback but is excluded from the finite-étale assertion. For an actual level cover of degree `m`, the repaired normalization still gives `m·(1/m)=1`.

## R04 (P2) — The Hermitian-volume claims lack Hermitian symmetry

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:666–675: “the form `H` induces the Hermitian form” and “The volume lies in `F`”.

**Claim:** Under the layer's explicitly sesquilinear standing hypotheses, the determinant pairing is Hermitian and its volume is fixed by `σ`.

**Witness:** Over `E=ℚ(i)`, with conjugation and `H=diag(i,1,1,1)`, take `d_U(e₁₂₃₄)=−1`. The volume is `i`; its conjugate is `−i`.

The layer at :658–662 distinguishes sesquilinear from Hermitian forms rather than assuming symmetry. The source's Hermitian setting does not justify the broader assertion.

**Repair:** Retain the determinant construction, basis-change and rescaling identities for sesquilinear forms, but require `H y x = σ(H x y)` for the induced Hermitian form, fixed-field assertion and discriminant class. Add the displayed non-Hermitian negative control. Do not narrow §§1.3 or 1.7 or their Lean signatures: those identities really hold for general sesquilinear forms. For `diag(1,2,1,−5)` the repaired assertion gives fixed volume `−10`.

## R05 (P2) — The quaternionic action needs a nondegenerate quadratic Hermitian input

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:771–774: “it makes `⋀²U` a right `B`-module of rank three”. Nondegeneracy is attached only to the later assertion about the form.

**Claim:** The construction is a rank-three quaternionic space before imposing `J ≠ 0` or the quadratic involution assumptions.

**Witness:** For `H=0` on `ℚ(i)^4`, `J=0` and `L=0`. Right multiplication by `j` has `E`-rank `0` on `⋀²U`, but rank `3` on `(E⊕Ej)^3`, where `j²=0`.

Thus this module is not free of the claimed rank. The symbol algebra with square-zero `j` is not a quaternion central simple algebra, and the proposed `J⁻¹` form lacks a nonzero denominator. The general layer also admits `σ=id`, which is not the nontrivial automorphism of a quadratic étale algebra.

**Repair:** State §1.6 for a nondegenerate Hermitian four-space over a quadratic étale `E/F` with its nontrivial involution (in the characteristic-zero group setting used here). Establish `J∈F×` before defining the algebra and form. Keep degenerate exterior operators in §§1.3–1.5. The zero-form witness is then excluded from quaternionic freeness while still satisfying `L²=0`; the unit diagonal form has `J=1` and invertible `L`.

## R06 (P1) — The compact Schwartz contraction has an extra sign

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:1248–1255: “`(−1)^ℓ (x₁ + εix₂)^ℓ φ₀(x)`” and the degree-one negative Check.

**Claim:** The negative-coordinate Fock sign survives the contraction with the coefficient vector.

**Witness:** At `ℓ=1`, `φ′₁=−Σ x_jφ₀⊗e_j` in the Schrödinger model. Since `⟨e_j,e_j⟩=−1`, contraction at `x=e₁` is `+e^(−π)`; the asserted formula is `−e^(−π)`.

This follows directly from the package's own definitions: §4.2 gives `ι⁻¹(z_j)=−4πi x_jφ₀` for negative coordinates; §4.3 divides by `4πi`; §4.1 uses the original negative bilinear pairing, not its negative. Degree-one harmonic projection and restriction are identities on the retained directions. In degree `ℓ`, the two factors `(-1)^ℓ` cancel. IP23 Proposition 8.2 prints the same error: compare IP23 lines 2164–2168, 2203–2213 and 2339–2346. Agreement with the printed proposition is therefore insufficient.

**Repair:** The contraction is `(x₁+εix₂)^ℓ φ₀(x)` with the stated definitions. Remove the extra sign and replace the sign Check by the cancellation calculation. Test `ℓ=0,1,2` at `x=e₁`: all three give `+e^(−π)`. The even-degree applications in §§7.5 and 10.9 retain their existing values. Record the source error; do not restrict the theorem to even degree to conceal it.

## R07 (P2) — Simultaneous nonvanishing allows zero test vectors

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:1699–1703: “Let `f₁^ε ⊠ f₂^ε ...` have weights ... the same finite components ... pairs nontrivially with every ... `f^ε`”.

**Claim:** The stated eigenweight, level and finite-component conditions suffice for nonzero pairing.

**Witness:** Set one factor, hence every `f^ε`, to zero. Every displayed weight equation and fixed-vector condition still holds, but every linear cohomological pairing equals `0`.

The source fixes nonzero decomposable automorphic vectors before Proposition 10.1: IP23 lines 3072–3092. Merely referring to their weights does not carry those hypotheses.

**Repair:** Require nonzero decomposable vectors, with nonzero local factors and the specified common finite tensor and archimedean sign factors, as in the source. Carry the same data into §§7.4–7.5. Add the zero-vector negative control, consistent with §7.2's existing zero-input Check. For nonzero sign basis vectors the pairing matrix can have nonzero diagonal entries; for the excluded zero input its corresponding entry is exactly zero.

## R08 (P2) — The finite-level correspondence has no common finite factor

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:2223 and :2230–2231: “the correspondence is the tensor of §10.7 with the identity on the finite factor”.

**Claim:** The multiplicity-space isomorphism automatically extends to full finite-level isotypic summands by tensoring with an identity.

**Witness:** The factors are `(π₁,f)^K₁` and `(π₂,f)^K₂`, for different groups. Already at a common unramified split place, Iwahori versus maximal-compact invariants have dimensions `2` versus `1`.

For `d=1` the full summands then have dimensions `4` and `2`, while both multiplicity spaces have dimension `2`. “Suitable levels” in the theorem does not supply the missing map or justify the identity Check. The package itself defines its earlier subscript notation as a multiplicity space at :475–477 and :508–509. IP23 lines 695–706 use that convention; lines 4494–4507 retain the finite factors separately and contract against selected vectors before Proposition 12.3.

**Repair:** State the weight-two theorem on the multiplicity realizations of §0.5, with its finite-level representatives obtained by the specified contractions. Remove the asserted identity between the finite factors. If a theorem about entire finite-level summands is retained, add and prove an explicit rational isomorphism between the chosen finite invariant spaces and use it in the correspondence, with its level hypotheses. On the witness the multiplicity statement is `2≃2`; the full `4≃2` assertion is unavailable. Equal one-dimensional finite factors still require chosen vectors/duals, not an unnamed common identity.

## R09 (P2) — The splitting comparison does not supply the included zero-dimensional case

**Location:** `packages/HodgeClassesForJacquetLanglands/README.md`:1421–1423 and :1430–1432 cite MetaplecticAutomorphicForms §3.32a for the product theta lift. The conventions at :103–106 allow `Σ=∅`.

**Claim:** The named splitting comparison covers all the package's global theta data.

**Witness:** At #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md`:1011–1014, §3.32a requires a common split real place. For `F=ℚ`, `Ram(B₁)={∞,2}`, `Ram(B₂)={∞,3}`, that count is `0`.

Both algebras admit `ℚ(i)`; their product is ramified at `{2,3}` and split at infinity. They fit this package's algebraic conventions with `d=0<n=1`. IP23 Proposition A.14, printed page 113, IP23 lines 5081–5088, explicitly has the same common-split-place hypothesis. The Shimizu gap states a lift identification, not this splitting comparison. There is a route to the required weaker comparison: IP23 lines 5093–5105 identify the norm-support subgroup and prove triviality of the ratio there using the two scalar embeddings, before using a negative real generator.

**Repair:** State and prove the norm-support splitting comparison actually needed by §6.2 as an adapter, citing MetaplecticAutomorphicForms §§3.30–3.31 for the two scalar embeddings and §3.32a for the automorphic ratio, together with the subgroup calculation in IP23 lines 5093–5105. Resolve the simply connected derived-group input used to kill that automorphic character against its named supplier. Distinguish this corollary from the full-adelic comparison requiring a common split real place. Do not impose `d>0`: on the witness every norm-support element factors through the derived subgroup and those two scalar embeddings, where the ratio is `1·1·1=1`; no negative real generator is needed. If the package cannot supply that adapter, declare precisely the remaining supplier contract instead of asserting the unrestricted citation.

## Verified sound

Coverage and limits of this heading: all 75 numbered targets, their API bullets, Checks and dependency lines were read; all repaired passages were re-examined and the repaired patterns searched throughout the package. The calculations below support the sampled targets, headlines and every finding. Unchanged portions of the earlier review were relied on only for its rows with actual computed values (exterior matrices, tensor model, weight map and rational descent); its unsupported “as stated” assessments were not treated as certificates. This is not an acceptance claim: the nine defects above remain.

There are eleven numbered layers, each with Examples and Dependencies. Every numbered target has a Needs line and at least three Checks. The definition blocks retain prose API lists. The introductory source-following phrase is R01; the mathematical dependency order itself is justified by the exterior, oscillator, cohomological and descent constructions. No algorithmic implementation, copied source passage, prohibited supplier, process path, `set_option`, sorry'd data, or re-planning of an existing roadmap was found in the four reviewed package files. All own backticked Lean names resolve to the four declarations in Suggested.lean; supplier names are distinguished below.

### Seeded source verification

The only cited work is IP23. Its existing manifest entry identifies the legal publisher-open published version, whose printed-page markers were used. No locator is flagged unverified. All fifteen seeded locators were readable. Source support is qualified by the findings, rather than inferred just from matching theorem numbers.

| Target | Published locator and extraction | Hypothesis/formula check |
| --- | --- | --- |
| 0.7 correspondence operator | pp.4–5, Theorem 1 and (1.4)–(1.5), IP23 lines 209–239; §3.3 pp.19–20, lines 832–856; §12.3 p.98, lines 4502–4523 | Cup/pullback/trace direction and twist `(d)` agree on multiplicity spaces. Full finite factors need R08. |
| 1.8 exceptional projective isomorphism | Proposition 5.7, Remarks 5.8–5.9, p.31; IP23 lines 1277–1306 | Hilbert-90 scalar `β/σβ=ν²/det`, independence modulo the fixed field, algebraic group rather than rational-point surjectivity. |
| 2.4 projective block map | Proposition 5.11, (5.13), p.32; §5.3.1 pp.35–36; IP23 lines 1341–1348,1475–1480 | Image `Nrd(b₁)α₁⁻¹α₂`; equal multipliers and anti-diagonal scalar quotient retained. |
| 2.5 quaternionic blocks | Proposition 5.13, pp.34–35; IP23 lines 1401–1436 | Identity components, norm multipliers and nonidentity normalizer component are distinguished. |
| 3.1 local models | §§6.1,6.3 pp.38,42–44; §10.3 p.66; IP23 lines 1568–1595,1737–1861,2887–2895 | Morita signs give `(4,2)` or `(0,6)`, with the stated block signatures. |
| 3.2 split torus map | Lemma 6.1, p.41; IP23 lines 1706–1723 | Three coordinates and the central quotient agree; no surjectivity on local points inferred. |
| 5.2 component torus | §4.3 pp.23–24; IP23 lines 1000–1033 | Abelian quotient and central kernel agree. The roadmap correctly avoids the source's unsupported component-bijection shortcut and uses a morphism to the torus datum. |
| 6.3 doubling point | Lemma 9.7 p.63, (9.3) and Lemma 9.8 pp.63–64; IP23 lines 2700–2735,2758–2773 | `s=3/2`, Levi exponent `s+5/2`, normalized `b/a`, residue rather than positive-range value. Quaternionic extension is a declared gap. |
| 7.10 simultaneous nonvanishing | Proposition 10.1 pp.70–71; Lemma 10.8/§10.9 pp.77–78; IP23 lines 3065–3128,3444–3485 | Common data for all `2^n` signs and support place match. Nonzero decomposable input hypotheses are missing: R07. |
| 8.1 unramified parameter | Proposition 11.4, proof pp.85–86; IP23 lines 3971–3985 | Base-changed determinant-one pair with `±1/2` exponents yields `σ_E ⊠ Sym¹`; central twist and conjugate-orthogonal convention retained. |
| 8.2 three cohomological modules | Proposition 11.2 p.83; IP23 lines 3741–3757 | Extremes `(4,0),(0,4)` and middle `(1,1),(2,2)×2,(3,3)`. |
| 8.6 fibre/cochain criterion | Proof of Proposition 11.6 pp.87–88; IP23 lines 4027–4076 | The central character determines `k′`; fibre degree is added to cochain degree before normalization. |
| 8.7 six weights | Same proof pp.88–90; IP23 lines 4061–4115 | Both middle Kostant rows retained; unitary shift applied to both Hodge coordinates. |
| 9.4 geometric unipotent extensions | Remark 11.10 p.90; IP23 lines 4133–4148 | Rational coefficients, number field, geometric/de Rham assumptions and finite class-group argument retained. |
| 10.4 invertibility | Proposition 12.3 p.98; IP23 lines 4503–4523 | Finite vectors contracted first; all sign lines paired, giving invertibility of multiplicity realizations. |

Also re-read the source passages underlying the changed §0.2 route, the exterior constructions, compact Schwartz formulas, Kottwitz lowest line, and Theorem 12.4. There are no missing texts to request.

### Computed adversarial table

Each displayed value is a calculation, not an elaboration result. Formula checks use the conventions in the package. “Pass” is local to the specified statement and instance; it does not override a missing hypothesis elsewhere.

| Statement | Instance(s) | Values on the two sides / discriminator | Result; change |
| --- | --- | --- | --- |
| 0.1 coefficient normalization | Scalar `t`, weight `k=4` | `Nrd(t)^(-1) Sym²(t)=t^(-2)t²=1`; omitting the norm twist gives `t²` | Pass. |
| 0.2 purity | CM torus, `1⊕Norm`, degree zero | Hodge weights `{0,−2}` versus one claimed pure weight | R02. |
| 0.2 repaired component route | Two conjugate geometric components over a quadratic extension | Each rank-one `H⁰` induces to rank `2`; applying rigidity on one component alone yields rank `1` | Componentwise comparison and finite induction preserve both components. |
| 0.3 trace | Level cover degree `m=3`; diagonal curve | Normalized pull-push `3·1/3=1`; diagonal tangent dimensions `1→2` rather than étale `1→1` | Normalization passes; R03. |
| 0.4 division reduction | Ramification sets `{∞,2}`, `{∞,3}` over `ℚ` | Symmetric difference `{2,3}`, cardinal `2`; common real ramification cancels | Pass; same input exposes R09. |
| 0.5 multiplicity | `d=0,1,2`, finite invariant dimension `r=3` | Multiplicity ranks `1,2,4`; full summands `3,6,12` | Pass; these are different objects. |
| 0.6 signs | Two split factors, weights `(2,4)` | Four types `(3,−1),(0,2),(2,0),(−1,3)`, each total weight `2`; `(1,1)` need not occur | Pass. |
| 0.7 operator and sign | Curve basis `e,f`, trace `e∪f=1`; correspondence `f⊗e−e⊗f` | Graded cup/trace gives `e↦e`, `f↦f`; Hom weight `1+1−2=0` | Pass. |
| 1.1 fixed volume | `diag(i,1,1,1)`, conjugation, `c=−1` | Volume `i`, conjugate `−i` | R04. |
| 1.1 scaling | `diag(1,2,1,−5)`, `c=−1,−2` | `det/N(c)=−10,−5/2`; opposite scaling would give `−40` | Pass. |
| 1.2 determinant norm | Scalar `g=(2+i)id`, `ν=5` | `det g=−7+24i`, norm `625=5⁴` | Pass. |
| 1.3 defining operator and uniqueness | Unit diagonal, `c=−1`; zero form | `L e₁₂=−e₃₄`, wedge value `1=det I₂`; zero form forces all six wedge-dual coefficients to zero | Pass; pure wedges span, excluding an unrelated/zero operator for nonzero pairing. |
| 1.4 square | Diagonal `(1,2,1,−5)` | Images in order `−2e₃₄,e₂₄,5e₂₃,−2e₁₄,−10e₁₃,5e₁₂`; every square `−10e_I=vol·e_I` | Pass. |
| 1.4 degeneration and characteristic two | Rank-two `diag(1,−2,0,0)`; hyperbolic form on `𝔽₂⁴` | First `L²=0=det H`; second `L²=id`, determinant `1`, signs `−1=1` | Pass; no added characteristic-zero restriction to Lean. |
| 1.4 noninvolutive endomorphism | Hermitian `H`, nonzero value `h` | Symmetry twice gives `σ²(a)h=ah` for every `a`; if `σ²≠id`, `h=0` | Only zero Hermitian form survives; square identity remains `0=0`. |
| 1.5 skew identities | Plane `diag(a₁,a₂)` | `b(L₁e₁,e₂)=−i a₁a₂`; reversed value `+i a₁a₂` | Pass; parity differs from exterior degree two in dimension four. |
| 1.6 freeness | `H=0`, `j²=0` | Right-`j` ranks `0` on exterior module and `3` on free symbol module | R05. |
| 1.7 similitude | Scalar `2+i` | Wedge scalar `3+4i`; `ν²/det=(-7−24i)/25`; product `3−4i=σ(3+4i)` | Pass; reciprocal/conjugate normalization discriminated. |
| 1.7 degeneracy | `H=0`, any invertible `g`, `ν=0` | Both sides `0`; determinant of `g` remains nonzero | Pass; no needless nondegeneracy hypothesis in Lean. |
| 1.8 projectivization | `g↦gα`, `β↦βα⁻²`; `β↦2β` | Ratio gains `(σα/α)²`; exterior map gains `α²` and correcting scalar `α⁻²`, product `1`; latter change is scalar `2` | Pass modulo `F×`. |
| 2.1 plane multiplier | `Nrd b=8`, `α=2−i` | Multiplier `8/5`; determinant `8/(3−4i)=(24+32i)/25` | Pass; norm and square are different. |
| 2.2–2.3 block exterior | Dimensions `2+2` | Exterior dimensions `1+4+1=6`; equal-multiplier/special block dimension `5+5−1−1=8`, target `7+2−1=8` | Pass. |
| 2.4 image | `Nrd b₁=8`, `α₁=2`, `α₂=4`, equal multiplier `2` | `8·(1/2)·4=16`; `det g₁·α₁α₂=(8/4)·8=16`; anti-diagonal `t=2` acts by `1`, diagonal by `4` | Pass. |
| 2.5 block groups | Scalar pair `(2,1/2)`, `α=2+i` | Product multiplier `4·1/4=1`; rank-one multiplier `Nα=5`, not `α²=3+4i`; `jij⁻¹=−i` distinguishes other component | Pass. |
| 2.6 tensor model | `J₁=−2,J₂=5` | Mixed images `e₂₄,−2e₁₄,5e₂₃,−10e₁₃`; diagonal images `−2e₃₄,5e₁₂`; square `−10` | Agrees with 1.4, pass. |
| 2.7–2.8 restriction/diagram | Ranks and central scalar `−1` | `dim_E W=3`, quaternion rank `3`; exterior action of `−1` is `+1`, kernel length `2` in characteristic zero | Pass. |
| 3.1 local signatures | Split versus compact real place | `(2,2)+(2,0)=(4,2)`; `(0,4)+(0,2)=(0,6)` | Pass; no interchange of the compact and noncompact theta module. |
| 3.2 torus | `(t₁,t₂,ν)=(2,3,5)`; central `(z,z,Nz)` | Image `(36,20,30)`; central image `(N(z)²,N(z)²,N(z)²)` | Pass modulo diagonal centre. |
| 3.3 real torus | `(1,1,1,−1)` and `(1,1,i,i)` | Images `(−1,−1,−1)` and `(1,1,−1)` | Pass; sign component distinguished. |
| 3.4 weights | `(2,0,0)`; `(1,0,0)` | First maps to `(1,−1,1,−1)`; second gives half-integral entries and is excluded by parity | Pass. |
| 3.5 real cohomology | `k=2`, split and compact place | Split lowest cohomology degree `2`, type `(1,1)`; compact degree `0`, trivial coefficient | Pass. |
| 4.1 harmonic pairing | Degree two in positive `ℝ²` | `⟨v²,w²⟩=2⟨v,w⟩²`; contraction of `e₁²−e₂²` is `0`, of `e₁²` is `1` | Pass; factorial convention detected. |
| 4.2 Fock sign | Positive/negative coordinate, degree one | `Aφ₀=2xφ₀`; inverse images of `z` are `+4πixφ₀` / `−4πixφ₀` | Pass. |
| 4.3 compact coefficient | `(p,q,ℓ)=(0,6,1)` | `(4πi)⁻¹Σz_j⊗e_j` maps to `−Σx_jφ₀⊗e_j`; weight `−1−3=−4` | Pass; input to R06. |
| 4.4 harmonic restriction | `e₃²−e₄²`; `e₁²` in the split four-plane | First restricts to `0`; projection of second is `e₁²−(e₁²+e₂²−e₅²−e₆²)/4`, contraction `1−4/4=0` | Pass. |
| 4.5 noncompact restriction | `ℓ=0,2`, `x=2e₁` | Powers `w²,w⁴` give `4φ₀,16φ₀`; wrong compact exponents `w⁰,w²` give `φ₀,4φ₀` | Pass with the differential-form normalization. |
| 4.6 compact restriction | `ℓ=0,1,2`, `x=e₁` | Definitions give `(+,+,+)e^(−π)`; stated formula gives `(+,-,+)e^(−π)` | R06. |
| 5.1 Shimura map | `d=1`; scalar `z` | Dimensions `2,4`; exterior action of `z` is `z²`, not `z` | Pass. |
| 5.2 component torus | `t=2,α=2`; central kernel | `Nα=4=t²`; `[4,1]=[2,2]`; kernel solutions `(t,α)=(±1,1)` | Pass. |
| 5.3 component character | `α=2`, `t₁t₂=4` | Argument `1/2` has norm `1/4`; full idele character gives `η(1/2)=η(2)=1` on base scalars | Roadmap correct; source issue below. |
| 5.4 normalized coefficients | Scalar `t`, even `ℓ=2` | Harmonic scalar `t²` times `ν⁻¹=t⁻²` is `1`; highest weight `(1,1,−1,−1)` | Pass. |
| 6.1 toric condition | A character factoring through norm | Restriction to norm-one torus is `1`; local forbidden quaternionic lift `0`; `L(s,1)` has pole at `1` | Correctly excluded in division case. |
| 6.2 splitting supply | `d=0` versus `d=1` | Number of common split real places `0` versus `1`; full-comparison threshold `≥1`; on norm support, the derived/scalar factor ratios are `1·1·1=1` | R09: state the weaker adapter. |
| 6.3 normalization | Nonarchimedean `q=2`, `s=3/2` | `a=−16/7`, `b=262144/240975`, `b/a=−16384/34425`; Levi exponent `4`; global pole factor `ζ^S(1)` | Pass; local rational value is finite and nonzero. |
| 6.4–6.5 near equivalence | Backward lift and conjugate at an unramified place | Two-dimensional parameter `(a,a⁻¹)` becomes `(a⁻¹,a)` under duality; same unordered parameter | Pass in stated unitary/norm-support setting. |
| 7.1–7.3 theta linearity and projection | Zero input; character `χ=1` or nontrivial on compact quotient | Theta class `0` for zero input; normalized character average `1` or `0` | Pass; supplies negative control for R07. |
| 7.4–7.5 signs | Even exponents `k=4`, `k−2=2` | `(-1)^4=(-1)^2=1`; common finite tensor unchanged by real sign change | Pass for nonzero decomposable input. |
| 7.6–7.8 support/auxiliary character | Quadratic norm quotient; trivial versus prescribed nontrivial local character | Quotient has `2` classes; trivial character has value `1` on both, order-two character `1,−1` | Conditions discriminate support/character choice; same theta vector must be used. |
| 7.9 triple type | `k=2`, split and nonsplit real place | Weights `2+1=3`, `−2−1=−3` | Pass. |
| 7.10 nonvanishing | Zero sign vector; `n=2,d=1` | Pairing always `0` for zero input; number of source sign tensors `2^n=4`, multiplicity rank `2^d=2` | R07; counts are intentionally different. |
| 8.1 parameter | `η(Frob)=a`, `q_E=4` | Four eigenvalues `a/2,2a,a⁻¹/2,2a⁻¹`; product `1`, exponents `±1/2` | Pass. |
| 8.2 cohomological modules | `q₀,q₁,q₂` | Total dimensions `1,4,1`; middle dimensions `1+2+1=4` in degrees `2,4,6` | Pass. |
| 8.3 involution | Negative similitude | `(4,0)↔(0,4)`; `(1,1)` stays `(1,1)` | Pass. |
| 8.4 rational conjugates | Coefficient field of degree `2` | Two conjugate eigenspaces are retained; trace of a conjugate pair gives rational data, not one selected complex eigenspace | Pass; purity needed on both. |
| 8.5 selection | `d=2` | Minimum total degree `2+2=4`; choosing a degree-4 local contribution gives `4+2=6` | Only the two minimum contributions enter degree `2d`. |
| 8.6 central character | `k=4`, `(p,q)=(1,1)` | `λ=α⁴`, `μ=α²`; `α^(4−2k′)=α⁻²` gives `k′=3`; type `(1,1)+(2,2)=(3,3)` | Pass. |
| 8.7 six types | `k=4` | Before shift `(0,8),(3,3),(4,4),(4,4),(5,5),(8,0)`; after `(-2,-2)`: `(-2,6),(1,1),(2,2),(2,2),(3,3),(6,-2)` | Pass; both middle rows required. |
| 8.8 purity | `d=0,1,2` | Types `(0,0),(1,1),(2,2)` become `(0,0)` after twists `0,1,2` | Pass as the cohomological purity conclusion. |
| 9.1 Kottwitz representation | `d=0,1,2` | Dimensions `6^d=1,6,36`; on central `ν`, the dual twist acts by `ν⁻¹`, not `1` | Pass. |
| 9.2 lowest line | Two factors of `ρ_E⊗|·|^(1/2)` | Wedge determinant `1·|·|`; subsequent `|·|⁻²` yields `|·|⁻¹`; degree-`d` tensor is `ℚ_ℓ(−d)`, twist `(d)` gives `1` | Pass; no sign from ungraded factor permutation. |
| 9.3 local extensions | Unramified `c(Frob)=1`; `c=log χ` | First has inertia value `0` and de Rham extension; second has a nonzero inertia value and nonzero `C_ℓ` cohomology class | Both directions discriminated. |
| 9.4 global extensions | Class group cyclic of order `m`; coefficient `ℚ_ℓ` versus `𝔽_ℓ`, `m=ℓ` | `m c=0` forces `c=0` in `ℚ_ℓ`; in `𝔽_ℓ`, `c=1` survives | Pass; rational characteristic-zero coefficients essential. |
| 9.5 conditional triviality | Rank-two upper-unipotent matrix | Semisimplification always `I₂`; geometry plus 9.4 forces off-diagonal `c=0`, hence matrix `I₂` | Pass; semisimplification alone does not suffice. |
| 10.1–10.3 transfer/restriction | Opposite archimedean sign; two degree-`d` factors | Weight changes sign under contragredient; product cohomology degree `d+d=2d`, correspondence weight after twist `2d−2d=0` | Pass subject to cited supplier gaps. |
| 10.4 invertibility | `d=1`, diagonal coefficients `2,3`; only one nonzero coefficient | Determinants `6` versus `0` for `diag(2,3)` and `diag(2,0)` | All sign pairings, not one, are necessary. |
| 10.5 component descent | Two components swapped by Galois | Function values `(a,a)` are invariant, `(1,−1)` are not | Proper invariant parameter subspace retained. |
| 10.6 rational descent | Complex coefficient polynomial `iX`; averaging scalar `i` | `P(1)=i≠0`, while average `(i−i)/2=0` | Polynomial coordinate descent works; averaging invertibles fails. |
| 10.7 Hodge headline | `d=1`, rational diagonal map `diag(2,3)` | Weight-zero Hom, determinant `6`, Hodge-preserving diagonal entries | Correct endpoint once missing input hypotheses are repaired. |
| 10.8 conditional all-prime headline | A rational chosen class, `K₂(Π)` | For every `ℓ`, untwisted lowest character `ℚ_ℓ(−1)` becomes `1`; no change of rational class with `ℓ` | Quantifier order and Tate twist correct. |
| 10.9 finite-level headline | `d=1,r₁=2,r₂=1`; all `k_v=2` | Multiplicities `2,2`; full spaces `4,2`; harmonic degree `0` | Constant coefficients pass; R08 for finite factors. |

### Libraries, Lean signatures and padding

Pins checked: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The near-match results were treated as search leads. The relevant definitions and hypotheses were opened at those pins:

| Pinned declaration/object | File and line | What it provides / does not provide |
| --- | --- | --- |
| `exteriorPower.wedge`, `wedgePairing`, `Module.Basis.topVector`, `isUnit_apply_topVector`, perfect pairing | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean`:36,42,78,92,130 | Native wedge pairing; finite free perfectness; top-coordinate unit. It does not construct this semilinear Hermitian operator. |
| `pairingDual`, determinant evaluation | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean`:64,73 | Dual exterior pairing evaluates to the determinant; transpose convention has the same determinant. |
| `LinearMap.BilinForm.exteriorPower`, `map_apply_ιMulti` | `Mathlib/LinearAlgebra/ExteriorPower/BilinForm.lean`:34; `Basic.lean`:273 | Bilinear determinant form and functorial exterior map, not the semilinear square law. |
| `exteriorPower.hodgeStar` | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean`:48 | Linear star for a bijective bilinear form on a finite free module. Here `σ=id` and nondegenerate: its defining equation gives `star ∘ L=id`; general `σ` and degenerate `H` are outside that definition. |
| determinant on top exterior power; basis trivialization | `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean`:157,174 | The two repaired names exist; basis wedge has image `1`. |
| `MvPolynomial.funext` | `Mathlib/Algebra/MvPolynomial/Funext.lean`:83 | Infinite integral-domain hypothesis. Rational number fields satisfy it; a finite field would not. |
| `groupCohomology.H1ofAutOnUnitsUnique` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean`:107 | Multiplicative Hilbert 90 for the finite Galois situation; quadratic field extensions meet it. |
| `SchwartzMap`, `Complex.Gamma` | `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean`:75; `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean`:287 | Analytic carriers/functions, not a Weil representation, Fock intertwiner or harmonic cochain. |
| Hodge structure, Tate twist, internal Hom | `TauCeti/Geometry/Hodge/Structure.lean`:62; `Tate/Twist.lean`:63; `InternalHom/Basic.lean`:271 | Opposed filtrations at one pure weight; twist shifts by `m` and changes weight by `−2m`; Hom weight `n₂−n₁`. A number-field coefficient action is additional data. |
| `rescaleJEquiv`, `normMulEquiv` | `TauCeti/Algebra/Quaternion/SymbolEquiv.lean`:226,426 | Real algebra equivalences with their unit parameters; not a repair for `J=0` quaternionic freeness. |
| common-slot quaternion equivalence/class identity | `TauCeti/Algebra/Quaternion/TensorProduct.lean`:192; `BrauerClass.lean`:255 | Existing quaternion algebra and Brauer construction, correctly imported rather than re-planned. |
| `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean`:57 | Native symmetric-power representation used by the coefficient normalization. |

`lake env lean` on the original `Suggested.lean`, run from the pinned content checkout, exited 0 with exactly the three expected `declaration uses 'sorry'` warnings at lines 70,81,95. There are no Tau Ceti imports to build. A scratch copy with `#check @` for all four declarations also elaborated. It retained every needed binder: `Field`, `Module`, `FiniteDimensional` in the theorems, the endomorphism, form, top trivialization, dimension equality, and the Hermitian/similitude hypotheses where required. The real-bodied predicate needs no discarded section hypotheses. Its dimension equality excludes the zero module and infinite-dimensional junk `finrank=0`; basis/top-equivalence hypotheses exclude a zero denominator. No signature was changed.

Every sorried theorem, not a sample, was probed on a scratch copy with `simp [IsExteriorStar]`, `rfl` and `infer_instance`: none closed. Pinned near-matches supply wedge evaluation, perfectness, determinant action and the inverse linear-star characterization, not any one of these three full statements by one `exact` lemma. None is a boundary example, a restated definition, or a README Check. Thus **zero padding findings**. The one predicate is needed to state all three headlines; it is not sorry'd data.

Headline coverage:

| README headline | Suggested.lean disposition |
| --- | --- |
| Exterior existence/uniqueness, square, similitude (§§1.3,1.4,1.7) | Three actual sorried theorems, on native exterior-power carriers; signature/generalities match. |
| Exceptional isogeny/projective isomorphism (§§1.7–1.8) | Named in module docstring; unitary similitude group schemes, identity components and quotients missing. |
| Harmonic Schwartz restrictions (§§4.5–4.6) | Named; Fock/Weil/cochain carriers missing. R06 concerns the proposed mathematics, not a missing Lean theorem. |
| Near-equivalence rigidity and simultaneous nonvanishing (§§6.5,7.10) | Named; automorphic representations and global theta cohomology missing. |
| Rational theta purity (§8.8) | Named; Shimura coefficient cohomology and Matsushima/Hodge decomposition missing. |
| Geometric unipotent triviality (§9.4) | Named; continuous number-field Galois cohomology with the de Rham predicate missing. |
| Hodge class, conditional all-prime statement and weight-two case (§§10.7–10.9) | Each named with missing Shimura varieties, realizations and global transfer; conditional statement additionally lacks its Kottwitz carrier. |

Object searches at the pins do not supply those missing carriers. No statable headline was omitted and no free-Prop or bare-scalar stand-in was substituted. The Lean file has one `import Mathlib`, one module docstring, the expected namespace, four declaration docstrings, no `lemma`, and no prohibited commands.

### Ownership, suppliers and order

The board package index was read before any absence conclusion. The overlap report computed from main and all 438 supplied heads has no conflicting edit of this roadmap, dropped cited ID or revision-only ID. Searches by the objects (Hermitian exterior operator, harmonic/Fock restriction, Kudla–Millson, geometric unipotent extension, Hodge correspondence) were run through `roadmaps grep` across the supplied open heads and main, and against the pinned libraries. This package is new: it does not replace an existing main roadmap.

Closest open scopes were compared: #1063 MetaplecticAutomorphicForms owns oscillator/splitting and general theta inputs; #1756 AutomorphicLFunctionsAndLocalFactorsPartII owns general local/doubling factors; #1736 ExceptionalThetaCorrespondencesForG2 concerns different exceptional pairs; #1404 GanGrossPrasadUnitaryGroups owns unitary Bessel periods; #1038 ShimuraData owns variations and datum foundations. The package imports those general foundations and owns the exterior adapters, explicit harmonic restrictions and Jacquet–Langlands Hodge correspondence. No second owner of the three Lean declarations was found. R09 is a supplier-scope failure, not a cycle. Main roadmaps' shape was compared using ClassFieldTheory, ReductiveGroups and RepresentationTheory/SchurWeyl.

Current section resolutions, with the supplied-head snapshots or main files read rather than remembered:

| Supplier | Resolved sections / relevant witness |
| --- | --- |
| ShimuraVarieties | §§4.2,4.3,4.9,6.7,8.1,8.5–8.7; `TauCetiRoadmap/ShimuraVarieties/README.md`:1148,1177,1309,1896,2361,2475,2496,2533. The six planned identifiers reported as unresolved by the automated lead list occur here; §8.7 requires simply connected derived group, correctly not applied at §5.2. |
| ShimuraData | §§3.1,3.3,3.10,4.3; `TauCetiRoadmap/ShimuraData/README.md`:354,416,577,819. Pure-weight restriction matters in R02. |
| ArithmeticLocallySymmetricSpaces | §§ALS.1.1,1.2,1.8,3.3,3.6,5b.1,5b.4; `TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md`:4382 for the comparison requiring `FrankeInput`. Compact unconditional comparison remains a declared gap. |
| MotivesAndAlgebraicCycles | §§2.2,2.3,2.6,2.7,7.1,7.15; `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md`:353,370,416,434,1291,1580. Compatible realizations and `HT` are imported; scalar extension of `HT` is not falsely assumed bijective. |
| ComplexKahlerGeometry | K6.1 is retained through the README's former-numbering mapping; constant-coefficient Hodge decomposition does not already give polarized-variation cohomology. |
| ComplexComparisonPartII; EtaleCohomologyFoundations | C6 (including C6.3 `artinComparison`); F.2.1,F.2.2,F.3. Constructible coefficient comparison, proper/smooth base change and finiteness match the §0.2 route. |
| GL2AutomorphicRepresentationsAndTransfer | R16.1.8,R16.4.4–4.5,R16.6.3,R17.3.1,3.5,3.7–3.8,R17.4.2,4.13,4.16. R17.3.1 at :1703–1725 supplies the repaired transfer clauses. Norm-subgroup restriction is a separate gap. |
| AutomorphicFormsOnReductiveGroups | §§2.6,4.2,5.1,5.2,5.4,5.7; §5.4 at `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md`:807–831 includes the Hermitian bidegree refinement used in Layer 8. |
| AutomorphicSpectralTheory | §§0.25–0.26 and 4.7; `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`:527,549,2351, Bessel/Whittaker and compact discrete spectrum. |
| AutomorphicLFunctionsAndLocalFactors | AL.3.6.3 at :1772–1782; zero-free boundary is not an assertion of holomorphy at a pole. |
| MetaplecticAutomorphicForms | §§0.15–0.17,2.5,3.3c,3.7,3.9,3.16,3.23–3.28,3.32a–3.36,3.38,5.6,6.4,6.10–6.15,6.22. §3.35 at :1033 onward fixes dual labels; §5.6 at :1365 integrates conjugated input; package uses the conjugate to match its linear convention. §3.32a scope is R09. Quaternionic residue and Shimizu statements are declared gaps, not attributed to ordinary doubling. |
| AdelicAlgebraicGroups | §3.4 compact anisotropic quotients. Its group hypotheses are preserved for the exterior isometry quotient. |
| ClassFieldTheory | Main Layers 6–8,10,11 and §5.4; Layer 10 at `TauCetiRoadmap/ClassFieldTheory/README.md`:1552–1608 supplies Brauer reciprocity, not the full quaternion ramification/embedding classification. |
| GlobalNumberFields | Layers 1,2,4,6,9,10; finite class group, approximation and finite-character inputs resolved. |
| ReductiveGroups; ReductiveGroupsPartII | Main Layers 3,6; RG2.5.1–RG2.5.2 (dual group and Galois/Weil action). General group schemes remain planned imports, not objects in Suggested.lean. |
| EndoscopicTransferAndUnitaryTraceComparison | §1.8 at `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md`:411 onward. This is the common-similitude restriction-of-scalars setting; Layer 9's relative one-factor computation also needs its explicitly cited general dual-root-datum input. The permutation action must not be dropped globally. |
| RepresentationTheory/SchurWeyl; SpinRepresentations | Main Layer 9 harmonic tensors and Layer 6 `Spin₆≃SL₄`. This roadmap's harmonic symmetric part and normalization adapters do not replace the general construction. |
| GeometryOfNumbersAndQuadraticArithmetic | §4.3 at `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md`:1530–1548, polynomial Fischer decomposition in the positive case. |
| PadicHodgeTheory; PadicPeriodRings | §§3.3,4.4,7.2,8.1 at `TauCetiRoadmap/PadicHodgeTheory/README.md`:682,894,1250,1378; period-ring §1.4. The larger-coefficient character inputs of §3.3 are imported from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.P7.1–P7.3; they are not an assertion that all characters have one cyclotomic weight. |
| SelmerIwasawaCohomology; ArithmeticGaloisRepresentations | §§2.7,4.9; §1.2. Unramified/Bloch–Kato local conditions, arithmetic Frobenius and cyclotomic weight `+1` agree. |

The seven existing gap slugs match between README and plan: `compact-matsushima`, `vhs-hodge-decomposition`, `quaternion-ramification-classification`, `norm-subgroup-restriction`, `quaternionic-doubling-residue`, `quaternionic-shimizu-lift`, `derham-local-system-cohomology`. Each has a named supplier and precise mathematical input. The related residue inputs form the specified quaternionic doubling contract, rather than an unrelated collection. No existing gap was treated as an unowned prerequisite or as a defect merely because it is not implemented. The de Rham gap is minimal after F01's repair; R09 requires the norm-support adapter or an explicitly declared remaining contract, not a broader Shimizu gap.

The required dependency command, run with the supplied config, `--depcheck`, `--name HodgeClassesForJacquetLanglands`, the supplied merge order, `--movable` and pinned content checkout, returned:

    depcheck: 236 roadmaps, 2155 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. Every Needs line and supplier paragraph was read; numerical order alone does not cure R09's missing hypothesis.

## Not verifiable

- No sampled source was inaccessible: all fifteen seeded locators were read from the certified published IP23 text. No reference request was added.
- The declared supplier gaps are future contracts. Their truth as completed formal library results is not certified by this review; their ownership, scope and matching declarations were checked.
- The absent geometric and automorphic carriers prevent formal elaboration of the README-only headline statements. Only the three actual Lean targets were elaborated. The adversarial calculations are mathematical checks, not formal proofs of the entire proposed library.

## Source issues

- **Error** in IP23 at Proposition 8.2, printed page 55: the source says the compact contraction has an extra factor `(-1)^ℓ`; it should be positive with its negative Fock and coefficient-pairing conventions; affects a stated result.
- **Error** in IP23 at §4.3, printed page 24: the source says to evaluate a norm-one character at `(t₁t₂)⁻¹α`; it should use an appropriate full idele-class character, since that argument need not have norm one; affects a stated result.
- **Misprint** in IP23 at §3.2, printed page 19: the source says quaternionic isotypic cohomology is concentrated in degree `2d`; it should be degree `d`, as used on page 98; affects nothing.
- **Misprint** in IP23 at the proof of Proposition 11.6, printed page 88: the source says the `(1,1)` Hodge pair with an unclosed parenthesis; it should close both coordinates, yielding `(k_v−1,k_v−1)`; affects nothing.
- **Misprint** in IP23 at the group diagram of §4.1, printed page 22: the source says the rank-one quaternionic block is an `E`-unitary group; it should be the `B`-unitary group used in §5.3.1; affects nothing.
- **Gap** in IP23 at the proof of Proposition 9.5, printed page 61: the source says the backward lift of the conjugate supplies the required local representation; it should identify its conjugate local components using self-duality on the norm subgroup, or conjugate the lift; affects the proof.
