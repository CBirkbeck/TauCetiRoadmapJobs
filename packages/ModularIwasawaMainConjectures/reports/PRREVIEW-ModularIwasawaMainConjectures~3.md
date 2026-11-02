# Review of ModularIwasawaMainConjectures (pull request #1499 at bb8b83c)

**Verdict:** needs changes

## R01 (P2) — Register both automorphic equality contracts

**Location:** `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:133` and line 135: “gap:tate-twisted-components” and “gap:central-critical-equality”; `packages/ModularIwasawaMainConjectures/design/plan.json:2`.

**Claim:** The ordinary, signed and central-critical endpoints have registered contracts for the additional automorphic equalities they consume.

**Witness:** The plan still lists eight gaps and neither slug. At k=2,p=5, both equalities require original evaluation (−1,1/6), whereas the untwisted endpoint gives (1,1). At k=4 the central-critical evaluation is (1,1/36).

Previous R01 remains. The corrected signed Check now uses the right contract, but naming it in the README does not register it where intake reads it. The existing Kato central-critical-specialization entry supplies reciprocity/control, and the generic automorphic-endpoints entry does not specify these twists.

**Exact repair:** Add both slugs to the plan's top-level gaps, owned by AutomorphicCongruences, matching README lines 133 and 135: the §4.5 equalities for r=1,k−1 and §2.21 reverse bound for r=1; separately the §2.2-hypothesis, p∤N central-critical equality at r=k/2, with twisted Betti factor and local corrections. Keep Kato's control entry separate. Test the entries at k=2, where all twists are 1, and k=4, where r=1,3,2 give (−1,1/6), (−1,1/216), (1,1/36). This concerns registration, not implementation of the settled proposed suppliers.

## R02 (P2) — Align the period gap in the plan with the fractional comparison

**Location:** `packages/ModularIwasawaMainConjectures/design/plan.json:31`: “for an X₀(N)-optimal parametrization and every odd p … up to ℤ_(p)^×”; compare `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:149` and lines 153–155.

**Claim:** The registered prerequisite requires a unit comparison between the absolute-cohomology and full-symbol period lines at every odd prime.

**Witness:** For 11a1,p=5, cφ=1 but the unhalved normalized plus-symbol value is 2/5, of valuation −1. Unit period scaling leaves that value nonintegral, contradicting the integral full-symbol generator requirement.

Previous R02 remains. The README correctly retains a nonzero fractional ratio and limits the unit conclusion; the plan still requests the stronger assertion. Source data: LMFDB11 line 431 and lines 477–482. The unhalved signed symbol and saturated lattice are specified in ModularSymbolsPadicLFunctions §1.1, `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1323` and line 1347. GrossZagierAndArithmeticHeights §3.7, `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:1264`, controls cφ, not the full-symbol boundary index.

**Exact repair:** Replace the plan's needs sentence by the README's nonzero fractional signed comparison, retaining boundary indices and isogeny compatibility, and require unitness only at odd good ordinary or multiplicative p with E[p] irreducible. Record that corrected contract for its named supplier. Keep the README's fractional formulation. The repair allows v₅(r_E⁺)≤−1 at 11a1, while the p=7 control has v₇(2/5)=0 and is compatible with the restricted unit range.

## Previous findings

- R01 — not repaired: README lines 133 and 135 retain both additional automorphic equality contracts; neither slug occurs in the plan's eight gaps. The signed Check repair does not change registration.
- R02 — not repaired: README lines 149–155 require a fractional period comparison, with a restricted unit conclusion; plan line 31 still asks for unit comparison at every odd prime.
- R03 — repaired: README line 1612 now names gap:central-critical-equality, computes (−1,1/6) versus (1,1), and explicitly separates Kato's reciprocity/control contract. No new mathematical problem was found in this change.

## Verified sound

:robot: Independent AI review. This is an incremental re-review of 2 changed lines since 1595b05. I verified all three previous findings, the changed §4.3 Check and its twist/equality/control dependencies, and reran the gate, dependency check, targeted build and elaboration. Untouched mathematics and its adversarial values are explicitly carried from [r2]. No pull-request file was changed.

**Gate and elaboration.** The supplied worker gate passes every check, including build. The independent gate rerun passes all text, import, metadata, folder, name and dependency checks; it does not print a build field. The separate `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested` succeeds (9183 jobs). Direct `lake env lean` on Suggested.lean exits 0 with precisely the three expected sorry warnings. HEAD is bb8b83c5c87337cfdba7436765db4628f717c409; both the outside-folder diff and the working-tree diff are empty.

The specified dependency command returns:

```text
depcheck: 204 roadmaps, 1500 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The change adds no supplier or dependency edge. The gate does not test the plan/README contract mismatches in R01 and R02.

A scratch copy printed `#check @name` for all four declarations and elaborated successfully. The definition retains its ring/module binders; the unipotent theorem retains IsDomain, DVR, square-zero and primitive-image hypotheses; the elliptic theorem retains p prime, p≥5, E.IsElliptic, the integral basis and residual surjectivity; the transcendence theorem retains the unit parameter, norm bound and algebraic j. No binder or signature changed. Suggested.lean is byte-for-byte unchanged from 1595b05. The three failed one-tactic padding probes and the headline/statability audit in [r2] are carried forward, not claimed as freshly rerun.

The headline list remains: integral unipotent quotient; ordinary and multiplicative main conjectures; period/Kato/ordinary/signed comparisons and Hida approximation; pointwise/family equalities and specialization; elliptic rational/integral main conjectures and the residual-image consequence; p-adic Mahler–Manin; heights and Schneider leading terms; rank-zero converse; Greenberg–Stevens and p-adic BSD implications. The three statable headlines remain the unipotent quotient, elliptic image/coinvariants and Mahler–Manin theorem. The module docstring names the absent arithmetic carriers for the remaining endpoints. This Check edit introduces neither a Lean declaration nor a new headline.

**Pinned declarations opened this round (three).** The pins in lake-manifest.json remain Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Declaration | Pinned file and line | Content verified |
| --- | --- | --- |
| WeierstrassCurve.tateModuleGaloisRepresentation | `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71` | Actual coordinatewise Galois action on the Tate module, not arbitrary matrices. |
| TauCeti.tateCurveAt | `TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70` | Native Tate equation evaluated at a unit q of norm below one. |
| cyclotomicCharacter | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:307` | Root-of-unity exponent character; the documented fallback without enough roots is trivial. The theorem uses the algebraic closure of ℚ. |

**Sources and affected citations.** The changed seeded target is §4.3. I also read the relevant §2.2 and §5.4 inputs, the equality contracts, §0.7 twist rule and §2.1 transport. The other seeded targets (§§0.1, 0.3, 0.4, 0.11, 1.1, 1.3, 3.9, 4.1, 4.4, 5.1, 5.8, 6.1) are untouched and retain [r2]'s values below; their full source audits were not repeated. No new unverified locator was added.

| Source or supplier | Locator checked now | Result |
| --- | --- | --- |
| LLZ | lines 2508–2513, 2522–2539; Theorem 6.5 and Corollary 6.6, pp.43–44 | Signed lattice has twist k−1; index one permits all η, index two only η=1; the equality retains the actual Coleman image and the (A)/(A′),(E) hypotheses. |
| FW | lines 1240–1266; §3.1.1, equations (3.1.1)–(3.1.3), p.22 | Tate twist r and Betti factor V(r−1)^+ must both be transported. |
| FW | lines 4016–4028 and 4044–4061; Theorem 5.1, p.68, Corollary 5.3 and proof, p.69 | Pointwise hypotheses remain intact. The central-critical equality and the finite-condition/control comparison are different inputs. |
| LMFDB14 | lines 534–550 | Exceptional image primes listed are 2 and 3, not 5. Independent point counts give #E(𝔽₅)=6 and a₅=0; this is database evidence for the image, not a formal certificate. |
| Skinner | lines 978–992, 1009–1011; §3.3 and note 8, p.25 | Optimal X₁ comparison and prime-to-p isogeny transfer use the stated hypotheses; the unrestricted full-symbol unit comparison is not supplied. |
| LMFDB11 | line 431, lines 477–482 | Special value and optimality/Manin data underlying the retained period negative control. |
| SelmerIwasawaCohomology | `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1492`, §3.7, read through roadmaps show | Tw_r(σ)=κ(σ)^−rσ and specialization at κ^−r agree with the changed Check. |
| ModularSymbolsPadicLFunctions | `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1323` and line 1347, §1.1, read through roadmaps show | Unhalved signed symbol and integral saturated full-symbol line confirm the period negative control. |
| GrossZagierAndArithmeticHeights | `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md:1264` and line 1306, §§3.7, 3.10, supplied open head | Manin-unit and isogeny results do not eliminate the separate full-symbol comparison. |
| KatoEulerSystems / AutomorphicCongruences | Target README lines 94–98, 110–135, 1064, 1608, 1764 | Proposed contracts retain separate owners. Their base publication condition remains settled; the additional equality slugs still require registration (R01). |

The object search through `roadmaps grep` covered the twist and central-critical equality terms on main and indexed open heads. The available board-package trees were also checked; no readable base README for the two proposed suppliers was found there. The changed line constructs no new carrier and duplicates no Lean declaration. The known proposed-owner publication condition is not re-raised. Main PadicMeasuresIwasawaAlgebras and EllipticCurves supplied the shape comparison. Unchanged ownership findings from [r2] are carried forward.

**Fresh adversarial computations (four rows).** Rational arithmetic and finite-field point counts were recomputed; the module example was calculated directly.

| Statement | Instances tried | Values computed on each side | Result | Change/provenance |
| --- | --- | --- | --- | --- |
| §4.3 changed Check: equality and augmentation | k=2,p=5,r=1, δ=−1,κ(γ)=6 | r=1=k−1=k/2; original evaluation ((−1)^−1,6^−1)=(−1,1/6); untwisted augmentation=(1,1). At k=4 the three evaluations are (−1,1/6),(−1,1/216),(1,1/36). | Equality contracts coincide at weight two, not in general weight. | Previous R03 repaired; R01 registration remains. |
| §4.3 signed-component restriction | p=5,k=2, η=1 and η=ω | ω(−1)=−1; twist sends original ω^−1 to signed 1, and original 1 to signed ω. LLZ allows indices {1,2} at 1 and {1} at ω. | The two conclusions in the Check are different and correctly restricted. | Fresh computation replacing [r2]'s stale-slug row. |
| §4.3 14a1 arithmetic | E=[1,0,1,4,−6] mod 5 and mod 3 | Affine point counts 5 and 5; including infinity gives 6 and 6; a₅=5+1−6=0, a₃=3+1−6=−2. At ℓ=2, 6 mod5=1≠0. | Supersingular a₅=0 and the nonsplit auxiliary-prime example remain consistent with the unchanged hypothesis checks. | No new problem. |
| Equality versus reciprocity/control input | H¹=Λe; z=Xe,H²=Λ/(X), versus z=e,H²=0 | Characteristic ideals (X)=(X) and (1)=(1); specialized z is 0 versus e. The second has span dimension 1, but ideal equality alone specifies no H¹_f membership. | Kato's finite-condition/control comparison remains separate from automorphic equality. | Changed sentence correctly names both roles. |

**Carried adversarial computations.** Every following row cites [r2], including rows that [r2] inherited from its predecessor. These are prior computed values, not a fresh full review. References to R01/R02 still denote the two unresolved contract defects above. The changed signed-consumer row has been replaced by the fresh rows; no stale R03 claim is carried forward.

| Statement | Instances tried | Values computed on each side | Result | Change/provenance |
| --- | --- | --- | --- | --- |
| Automorphic equality contracts, weight two | p=5,k=2,r=1, δ=−1,κ(γ)=6 | Required original evaluation (−1,1/6); untwisted augmentation (1,1). Ordinary, signed and central-critical r all equal 1. | Contract distinction is correct; registration still absent. | Carried from [r2]; not recomputed this round. |
| General-weight contract separation | p=5,k=4; r=1,3,2 | Ordinary (−1,1/6), signed (−1,1/216), central-critical (1,1/36). | Central-critical equality is not implied by specifying just the other two twists. | Carried from [r2]; not recomputed this round. |
| Trivial tame character versus Γ-evaluation | p=5,r=0,4 | Tame values both 1; Γ-values 1 and 1/1296. | Same tame label does not mean same specialization. | Carried from [r2]; not recomputed this round. |
| §2.1 full-tower semilinearity | κ(g)=6,r=1,2 | Coefficient action factors 6·6⁻¹=1 and 36·36⁻¹=1; inverse map evaluates γ at 1/6 and 1/36. | Inverse tautological sign matches SelmerIwasawaCohomology §3.7. | Carried from [r2]; not recomputed this round. |
| §2.1 Betti factor | r=1 and r=2 | V(r−1)^+ uses the original + and − eigenspaces, respectively; retaining V^+ for both gives the wrong second sign. | New contract keeps the twisted factor. | Carried from [r2]; not recomputed this round. |
| §1.5 ordinary consumer | r=1, analytic L=X, u=5 over ℤ₅[[X]] | char X_ord=(5X), versus (X) without defect; after inverting 5 both are (X). | New equality contract does not erase the period condition. | Carried from [r2]; not recomputed this round. |
| Fractional period contract | 11a1,cφ=1, symbol value 2/5 | v₅(2/5)=−1; if ratio r is a unit the normalized symbol still has valuation −1; integrality needs v₅(r)≤−1. | Unrestricted plan unit claim fails. | Carried from [r2]; not recomputed this round. |
| Non-Eisenstein period comparison | Same symbol at p=7 | v₇(2/5)=0; unit period scaling preserves 0. | Compatible with the irreducible good-ordinary range, not a proof from one symbol alone. | Carried from [r2]; not recomputed this round. |
| Period rescaling | P replaced by 5P; original normalized value 1 | New normalized value 1/5, versus 1 before; valuations −1 versus 0 at 5. | Rational proportionality alone does not preserve saturated integral generators. | Carried from [r2]; not recomputed this round. |
| Native determinant and representation convention | u=[[1,1],[0,1]] and diag(2,1) at p=5 | Determinants/cyclotomic values 1 and 2; u acts (x,y)↦(x+y,y). | Homological Tate action has cyclotomic determinant, not its inverse. | Carried from [r2]; not recomputed this round. |
| §3.6 full integral image | diag(2,1),diag(5,1) at p=5 | Determinants 2∈ℤ₅× and 5∉ℤ₅×; latter reduces to determinant 0. | First belongs to conclusion, second excluded by IsUnit. | Carried from [r2]; not recomputed this round. |
| §3.6 cyclotomic witness/quotient | u, identity, and [[1,5],[0,1]] | Images of σ−1 are ℤ₅e₁,0,5ℤ₅e₁; quotients ℤ₅,ℤ₅²,ℤ₅⊕𝔽₅. All determinants are 1. | Existence of a primitive unipotent is necessary; determinant 1 alone is insufficient. | Carried from [r2]; not recomputed this round. |
| §3.6 arbitrary closed GL₂ subgroup | H=det⁻¹(μ₄), p=5, modulo 25 | μ₄={1,7,18,24} mod25, reductions {1,2,3,4}; 6⁴=21≠1 mod25, so diag(6,1)∉H. | Full residual image does not force full integral image without full determinant. | Carried from [r2]; not recomputed this round. |
| Imported lifting and p≥5 | All determinant-one lifts of u mod p to mod p² | p=5: 125 lifts, all fifth powers [[1,5],[0,1]]. p=3: 27 lifts, cubes with upper entry 0,3,6. | Congruence step can vanish at 3; no small-prime overclaim. | Carried from [r2]; not recomputed this round. |
| §3.6 nonabelian commutator step | U=[[1,1],[0,1]], L=[[1,0],[1,1]] over 𝔽₅ | UL=[[2,1],[1,1]], LU=[[1,1],[1,2]], different; determinants both 1. For a=2, a²=4≠1. | Uses the nonabelian SL₂ perfectness/lifting argument, not commutativity. | Carried from [r2]; not recomputed this round. |
| §3.6 basis independence | Swap basis P=[[0,1],[1,0]] | P⁻¹uP=[[1,0],[1,1]], image of difference becomes ℤ₅e₂; quotient still ℤ₅; determinant stays 1. | Same-basis residual/integral signature transports correctly. | Carried from [r2]; not recomputed this round. |
| §5.4 zero-specialization branch | H¹=Λe,z=Xe versus z=e | Specializations 0 versus e; quotient characteristic ideals (X) versus (1), X-lengths 1 versus 0. | Main-conjecture equality and discrete local control are separate inputs. | Carried from [r2]; not recomputed this round. |
| §5.4 nonzero-specialization branch | L(f,k/2)=0 and nonzero specialized z in H¹_f | Span of z has dimension 1, versus dimension 0 for z=0. | Positive Selmer corank uses the named finite-condition/control adapter; it is not inferred from scalar vanishing alone. | Carried from [r2]; not recomputed this round. |
| Conventions: tame algebra | p=2, O=ℤ₂, C₂ | a+bδ maps to (a+b,a−b); (1,0) has no integral preimage, since a=b=1/2. After inverting 2 it does. | The product assertion is correctly restricted to odd p. | Carried from [r2]; not recomputed this round. |
| Conventions: Γ generator | p=2 versus p=3 | κ(γ)=5≡1 mod 4, whereas 3≡3 mod 4; at p=3, 1+p=4 is admissible. | Dyadic choice retained. | Carried from [r2]; not recomputed this round. |
| Conventions: scalar/contragredient dual | F₇ line with δ=2; cyclic Γ acting by 8 on ℤ/49 | Scalar dual eigenvalue 2, contragredient 4; Γ inverse 8⁻¹=43 mod 49. Neither pair agrees. | Inversion on Γ is needed even on the trivial tame component. | Carried from [r2]; not recomputed this round. |
| Conventions: nonabelian negative control | S₃ with two noncommuting permutations g,h | Precomposition in the same direction gives φ∘h∘g, whereas action by gh gives φ∘g∘h; inverse precomposition reverses both orders. | Scalar convention is used only over the commutative Iwasawa algebra. | Carried from [r2]; not recomputed this round. |
| §0.1 datum and determinant twist | k=2, κ(g)=4 | det(V_f)=1/4; det(V_f⊗det⁻¹)=(1/4)·4²=4. Rank remains 2; zero/rank-one representations are excluded. | Homological/cohomological distinction survives. | Carried from [r2]; not recomputed this round. |
| §0.1 ordinary filtration | rank-two T with saturated T⁺=Oe₁; nonsaturated πOe₁ | T/T⁺=O; wrong quotient O⊕O/π has torsion. | Saturation is essential and supplied. | Carried from [r2]; not recomputed this round. |
| §0.2 ordinary local condition | unramified A⁻=L/O; α=1, α=−1 at odd p, α≠1 | A⁻/(α−1)A⁻=L/O when α=1; 0 for α=−1 and for every nonzero α−1, since multiplication is surjective on L/O. | Split correction retained; strict/inertia kernels are not universally equal. | Carried from [r2]; not recomputed this round. |
| §0.2 global/dual zero control | all coefficient groups zero; nonzero discrete ℤ/p | Kernel=0 and dual=0 in first case; dual of ℤ/p has p elements, not zero. | Definitions determine the actual kernel/dual, not a free parameter. | Carried from [r2]; not recomputed this round. |
| §0.3 structure, finite errors | R/(π,X) and R/(X) | First module has characteristic ideal R but nonzero Fitting ideal (π,X); second has both ideals (X). | Finite-submodule hypotheses cannot be dropped from Fitting comparisons. | Carried from [r2]; not recomputed this round. |
| §0.4 period convention | m=0,1, P=−2πiΩ | Denominators −2πiΩ=P and (−2πi)²Ω=(−2πi)P. Using exponent m with Ω loses −2πi. | Source normalization correction retained. | Carried from [r2]; not recomputed this round. |
| §0.4 primitive p-factor | elliptic α=−1 versus α=1 at multiplicative p | 1−α⁻¹=2 versus 0; good ordinary factor is (1−α⁻¹)². | Split exceptional zero is distinguished. | Carried from [r2]; not recomputed this round. |
| §0.4 tame projection | p=3, measure δ₁−δ₋₁ | Pushforward to Γ=0; integral against the odd character=1−(−1)=2. | Trivial branch cannot interpolate all tame characters. | Carried from [r2]; not recomputed this round. |
| §0.5 integral/rational propositions | X=R/(π), analytic element 1 | Integral ideals (π) and R differ; localized ideals both equal R. For X=0 and analytic unit, both equal R. | Rational equality does not imply integral equality. | Carried from [r2]; not recomputed this round. |
| §0.6 arithmetic complex and determinant | complex [R→ᵃR] in degrees 1,2, a=X² | H¹=0, H²=R/(X²); inverse determinant valuation +2, not −2. | Cochain parity matches supplier. | Carried from [r2]; not recomputed this round. |
| §0.6 Euler correction | E_dual=2, z_primitive=1 | z_Σ=2; E_dual⁻¹z_Σ=1. Multiplying again gives 4. | Direction of primitive correction fixed. | Carried from [r2]; not recomputed this round. |
| §0.7 KMC and twist | p=5,r=1; p=3,r=2 | Tw₁(X)=(X−5)/6; Tw₂(X)=(X−15)/16. Tw_r(e_χ)=e_(χωʳ). | Twist moves both the tame character and the Γ-coordinate. | Carried from [r2]; not recomputed this round. |
| §0.7 dyadic localization | O=ℤ₂, height-one prime containing 2 versus not containing 2 | 2 is noninvertible in the former and invertible in the latter; the idempotent (1+δ)/2 exists only in the latter. | Kato's p=2 restriction is retained. | Carried from [r2]; not recomputed this round. |
| §0.8 HasRankOneCoinvariants and headline | u=[[1,1],[0,1]]; u=[[1,π],[0,1]]; u=1 | Quotients O, O⊕O/π, O² respectively. Only the first is free rank one. | Definition separates primitive image, torsion and trivial action. | Carried from [r2]; not recomputed this round. |
| §0.8 residual-unipotent negative control | g=[[1,1],[π,1+π]] | det g=1, reduction nontrivial unipotent; det(g−1)=−π, and coker(g−1)=O/π, rank 0. | Actual (g−1)²=0 is needed. README repairs FW's proof step. | Carried from [r2]; not recomputed this round. |
| §0.8 coefficient generality | O=F₂[[π]] and a ramified mixed-characteristic DVR, same u | u−1 maps (x,y)↦(y,0); square=0; quotient projection (x,y)↦y has kernel Oe₁. Both quotients are O. | No completeness or mixed-characteristic restriction added to the Lean theorem. Zero ring is excluded by IsDomain. | Carried from [r2]; not recomputed this round. |
| §0.8 zeta basis equivalence | H¹=Re, z=X²e; H²=0 or R/(X²) | Zeta quotient length 2; degree-two lengths 0 and 2. Divisors −2 and 0 respectively. | Basis iff equal lengths; equality of both ideals, not one divisibility. | Carried from [r2]; not recomputed this round. |
| §0.8 denominator clearing | z=π⁻¹e, H²=0; clear by π or π² | With π: quotient length 0, correction +1; with π²: quotient length 1, correction +2. Both divisors equal 1. | Fractional zeta lattice has denominator-independent divisor. | Carried from [r2]; not recomputed this round. |
| §0.9 good-pair/period scaling | differential scale 2, Betti scale 3; c=π,d=π⁻¹ | Pair scaling 3/2; total period defect cd=1. With d=1 the defect is π. | Rational nonzero period ratios do not determine integral units. | Carried from [r2]; not recomputed this round. |
| §0.10 ordinary comparison | char(H²)=char(H¹/Z)=(X); analytic term uL | Equal cohomological lengths cancel; ordinary ideal becomes (uL). If u=π,L=X, this is (πX), not (X), but rationally equal. | Period-defect hypothesis retained. | Carried from [r2]; not recomputed this round. |
| §0.10 involution | f=X−7 | ι(f)=−(8X+7)/(1+X), associated to X+7/8; at X=7, f=0 but X+7/8=63/8. | Cannot silently omit ι from the natural dual sequence. | Carried from [r2]; not recomputed this round. |
| §0.11 signed kernels and basis | Col(z)=(1,0), U⁻¹=[[1,1],[0,1]] | Old second coordinate 0; new second coordinate 1. With a unit scalar multiple, both kernels agree. | Chosen Wach basis is part of the data. | Carried from [r2]; not recomputed this round. |
| §0.11 Tate orthogonality | perfect pairing O² with coordinate-one kernel Oe₂ | Orthogonal discrete line is the matching first-coordinate line; annihilator of 0 is the full dual and annihilator of the full module is 0. | Orthogonal local condition is not the Coleman kernel itself. | Carried from [r2]; not recomputed this round. |
| §0.12 actual-image quotient | I=XR,L=X²; I=πR,L=πX | Quotients have char (X) in both examples. Ambient quotients have char (X²) and (πX). | Image correction removes one X or one π, respectively. | Carried from [r2]; not recomputed this round. |
| §0.13 signed iff | height-one exact-sequence lengths a=2,b=5,d=2 | Length(X)=b−a+d=5; KMC says a=d, hence SMC says length(X)=b. If d=3, length(X)=6 and both equalities fail. | Both directions tested; finite local terms vanish only after localization. | Carried from [r2]; not recomputed this round. |
| §0.13 component restriction | p=5,k=2,η=1 versus η=ω | ω(−1)=−1; i=2 is allowed at η=1 only. Untwisted KMC reaches η=ω, not η=1. | No index-two conclusion from the wrong component. R01. | Carried from [r2]; not recomputed this round. |
| §1.1 residual predicates | split 11a1 at ℓ=11,p=7; nonsplit 14a1 at ℓ=2,p=13 | Inertia invariant dimension 1 in both; decomposition invariant dimension 1 versus 0. Valuations 5,6 are nonzero mod 7,13. | SU and FW auxiliary conditions are distinct. | Carried from [r2]; not recomputed this round. |
| §1.1 local exceptional condition | ordinary elliptic p=3 with a₃=±1; F₉ unit generator | a₃²=1 in F₃; generator of F₉× has square of order 4, not 1. | The p=3 elliptic obstruction is not an assertion about all characteristic-three fields. | Carried from [r2]; not recomputed this round. |
| §1.2 unipotent inertia | inertia entry a=1 versus a=π | Image Oe₁ versus πOe₁; quotient O versus O⊕O/π. | Residual ramification supplies the primitive entry; rank-one rational image alone is insufficient. | Carried from [r2]; not recomputed this round. |
| §1.3 SU assembly | corrected analytic ideals (c_fL_f),(c_gL_g), c_f=π,c_g=1 | Product has valuation v(L_f)+v(L_g)+1; dropping c_f loses 1. | Reverse and forward bounds use the same source periods. | Carried from [r2]; not recomputed this round. |
| §1.4 FW ordinary theorem | 11a1 split ℓ=11 versus 14a1 nonsplit ℓ=2 | D_ℓ-invariant dimensions 1 versus 0; FW1.6 fails versus holds. | No split-prime overclaim. | Carried from [r2]; not recomputed this round. |
| §1.5 ordinary Selmer form | cohomological equality, u_p=π versus u_p=1 | char X=(πL) versus (L); rationally the same. | Integral canonical conclusion remains conditional on the unit defect and R01. | Carried from [r2]; not recomputed this round. |
| §1.6 approximation, generators | p=3,m=1, ideals (3,X),(3,2X) | Ideals equal; coefficients of X in generators are 1 and 2, unequal mod 3. | Correctly compares ideals, not chosen generators. | Carried from [r2]; not recomputed this round. |
| §1.6 approximation, coefficients/periods | p=uπ²,m=1; source functions πX and πX, ratios π and 1 | Mod-p precision is mod π², not mod π; full-symbol ideals become (X,pᵐ) and (πX,pᵐ), unequal for large m. | Lattice precision and period corrections are independent inputs. | Carried from [r2]; not recomputed this round. |
| §1.6 small-prime level | p=3,M=2,r=1 versus M=1 | Levels 6 versus 3; Γ₁(6) is torsion-free while Γ₁(3) admits order-three torsion. Auxiliary q excludes M=1. | Small-prime control range matches the stated route. | Carried from [r2]; not recomputed this round. |
| §1.7 multiplicative endpoint | k=2, odd p; source ratio c=π | k−2=0 is divisible by p−1; resulting ideal is (πL), becoming (L) only with unit c. | Source-normalized theorem and canonical theorem are separated. | Carried from [r2]; not recomputed this round. |
| §2.2 FW pointwise | 14a1,p=5; 11a1,p=7 | a₅=0 and nonsplit auxiliary ℓ=2; a₇=−2 with a₇²=4≠1 mod7 and split auxiliary ℓ=11. | First uses locally irreducible case with μ nontrivial; second locally reducible case permits μ=1. | Carried from [r2]; not recomputed this round. |
| §2.3 ordinary/signed consequences | p=5,k=2,δ=−1 | Untwisted theorem label gives +1; needed trivial T_pE label pulls back to −1. Index-one transported component has ω(−1)=−1. | Conditional equalities are mathematically distinguished; register R01. | Carried from [r2]; not recomputed this round. |
| §3.1 absolute versus full-symbol period | 11a1,p=5 and p=7, symbol 2/5,cφ=1 | v₅(2/5)=−1; v₇(2/5)=0. A unit Néron/full-symbol ratio would leave a nonintegral value at 5. | README negative control refutes old plan gap. R02. | Carried from [r2]; not recomputed this round. |
| §3.1 torsion coefficient boundary | Hom(C₃,ℤ₃) versus Hom(C₃,F₃) | First is 0; second has 3 elements. | Weight-two torsion-free parabolic comparison does not generalize to F₃ coefficients. | Carried from [r2]; not recomputed this round. |
| §3.2 elliptic analytic function | 11a1,p=7; multiplicative α=−1,1 | Trivial-character value (1−α⁻¹)²/5; multiplicative multipliers 2,0. | Néron normalization and exceptional branch agree with interpolation. | Carried from [r2]; not recomputed this round. |
| §3.3 MMC/isogeny | degree d prime to p versus d=p | Multiplication by d is an automorphism of T_pE in first case; multiplication by p on ℤ_p has quotient F_p in second. | Prime-to-p transfer valid; p-isogeny needs lattice and period corrections. | Carried from [r2]; not recomputed this round. |
| §3.4 BCS rational endpoint | ideals (pX),(X) | After inverting p both equal (X); integral μ values 1 and 0 differ. | Rational conclusion does not force an integral one. | Carried from [r2]; not recomputed this round. |
| §3.5 BCS integral endpoint | u=[[1,1],[0,1]] on T_pE | Quotient ℤ_p; π-entry variant gives ℤ_p⊕F_p. | Integral image condition is stronger than a rational rank-one condition. | Carried from [r2]; not recomputed this round. |
| §3.7 sigma/Frobenius | 11a1,p=7,α≡5 mod7 | F roots α,7/α; φ roots α/7,α⁻¹ with valuations −1,0; α⁻¹≡3. The F-unit line is the φ-slope −1 line. | Correct normalization avoids the source's opposite eigenline. | Carried from [r2]; not recomputed this round. |
| §3.7 sigma differential correction | 11a1,b₂=−4; ω↦2ω | c=(−4−E₂)/12 versus wrong −E₂/12, difference 1/3. E₂ scales by 1/4, log² by 4, product unchanged. | b₂ correction and C⁻² scaling are essential. | Carried from [r2]; not recomputed this round. |
| §3.7 formal oddness | 14a1,a₁=1 | σ=t+t²/2+…; t(−P)=−t−t²+… gives −t−t²/2. Substituting −t gives −t+t²/2. | Formal inverse, not ordinary negation of t, is required. | Carried from [r2]; not recomputed this round. |
| §3.7 zero/torsion/extension | O; nP=0; 2P and 4P in H | h(O)=h(P_tors)=0; h(2P)/4=h(4P)/16. The affine quotient at O would be 0/0. | Total height assigns zero separately and does not divide at O. | Carried from [r2]; not recomputed this round. |
| §3.7 Mahler–Manin headline | q=p,p²,−2 at p=2; q=0,1 | Norms p⁻¹,p⁻²,1/2 and logarithms 0; algebraic q forces transcendental J. q=0 is not a unit; q=1 has norm 1. | Correct domain includes p=2 and excludes the two junk inputs. | Carried from [r2]; not recomputed this round. |
| §3.7 regulators | ranks 0,1,2; height scale 2; torsion order 5 | Empty determinant 1; determinants scale by 1,2,4. Colmez's rank-zero torsion-adjusted regulator is 1/25. | No duplicate torsion denominator; nondegeneracy is not built into definition. | Carried from [r2]; not recomputed this round. |
| §3.8 flat cohomology/duality | H=Q_p/Z_p, Z/p², and their mixed variant | Duals M=ℤ_p,Z/p²; (Div H)∨=ℤ_p,0; (H/Div H)∨=0,Z/p². Mixed free/torsion parts separate. | Free part is not identified with torsion. Zero abelian variety gives all groups 0. | Carried from [r2]; not recomputed this round. |
| §3.8 heights and isogeny | rank-one analytic value a; rank-two matrix diag(a,b); φ=[2] | Algebraic values −a and determinant ab; isogeny sides both 2h(P,Q). Character scale 2 multiplies rank-two determinant by 4. | Sign and bilinearity consistent. | Carried from [r2]; not recomputed this round. |
| §3.8 multiplicative correction | formal lifts u=v=1+p | Correction log_p(1+p)²/log_p(q_E), valuation 2−v_p(log_p q_E); at u=1 it is 0. | Omitting correction changes the height; q_E denominator is covered by transcendence. | Carried from [r2]; not recomputed this round. |
| §3.8 coordinate change | F(T)=aTʳ; T=κ(γ)ˢ⁻¹−1, l=log κ(γ) | s-leading coefficient alʳ; inverse coordinate multiplies by (−1)ʳ. For split rank0, T-coefficient is ℒA/l. | Extra split factor l⁻¹ is not absorbed into rank-zero regulator. | Carried from [r2]; not recomputed this round. |
| §3.9 Schneider abelian theorem | A=0; abstract pairing diag(1,0) with a one-dimensional point subspace | A=0: characteristic product 1, order0, determinant1. Restricted pairing determinant1 but full determinant0. | Sha/flat-space condition is necessary for the torsion deduction. | Carried from [r2]; not recomputed this round. |
| §3.9 elliptic leading terms | rank0 ordinary 11a1,p=7 with stated Sha=1; nonsplit fibre I₆ of 14a1 at2 | Leading value up to units (1−α⁻¹)²·5/25; arithmetic component size2 versus geometric6. | Uses arithmetic Tamagawa factors and stated finiteness/nondegeneracy. | Carried from [r2]; not recomputed this round. |
| §3.9 multiplicative order | split rank r=0; nonsplit rank0 | Orders 1 and 0 respectively; split T-coefficient ℒA/l versus nonsplit 2A. | Strict/inertia local distinction matches the exceptional zero. | Carried from [r2]; not recomputed this round. |
| §4.1 universal-family domain | 14a1,p=5,Σ empty; nonreduced ring O[ε]/ε² | Residual inertia at2 is nontrivial since 6≠0 mod5; Σ empty impossible. Nonzero ε has square0, so that ring is not the specified regular domain. | Admissible ramification and regular-base hypotheses exclude both wrong inputs. | Carried from [r2]; not recomputed this round. |
| §4.1 restriction of scalars | finite free algebra B=R⊕R, scalar map multiplication by a | Determinant over R is a², not a. | Restriction/norm is not identification of Frac B with Frac R. | Carried from [r2]; not recomputed this round. |
| §4.2 derived specialization | [R→ˣR], R→R/(X)=O | Specialized differential=0; cohomology O in both adjacent degrees, Tor₁^R(R/(X),O)=O. Alternating determinant factors cancel. | Ordinary tensor of H² alone misses the degree-one term. | Carried from [r2]; not recomputed this round. |
| §4.3 signed theorem | 14a1,p=5,k=2,a_p=0 | (A) true; k−1=1 gives ω on untwisted transport and 1 only with the extra twisted equality. | Intersects source ranges and remains conditional on R01. | Carried from [r2]; not recomputed this round. |
| §4.4 image removal | a_p=0, η=1 and η≠1 | Col₁ image R in both; Col₂ image R at η=1, XR at η≠1. For z=X², quotient lengths 2 versus1. | Cannot drop Col₂ image correction on a nontrivial component. | Carried from [r2]; not recomputed this round. |
| §4.5 signed labels/multipliers | a⁻=p, I=R,z=X | Multiplication gives I′=pR,z′=pX; both corrected quotients ≅R/(X). Ambient ideals (X),(pX) differ. | Corrected integral iff valid without multiplier-unit assumption; principal iff needs it. | Carried from [r2]; not recomputed this round. |
| §4.5 descent/twist | Δ=C₄,p=5; p=7,δ eigenvalue2,η(δ)=4 | Average idempotent values 1 on trivial,0 on quadratic; 2·4=1, while 2·2=4≠1. | Twist by η, not η⁻¹, selects the needed discrete component before dualizing. | Carried from [r2]; not recomputed this round. |
| §5.1 imprimitive factors | primitive generator X, removed Euler factor X−p; Σ empty | Imprimitive generator X(X−p), degree2; empty product1 leaves X unchanged. | Same nonzero factor multiplies both sides; no Frobenius factor at p is introduced. | Carried from [r2]; not recomputed this round. |
| §5.2 coefficient extension | ramification e=2 with p=uπ², series pX³ | μ_p=1,λ=3; μ_π=2,λ=3. | Coefficient extension scales μ by e, not λ; faithful flatness retains ideal equality. | Carried from [r2]; not recomputed this round. |
| §5.3 μ/λ lifting | f=π,g=1; f=πX²,g=2πX² at odd residue characteristic | First localized ideals agree but μ=1 versus0. Second μ=1,λ=2 on both and ratio2 is a unit. | Equal μ removes the remaining uniformizer exponent; zero series is excluded. | Carried from [r2]; not recomputed this round. |
| §5.5 L-invariant | formal Tate parameter q_E; wrong algebraic q=p | ord_p(q_E)>0 and log_p q_E≠0, so ℒ≠0; for q=p, ord=1 but log=0, hence ℒ=0. | Algebraicity of j plus Mahler–Manin excludes the wrong parameter. | Carried from [r2]; not recomputed this round. |
| §5.6 MTT exact/unit propositions | 11a1 rank0,torsion5,c₁₁=5,Sha=1 | R_MTT=1/25; predicted value (1−α⁻¹)²/5, matching interpolation. Dividing by torsion² again gives wrong denominator125. | Exact versus unit formula and torsion normalization agree. | Carried from [r2]; not recomputed this round. |
| §5.6 degenerate height | r=1, regulator0 | Leading coefficient prescribed at order r is0; actual order may exceed r. | Lower bound rather than exact order is correct without nondegeneracy. | Carried from [r2]; not recomputed this round. |
| §5.7 Greenberg–Stevens | L(E,1)≠0 versus 0, split p | Derivative ℒ·L(E,1)/Ω is nonzero versus0; first case order1, second gives no simple-zero conclusion. | Exact-order consequence has the needed nonvanishing. | Carried from [r2]; not recomputed this round. |
| §5.8 main-conjecture/BSD implication | height matrix diag(1,0) versus diag(1,1) | Determinants0 versus1; in the latter coefficient is nonzero and order equals rank (plus1 if split). | Does not infer nondegeneracy merely from the main conjecture. | Carried from [r2]; not recomputed this round. |
| §5.9 criticality | weights k=2 and k=4, homological representation and its Tate dual | Gamma factors at s=1 reduce to Γ(1)=1 and Γ(k−1)=1 or 2, respectively; neither has a pole, so both r-values are 0. | Criticality is checked on the Tate dual, not the untwisted linear dual. | Carried from [r2]; not recomputed this round. |
| §5.9 Greenberg projection | p=5, Gal(F∞⁺/Q∞)=C₂; rational test R/(p),analytic1 | Idempotent (1+c)/2 gives eigenvalues1,0. Rational ideals R=R, integral ideals (p)≠R. | Trivial projection is integral; other tame components and μ cannot be discarded. | Carried from [r2]; not recomputed this round. |
| §5.10 elliptic examples | Direct finite-field point counts | 11a1: #E(F₂)=5,#E(F₃)=5,#E(F₅)=5,#E(F₇)=10, so a₂=−2,a₃=−1,a₅=1,a₇=−2. 14a1: #E(F₃)=6,#E(F₅)=6,#E(F₁₃)=18, so a₃=−2,a₅=0,a₁₃=−4. | README coefficients agree. Discriminants compute to −11⁵ and −2⁶7³. | Carried from [r2]; not recomputed this round. |
| §5.11 higher-weight example | Expand q∏(1−qⁿ)⁴(1−q⁵ⁿ)⁴ through q¹³ | Coefficients 1,−4,2,8,−5,−8,6,0,−23,20,32,16,−38. At p7: discr at2=−16≡5 nonsquare; at5, −5⁻¹≡4≠1. | Arithmetic diagnostics agree; weight4≢2 mod6 excludes SU, while level-one weight4 rank=0 supports the ramification argument. | Carried from [r2]; not recomputed this round. |
| §6.1 anticyclotomic interface | inert ℓ, cyclotomic versus anticyclotomic tower; scalar π | Anticyclotomic Frobenius=1; cyclotomic Frobenius need not be1. (π) and (1) agree only after inverting π. | Does not transplant the cyclotomic local-factor theorem or claim integral descent. | Carried from [r2]; not recomputed this round. |
| §6.2 Eisenstein transfer | 11a1,p5; T=ℤ₅(1) | E[5] has rational line; after inverse cyclotomic twist an element ω=2 acts by3 on it. For T, untwisted dual invariants0, Tate-dual invariants Q₅/Z₅. | Rational torsion alone does not prove invariants of the untwisted dual; the extra split-Cartan calculation is needed. | Carried from [r2]; not recomputed this round. |
| §6.3 downstream transfers | p3,a₃=±3 versus a₃=0; split multiplicative α=1 | First has a₃≠0 and is outside the Pollack dictionary; latter has a₃=0. Split strict/inertia correction=L/O, not0. | Supersingular a_p=0 and multiplicative local-condition restrictions remain explicit. | Carried from [r2]; not recomputed this round. |
| Source-error control used in scope | F₅-plane x+y+z=0 | Plane has25 points; all three pair projections have25 points; ambient space125 points. Intersection z=0 has5 points, not25. | Refutes both printed Hida linear-algebra conclusions; not an error copied into a roadmap target. | Carried from [r2]; not recomputed this round. |

There are 102 carried rows and four fresh rows, 106 total.

## Not verifiable

- The base KatoEulerSystems and AutomorphicCongruences specifications remain proposed supplier contracts as stated in README line 9. Their publication and implementation are not certified; this is the settled external-owner condition, distinct from the local plan repairs R01/R02.
- BSDGP, Kobayashi and Silverman remain settled uncertified; Serre and Jones remain settled waived. They were not requested again. Their unchanged uses retain [r2]'s limits.
- The prior OCR limitation for src18 Theorems 2 and 2′, p.342, is carried from [r2]. The changed Check does not touch those leading-term formulas; their exact typography was not re-audited.
- This incremental review does not redo the untouched source/ownership audit or certify proofs of declared supplier gaps. Only the affected source and supplier passages listed above were reopened.

No new source request was necessary. No source or manifest was changed. All build and elaboration processes have completed.

## Source issues

- **Gap** in FW at Corollary 5.3 proof, printed p.69 (lines 4048–4061): the source says untwisted augmentation gives the central-critical Selmer conclusion; it should explicitly transport the tame component, Tate twist, Betti factor and local control before augmentation; affects the proof.

This carries the prior issue, whose affected proof passage was reopened this round; no new source issue was found in the Check repair.

[r2]: PRREVIEW-ModularIwasawaMainConjectures~2.md
