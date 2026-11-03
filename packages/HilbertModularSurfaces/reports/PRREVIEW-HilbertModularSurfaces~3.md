# Review of HilbertModularSurfaces (pull request #1730 at a290b8f)

**Verdict:** needs changes

Six findings: three P1 and three P2. The gate passes. Locations below abbreviate `TauCetiRoadmap/HilbertModularSurfaces/README.md` as README and `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean` as Lean. The worktree was not edited. This is a full review, including unchanged passages.

## R01 (P1) — The raw-vector cusp parametrisation identifies distinct orbits

**Location:** README:562–568, “`Γ_i(𝔑)_𝔟\(F² ∖ 0) → 𝒫_i(𝔑)_𝔟`”; “the `SL` versions with `R^{×2}` in place of `R^×_{>0}`”.

**Claim:** The two independent unit quotients in the proposed target destroy injectivity for raw Γ₁-vector orbits. Projectivising afterwards does not make the preceding bijection true.

**Witness:** In R = ℤ[φ], φ² = φ+1, take 𝔑 = (3), 𝔟 = R, u = φ². Vectors (0,1), (0,u) have identical data. A Γ₁ matrix carrying one to the other would require d = u ≢ 1 mod 3.

Indeed both have 𝔰 = 𝔐 = R. Their second residues become equal after quotienting by positive units; u is also a unit square, so the proposed SL variant has the same defect. But u−1 = φ is a unit, hence nonzero modulo (3). In the pinned d ≡ 1 convention the second residue must be retained before projectivisation. The problem is present in the cited raw-vector statement itself: `DasguptaKakde2021` lines 322–332, Lemma 3.6, preprint p. 9; `assaf` lines 238–264, Lemma 3.1.8, pp. 5–6.

**Repair and retest:** Correct the raw-vector target for the pinned Γ₁: quotient the first residue factor by positive units, retain the second factor without that quotient, and prove the inverse on those data. For Γ₁¹ retain both raw factors; derive Γ₀¹ using the inverse-diagonal residue-unit action, rather than substituting squares into two independent quotients. Derive the Γ₀ and projective parametrisations from the actual actions, explicitly taking the Fˣ quotient only at the projective step. The corrected raw second residues are 1 and u, distinct modulo 3; after projectivisation [0:1] = [0:u], as required. Add this negative-control Check. Also correct the attribution at README:141 and :566: Dasgupta–Kakde already use **d ≡ 1** (`DasguptaKakde2021` lines 151–167, p. 5); only Assaf's convention requires the stated W transport.

## R02 (P1) — The CM dictionary counts a nonoptimal suborder as another elliptic point

**Location:** README:933–938, “a bijection … to the `Γ`-conjugacy classes of pairs `{φ, φ̄}` of embeddings of CM orders `S` with `S^× ⊋ R^×`”.

**Claim:** This target includes all embeddings, whereas an elliptic point determines its full optimally embedded order. Passing to that order in the next sentence does not impose optimality on the claimed bijection.

**Witness:** Let R = ℤ[√2], A = (0,−1;1,√2), and 𝒪 = M₂(R). A⁴ = −I. Both R[A] ≅ ℤ[ζ₈] and its proper suborder R[A²] ≅ R[i] embed in 𝒪 and fix the same point; their indices differ by 2.

Here A² = √2 A−I, so [R[A]:R[A²]] = N(√2) = 2. Both orders have units outside Rˣ. Their embeddings are not conjugate order-embedding pairs, since their source orders have different discriminants. Nevertheless their fixed point is the same pair ((−√2+i√2)/2,(√2+i√2)/2), with full projective stabilizer of order four. This is precisely the distinction needed by the order-two versus order-four counts in the D = 8 worked example. The decomposition into optimal overorders is stated at `assaf` lines 654–670, immediately after its overbroad dictionary.

**Repair and retest:** State the dictionary using optimal embeddings of S = K ∩ 𝒪, with the actual stabilizer Sˣ/Rˣ for GL and μ(S)/{±1} for SL required to be nontrivial (and of order q when counting order q). Treat R[γ] only as a starting suborder; pass to its unique optimal overorder and count that point once. The displayed embedding of R[i] is then excluded as nonoptimal, while R[A] contributes the single order-four point. This does not remove genuinely optimal R[i] embeddings giving order-two points elsewhere. Add this example to the dictionary's Checks and align §3.4's indexing with it.

## R03 (P1) — An intersection matrix alone does not define an elliptic configuration

**Location:** README:1491–1495, “a connected configuration of curves whose intersection matrix is that of a singular fibre of an elliptic fibration in Kodaira's list”.

**Claim:** The supplied definition omits the genera and geometric incidence conditions of a Kodaira configuration. Under this definition §5.3(ii) is false even for a simply connected smooth projective non-rational surface.

**Witness:** Two general hyperplane sections of a smooth quintic surface have genus 6, squares 5, and intersection 5. Blow up three common points and four additional points on each. Their matrix becomes (−2,2;2,−2), but the surface still has κ = 2.

The two strict transforms are connected and meet transversely in two points. Their matrix is exactly that of an I₂ fibre. The quintic is simply connected, with K = H ample; blowing up preserves its fundamental group and Kodaira dimension. Thus every stated hypothesis holds, but the proposed conclusion κ ∈ {0,1} fails. The union has arithmetic genus 6+6+2−1 = 13, not 1. The readable secondary source, `assaf` lines 1075–1088, refers to van der Geer's definition without supplying this matrix-only paraphrase; the book definition could not be inspected.

**Repair and retest:** Replace the paraphrase by the full geometric definition: specify component genera, multiplicities, and intersections/singularities for each permitted Kodaira configuration, including the special irreducible cases. State the precise hypotheses of the configuration criterion on those objects. For I₂ require two smooth rational components meeting transversely twice. The quintic example is then excluded by genus 6 ≠ 0, while a genuine I₂ configuration has arithmetic genus 0+0+2−1 = 1. Keep both as discriminating Checks; a numerical matrix predicate cannot substitute for this geometry.

## R04 (P2) — The two-form pullback law divides by a possibly zero function

**Location:** README:483–484, “Pullback … multiplies `f dz₁ ∧ dz₂` by the ratio of `f ∣_{(2,2)} γ` to `f`”.

**Claim:** The section quantifies over holomorphic f, which may vanish. The ratio is not a globally defined holomorphic multiplier.

**Witness:** Take f(z₁,z₂) = z₁−i, γ = (1,1;0,1), and z = (i,i). Then f(z) = 0, whereas (f ∣γ)(z) = 1. The pullback coefficient is 1; the proposed ratio is undefined.

**Repair and retest:** State γ*(f dz₁∧dz₂) = (f ∣_(2,2) γ) dz₁∧dz₂ directly. Mention a ratio only on the open set f ≠ 0, or explicitly as a meromorphic expression. The direct identity gives coefficient 1 = 1 at the displayed zero, and coefficient 1 = 1 for the identity acting on f = 1. Add the zero example; do not restrict the main two-form theorem to nowhere-vanishing forms.

## R05 (P2) — The maximal-order minus-period construction already has an earlier owner

**Location:** README:46–49 and :725–734, “the Hirzebruch–Jung continued fraction of an oriented lattice and its period”; “Among oriented bases whose quotient is reduced, the period is independent up to cyclic rotation”.

**Claim:** The scope and supplier contracts omit the existing construction for narrow ideal classes in AutomorphicSpectralTheory §4.17a. The arbitrary multiplier-order extension here is broader, but that does not give the maximal-order case a second owner.

**Witness:** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md`:2643–2656 constructs the reduced irrational and periodic minus cycle for A ∈ Cl⁺(K), with representative transport. Its D = 28 Check gives (3,6) and primitive norm-one unit 8+3√7, exactly the present example.

**Repair and retest:** Cite AutomorphicSpectralTheory §4.17a in Scope and ownership and the supplier contracts for its narrow-ideal-class construction. State explicitly that the retained extension is to full lattices with arbitrary multiplier order, together with the surface resolution and compatibility with that supplied construction. There is no upward edge: AutomorphicSpectralTheory is an earlier supplier. At D = 28 the two constructions must identify the same cyclic period (3,6), length 2, digit-minus-three sum 3, and multiplier 8+3√7. Keep the general nonmaximal-order theorem; do not narrow it to maximal orders.

## R06 (P2) — The pinned proper-action theorem has an SL₂ hypothesis

**Location:** README:235–237, “`UpperHalfPlane` with the `GL(2, ℝ)⁺` Möbius action … its manifold structure and its proper action”.

**Claim:** This supplier contract attributes properness to the GL₂⁺ action. Mathlib proves properness for SL₂(ℝ); the GL₂⁺ action is not proper.

**Witness:** Every tI with t>0 fixes i. These matrices form a closed noncompact subgroup of its stabilizer, whereas proper actions have compact stabilizers. The pinned instance is `UpperHalfPlane.instProperSMul : ProperSMul SL(2, ℝ) ℍ`.

The declaration is in `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean`:122. Its discrete-subgroup consequence at :128 also assumes a subgroup of SL₂(ℝ), not GL₂⁺(ℝ). The file's introduction explicitly distinguishes continuous GL action from proper SL action.

**Repair and retest:** Name and scope the SL₂ properness instance in the contract; keep the GL₂⁺ action and scalar kernel as separate facts. Continue obtaining proper discontinuity of the effective Hilbert arithmetic group from the named ShimuraVarieties contract, as §0.4 already does. In the scalar test, det(tI)=t², so positive scalar matrices in SL₂ have t=1, and the full SL stabilizer is the compact rotation group. The GL scalar obstruction is removed by the effective quotient, not by dropping the SL hypothesis from Mathlib's theorem.

## Verified sound

### Previous findings, checked before the new review

| Finding at 557fdfd | Status at this head | Passage and retest |
|---|---|---|
| Previous R01: duplicate HilbertModularForms groups/cusps/forms | Repaired | README:28: “The groups, their action, their cusps and the spaces of holomorphic forms are HilbertModularForms'”. §§0.3–0.5, 1.1, 1.4 and the supplier table now import the named sections. I resolved these against its readable head. |
| Previous R02: nonprincipal components allegedly not commensurable | Previous objection withdrawn; the head's correction is valid | README:1254–1279 explicitly proves commensurability and gives the nonprincipal-ideal example. For R = ℤ[√10], 𝔟 = (2,√10), the two intersection indices are 3 and 3, giving generalized index 1. The previous claim of infinite index was false. |
| Previous R03: unused hV in period_dual | Repaired | README:881–883: “the period depends on the lattice alone … no hypothesis on the multiplier group of E”. Lean:152–158 has no hV. M = ℤ[√3], E.M = √3M, with unit indices 1 and 2, still gives 1 = −(−1). |
| Previous R04: stale heading citations | Repaired | Lean:65, :69, :117, :131, :165 now cite Conventions; there is no obsolete Pinned conventions heading. |

No current finding re-raises a finding settled as not actionable. R05 concerns a different owner and object from the repaired HilbertModularForms finding.

### Gate, elaboration and headline coverage

The worker's gate at this exact head reports every check zero and `OK`, including build, imports, stray files, outside-folder, dependencies, sorry-data, and set_option. The outside-folder diff is empty. Independent dependency check output:

```text
depcheck: 204 roadmaps, 1642 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. All *Needs:* lines and supplier-table entries were read. No declared supplier gap is present. The permitted movable placement is not treated as a defect.

Direct `lake env lean` elaboration of the requested module succeeded with exactly four `sorry` warnings, at Lean:86, :145, :152 and :175. A scratch copy with `#check @name` for all 16 declarations also elaborated. Six elementary definitions discard the unused NumberField section binder, as their explicitly broader README:736–739 definitions intend; the number-field, degree-two and distinct-embedding hypotheses remain on the three cusp theorems. The zeta theorem retains total reality, degree two, meromorphy, analyticity at −1, and agreement on Re(s)>1. No correction to a signature was needed.

The README's headlines are the fundamental multiplier and periodicity theorem (§2.2), cusp resolution (§2.4), negative definiteness and duality (§§2.5, 2.7), elliptic-point counts and resolution (§§3.4–3.10), Siegel's value (§4.2), Chern/Hodge/cusp-form comparisons (§§4.4, 4.6–4.8), and the rationality/classification/general-type results (§§6.3–6.5). The four arithmetic headlines are stated in Lean. Its module docstring names the geometric headlines and the missing constructed quotient, compactified surface, local charts, divisors and minimal model. No freely supplied geometric predicate or sorried data stands in for them.

For each of the four sorried theorems I ran a scratch probe trying `simp` to completion, `rfl` and `infer_instance`; all four remained admitted. Object searches at the pins found no library lemma proving one directly. None is a small-value Check or a restatement of its definition. The extra generator law in the multiplier theorem excludes an arbitrary positive power of the fundamental unit.

### Computed adversarial checks

These are finite witnesses and consistency checks, not substitutes for proofs or for the inaccessible primary texts listed below. A value pair separated by “/” compares the claimed formula with an independently evaluated side. The negative controls distinguish the intended object from a plausible wrong one. The tested fields have characteristic zero, so characteristic-p and zero-ring examples are excluded by the field/number-field hypotheses; zero lattices, empty cycles, unit level and totalised inverses were tested explicitly.

| Statement | Instances and computed sides | Result / change |
|---|---|---|
| §0.1 real quadratic and unit conventions | D=5: φφ′=−1; positive generator φ²=(3+√5)/2, norm 1. D=12: ε=2+√3, εε′=1. | Correct distinction between all units and positive units. |
| §0.1 positive-unit square index | D=5: [Rˣ₊:Rˣ²]=1; D=12: index 2, since ε is not a square of a unit. | Agrees with §§0.3, 2.3, 4.3. |
| §0.2 narrow component | D=12: h=1, h⁺=2; signatures (++),(+−) give 1 and [(√3)]; [𝔡⁻¹]=[(√3)]. | Two components, one principally polarizable class; no replacement by ordinary classes. |
| §0.3 determinant/projective quotient | D=5, level (3): φ has order 8 in 𝔽₉ˣ; u=φ² has order 4. For Γ₁, squares of scalars a≡1 generate ⟨φ⁸⟩, giving quotient index 4, not 1. | The actual scalar subgroup in the repaired formula is essential. |
| §0.3 level index | D=5, norms 4,9,5: n(1+1/n)=5,10,6; unit level: empty product 1. | Admits dyadic, triadic and ramified levels. |
| §0.3 component transport | diag(1,α)(a,b;c,d)diag(1,α)⁻¹=(a,b/α;αc,d). For α=2, upper/lower entries 1 become 1/2 and 2. | Correct b→αb direction; opposite diagonal gives the inverse direction. |
| §0.4 effective action | aI sends z to z; (1,1;0,1) sends (i,i) to (1+i,1+i); −I acts trivially in SL. | Full scalar kernel needed in GL. |
| Proper-action supplier contract | nI fixes i for every positive integer n, with matrix norm tending to infinity; det(nI)=n², so only n=1 lies in SL. | R06; GL stabilizer noncompact, SL scalar obstruction absent. |
| §0.4 quotient versus free locus | Interior translation has no fixed point; S=(0,−1;1,0) fixes (i,i), projective order 2. | Finite-quotient charts required; a globally free quotient would omit the order-two singularity. |
| §0.5 Jacobian and weight | diag(u,1), N(u)=1: Jacobian u₁u₂=1. Inversion has Jacobian z₁⁻²z₂⁻², which at (2i,i) is 1/4, not 1. | Weight (0,0) constant is not a canonical two-form. |
| §0.5 pullback ratio | f=z₁−i, translation by 1, z=(i,i): f=0, f∣γ=1; actual coefficient 1 versus undefined ratio. | R04; direct slash identity gives 1=1. |
| §0.5 extension/cusp condition | D=5: p_g=0 whereas the cited Eisenstein form has cusp constant 1; a boundary logarithmic two-form has a nonzero pole coefficient 1. | H⁰(K) must correspond to S₂, not all M₂. General extension text only secondarily verified. |
| §1.1 cusp orbits/stabilizers | D=5 level one: h=1 cusp; level (2): 2 cusps. At ∞, translations by every integer fix it, versus translation by 1 moving (i,i). | Finiteness of cusp orbits does not mean finite cusp stabilizers. |
| §1.2 𝔰,𝔐 | With 𝔟=R: (1,0)→(R,𝔑); (0,1)→(R,R); (2,0)→(2R,𝔑). | 𝔐 and [𝔰] invariant, 𝔰 itself not projective; (0,0) excluded. |
| §1.3 raw-vector bijection | (0,1),(0,φ²), 𝔑=(3): equal proposed residue classes but d residues 1 and φ² differ by unit φ. | R01; retain the second raw residue. |
| §1.3 W transport | W₁(1:0)=(0:1); 𝔐=𝔑 becomes R. | Matrix convention correct for Assaf; unnecessary for DK's d≡1 convention. |
| §1.4 divisor cusp count | D=5, level prime (2): h=1, two terms φ₊(R)=1 give 2; level one gives 1. D=12 all components at level one: h⁺h=2. | Agrees; zero-ring quotient at modulus R has one generator, not an empty residue set. |
| §1.5 split stabilizer lattice | D=5 at (2): ∞ has M=R, zero has M=2R; both periods (3), repetition 1. | Distinct lattices give equal cycle data by positive scaling. |
| §1.5 full versus Γ₁ level | At ∞ and level (4): Γ₁ allows translation 1, full level excludes it and allows 4. Lattices R versus 4R. | Both gamma branches are defined. |
| §1.5 affine multiplication/inverse | (1,v)(2,v)=(1+2v,v²); (1,v)(−v⁻¹,v⁻¹)=(0,1). | Noncommutative translation law retained. |
| §1.5 affine splitting/phase | v=2+√3: t+(1−v)(−t/(1−v))=0; v=1 leaves t unchanged. For trace-dual ξ and m∈M, exp(2πi Tr(ξm))=1. | Nonzero denominator and lift-independent phase have the right hypotheses. |
| §2.1 terminal minus expansion | 3/1=[3], remainder 0; 5/2=[3,2], 3−1/2=5/2; 4/2=[2]. | Terminal zero remainder included. |
| §2.1 reversal/totalisation | 5/3=[2,3] and 2·3≡1 mod5; 12/5=[3,2,3]; 12/7=[2,4,2]. Inputs r=0 and r≥n give []. | Arithmetic totalisation is outside the resolution theorem. |
| §2.2 stream and reducedness | w=2+√3: ceil=4, successor 1/(2−√3)=2+√3; conjugate 2−√3≈0.268. w=1→0→0; w=0 has period [0]. | Rational junk excluded; reduced irrational gives [4]. |
| §2.2 fundamental multiplier | ε=2+√3 generates positive multipliers; ε²=7+4√3 preserves M but its powers omit ε. | Generator conclusion excludes the wrong model. |
| §2.2 maximal-order ownership | D=28: cycle (3,6), length 2; product ε=8+3√7; εε′=1. | Same supplied object in AutomorphicSpectralTheory §4.17a; R05. |
| §2.3 orientation | det((2+√3,1))=2√3; swapping vectors gives −2√3; scaling both by 2 multiplies the determinant by 4. | Correct sign, no loss of strict positivity. |
| §2.3 repetition/cycle | M=ℤ[√3], V=⟨ε²⟩: relative index 2, cycle [−4,−4], length 2 and sum −4; V=U gives [−4], length 1, sum −2. | Matches the geometric exceptional cases. |
| §2.3 lattice admissibility | Zero module rank 0≠2; ℤ[1/2]+ℤ√3 has rational rank 2 but is not finitely generated; V={1} has infinite index, encoded as relative index 0. | All three invalid data are excluded by Lean's fields. |
| §2.4 infinite arithmetic fan | Slopes of εʲ are ε²ʲ: for j=0,1 they are 1 and 7+4√3; there are infinitely many rays but one unit orbit. | Finite Fan is not substituted for the arithmetic cone system. |
| §2.4 cusp resolution | [−4] has nodal square 2−4=−2; [−4,−4] has off-diagonal 2, not 1. | Hirzebruch's small-cycle exceptions preserved. |
| §2.5 negative matrix | [−3]→[−1]; negative quadratic value at 1 is 1. [−2,−4]→(−2,2;2,−4), negative leading minors 2,4. | Strict negative definiteness, including nodal/double-edge cases. |
| §2.5 fake/empty cycles | [−2]→[0]; [−2,−2] has negative quadratic value 0 on (1,1). Empty matrix positivity is vacuous at the pin. | None is the period of the stated full-rank cusp datum. |
| §2.5 genus/adjunction | Two P¹s meeting twice: p_a=0+0+2−2+1=1. Nodal [−4]: K·S=2p_a−2−S²=2=4−2. | Nodal arithmetic genus must be 1. |
| §2.6 cusp sums | D=5: length 1, sum −1; D=8: length 2, sum −2; two D=5 level-(2) cusps: length 2, sum −2. | Matches global substitutions. |
| §2.7 coordinate reversal | Swapping embeddings for M=ℤ[√3] gives period (4) again, digit-minus-three sum 1/1. | Coordinate swap is not the negative-sum dual. |
| §2.7 mixed-sign dual | β=√3 gives quotient (3+√3)/2, cycle (3,2): sums 1 and −1. (3,6) dual (3,3,2,2,2): 3 and −3. | 1=−(−1), 3=−(−3); independent of E.V. |
| §3.1 ellipticity | S has discriminant −4, fixed (i,i), order2; identity and translation have discriminant0; diag(2,1) has discriminant1. | Correct strict negativity and scalar exclusion. |
| §3.2 CM relation | u=2+√3, γ=(0,−u;1,0): γ²=−uI; norm of −u is u²=7+4√3 versus inverse formula 7−4√3. | Corrected uζ formula retained. |
| §3.2 embedding dictionary | R[A²]⊊R[A], index2; projective orders2 and4; identical fixed point. | R02: two pairs on the right versus one point on the left. |
| §3.3 possible orders | φ(4),φ(6),φ(8),φ(10),φ(12)=2,2,4,4,4 allow SL q=2,3,4,5,6. Nonsquare determinant permits q=12 at D=12. | No exclusion of the order-twelve GL case. |
| §3.4 optimal count versus point count | D=5: m=4 oriented embeddings give 2 points after conjugate pairing. D=8: nonoptimal R[i] at the order4 point must contribute 0 to order2. | Numerical examples agree only with R02's optimal dictionary. |
| §3.4 conductor/unit factors | Imaginary quadratic Q(i), conductor2: h=1·2/[μ₄:μ₂]=1; ignoring the unit index gives2. | Order formula must retain the unit denominator. General relative formula checked against the supplied route, not proved by this instance. |
| §3.5 local embedding roots | ℤ₂[i], f=x²+1: mod2 roots {1}, mod4 none; local counts at levels2,4 are1,0. | Dyadic/conductor cases cannot use only split/inert/ramified symbols. |
| §3.5 prime-level factors | D=5 at (2): F(i) ramified→1; F(√−3) split→2; F(ζ₅) inert→0. | Surviving point counts 2,4,0. |
| §3.6 level-one counts | D=5: orders2,3,5 have2 each. D=28 SL: a₂=4. | Agrees with worked rows; no Q(i)-order count substituted for a general CM order. |
| §3.7 rotation formula | S: t=0,u=1 gives −1; γ=(0,−1;1,1): t=1,c=1 gives −1/2−i√3/2. Inverse factor differs by i√3 at q3 but −1 is its own inverse at q2. | Correct sign; converse about positive determinant restricted to q>2. |
| §3.8 sign/selectivity map | D=12: (++),(+−)→1,[(√3)] in ker(Cl⁺→Cl), Artin values1,−1; squares and odd-level prime classes become1 in C_𝔑. | No character is applied to a nonexistent Cl⁺/Cl quotient. |
| §3.9 local Chern cycle | q/r=5/2: coefficients (−2/5,−1/5), square −12/25−2/25+4/25=−2/5; adjunction products1,0 equal b−2. | All listed local values recomputed below. |
| §3.9 invalid rotation | (4;1,2) has gcd2; primitive q−1 type has length q−1 and zero Chern coefficients. | Ineffective type rejected; A_(q−1) boundary case correct. |
| §3.10 local resolution | 1/3(1,1) has matrix[−3], discrepancy−1/3; 1/3(1,2) has (−2,1;1,−2), discrepancies0,0. | Distinct quotient singularities not conflated. |
| §3.11 elliptic record | D=5: total 2+1+1+1+1=6; lengths 1+1+1+2+2+2=9. D=12 GL: one order12 point; SL: zero. | Record retains primitive rotation type and ambient group. |
| §4.1 resolution surface | D=5 nodal cusp square−1 has p_a1, so is not a smooth exceptional (−1)-curve; smooth-locus fibres have1 point, an A₁ exceptional fibre is P¹. | Minimal resolution is distinct from a minimal surface. |
| §4.2 Siegel sum | D=1 sum0; D=5 terms σ₁(1)+σ₁(1)=2, divided by60 gives1/30; D=8 sum5 gives1/12. | D>1 needed for positivity; all22 valid discriminants independently compared below. |
| §4.2 analytic value | Replacing ζ(−1)=1/30 by0 preserves meromorphic germs and agreement on Re(s)>1, but destroys analyticity at−1. | Lean's AnalyticAt excludes the false continuation value. |
| §4.3 generalized index | R=ℤ[√10], 𝔟=(2,√10): two intersection indices3,3, ratio1; at D=5 level(2), index5 gives volume5/15=1/3. | Previous noncommensurability objection refuted. |
| §4.3 normalization | D=12: PSL volume1/3, PGL volume1/6; using PGL as PSL normalization yields e=16+1/3 instead of16. | PSL convention is necessary. |
| §4.4 Chern formulas | D=5: K²=2/15−1−1/3−4/5=−2; e=1/15+1+3+5/3+8/3+28/5=14. | Agrees with full geometric formula's conventions. |
| §4.5 integrality | Replace order5 types2,3 by1,4: (e,K²,χ)=(15,−3,1), still integral versus correct(14,−2,1). Duplicate type(3;1,1): K²=−7/3, χ=8/9. | Integrality detects some errors, not all; README says so. |
| §4.6 irregularity | Weights(0,2),(2,0) have a zero coordinate and are nonzero, so dimensions0; weight(0,0) contains constant1 and is excluded. | Nonzero-weight hypothesis retained. |
| §4.7 Hodge/Noether/signature | D=5: χ=(14−2)/12=1, p_g=0, h11=14−2=12; signature (−2−28)/3=−10=2−12. | Arithmetic genus0 differs from χ1. |
| §4.8 cusp-form comparison | D=12 GL: 1+1=0+2; D=21 SL:1+2=1+2; D=24 GL:1+2=1+2. | Sum over narrow components required. |
| §4.9 record key | D=21 SL components give (18,−6,1) and(25,−1,2); D=12 GL/SL give(15,−3,1)/(16,−4,1). | Neither component nor ambient type can be dropped. |
| §5.1 contractions | Blown-up P²:(8,4,1)→(9,3,1); blown-up K3:(−1,25,2)→(0,24,2). A genus2 square−1 curve has K·C=3, not−1. | Smooth rationality required for exceptional curves. |
| §5.2 minimal possibilities | (χ,K²)=(1,8)→{−1,2}; (2,0)→{0,1}; (1,−2)→∅; χ=0 gives∅. | Correct coarse necessary sets, not existence claims. |
| §5.2 lower-bound possibilities | (1,−2)→{−1,0,1,2}; (2,−4)→{0,1,2}; (3,−7),(4,−4)→{1,2}; (1,8)→{−1,2}. | Union through max(K²,10) suffices since all larger rows are{2}. |
| §5.3 rational-curve criterion | Contract rational C₁ with C₁·C₂=m≥1: C₂′²=m²−1≥0, K′·C₂′=−1−m<0. K3 genus2 control:2−3=−1 but genus stays2. | Repaired rational-curve hypothesis excludes the old counterexample. |
| §5.3 elliptic configuration | Quintic control: genus6, squares5−3−4=−2, intersection5−3=2, union p_a13, κ2. Genuine I₂: genus0,0, union p_a1. | R03; identical matrices, different geometry and Kodaira conclusion. |
| §6.1 simple connectivity | Blow-ups in the quintic control preserve π₁=0 while κ remains2. | Simple connectivity alone cannot repair R03; Hilbert-surface theorem is only secondarily sourced. |
| §6.2 divisor equation | N1: λ1,a=b0 gives z₁−z₂=0, determinant1. N4: λ2 gives same zero locus, determinant4. | Primitive support/multiplicity distinction necessary; general intersection formulas not certified from the unavailable book. |
| §6.2 blow-up multiplicity | Multiplicity1 gives C′²=d−1; multiplicity2 gives d−4. | Squaring the multiplicity is essential. |
| §6.3 D13 rationality witness | Contract F₃: two squares −2+1=−1; intersection1+1=2. | Matches Assaf Example7.3.4 and the rational criterion. |
| §6.4 list/numerical compatibility | Rational/K3/elliptic listed sets have10/9/13 discriminants; D29 hasχ2,K²−4, D53 hasχ3,K²−4. | Numbers permit, but do not prove, κ0/κ1; primary classification unverified. |
| §6.5 contractions/higher levels | D85: −8+8=0, other component0+2=2; D165:−20+20=0,−10+20=10. D5 level(2):(e,K²,χ)=(14,−2,1). | Secondary examples agree; higher-level primary theorem unavailable. |
| §7.1 intrinsic prefix | D12 has2 narrow components; at D5 level(4), Γ₁/full give translation widths1/4; level0 rejected, level1 admitted. | No forced identification of distinct gamma branches. |
| §7.2 record branch | D5 gamma-zero record: cusps1, elliptic points6, resolution length10, e14,K²−2,χ1,p_g=0,h11=12. Γ₁/full have cusp records without promised elliptic/Chern branch. | Branch matches explicit scope. |
| §7.3 page coverage | D5 label encodes field discriminant5, norm1 level, principal component and gl-0; count6 versus resolution length9 are different columns. | Label/intrinsic data verified; inaccessible knowls prevent full page-coverage certification. |
| Lean multiplier headline | w=2+√3 returns after1 step and ε=w; ε²=7+4√3 fails the generator law though it preserves M. | Genuine headline, no one-tactic closure. |
| Lean negative-definiteness headline | Cycles[−4],[−4,−4] give negative-matrix determinants2,12; all−2 cycle gives zero quadratic value. | Rank, finite generation and finite positive index rule out fake data. |
| Lean duality headline | M and √3M:1=−(−1); M=ℤ[φ] and φM=M:0=−0. | Correct quantification over E.V, including unequal repetitions. |
| Lean Siegel headline | Valid continuation: ζ_(D5)(−1)=1/30 / finite sum1/30; altered value0 is excluded by AnalyticAt. | Correct value statement rather than an arbitrary meromorphic representative. |

All 13 local Chern entries in convention 13 were recomputed by the rational recurrence for Pᵢ and by multiplying the resulting coefficient vector against the chain matrix. Two additional q=12 types were tested outside the occurrence list:

| (q,r) | Minus string | Recurrence/matrix value c | README c; length |
|---|---|---|---|
| (2,1) | [2] | 0 | 0;1 |
| (3,1) | [3] | −1/3 | −1/3;1 |
| (3,2) | [2,2] | 0 | 0;2 |
| (4,1) | [4] | −1 | −1;1 |
| (4,3) | [2,2,2] | 0 | 0;3 |
| (5,1) | [5] | −9/5 | −9/5;1 |
| (5,2) | [3,2] | −2/5 | −2/5;2 |
| (5,3) | [2,3] | −2/5 | −2/5;2 |
| (5,4) | [2,2,2,2] | 0 | 0;4 |
| (6,1) | [6] | −8/3 | −8/3;1 |
| (6,5) | five 2s | 0 | 0;5 |
| (12,5) | [3,2,3] | −1 | −1;3 |
| (12,7) | [2,4,2] | −4/3 | −4/3;3 |
| (12,1) | [12] | −25/3 | additional arithmetic type;1 |
| (12,11) | eleven 2s | 0 | additional arithmetic type;11 |

For the following 22 fundamental discriminants I independently evaluated both the divisor sum and D/24 times the quadratic-character sum of B₂(a/D). The columns agree exactly as rational numbers. The periods were computed by exact quadratic-field recursion with high-precision real ceiling selection; these are mathematical probes, not proposed roadmap algorithms.

| D | Divisor sum | Character/Bernoulli sum | Principal period length; Σ(2−b) |
|---|---|---|---|
| 5 | 1/30 | 1/30 | 1;−1 |
| 8 | 1/12 | 1/12 | 2;−2 |
| 12 | 1/6 | 1/6 | 1;−2 |
| 13 | 1/6 | 1/6 | 3;−3 |
| 17 | 1/3 | 1/3 | 5;−5 |
| 21 | 1/3 | 1/3 | 1;−3 |
| 24 | 1/2 | 1/2 | 2;−4 |
| 28 | 2/3 | 2/3 | 2;−5 |
| 29 | 1/2 | 1/2 | 5;−5 |
| 33 | 1 | 1 | 4;−6 |
| 37 | 5/6 | 5/6 | 7;−7 |
| 40 | 7/6 | 7/6 | 6;−6 |
| 41 | 4/3 | 4/3 | 11;−11 |
| 44 | 7/6 | 7/6 | 3;−6 |
| 53 | 7/6 | 7/6 | 7;−7 |
| 60 | 2 | 2 | 1;−6 |
| 61 | 11/6 | 11/6 | 11;−11 |
| 73 | 11/3 | 11/3 | 21;−21 |
| 85 | 3 | 3 | 9;−9 |
| 89 | 13/3 | 13/3 | 21;−21 |
| 97 | 17/3 | 17/3 | 27;−27 |
| 165 | 22/3 | 22/3 | 1;−11 |

The 34 complete worked-example rows below were recomputed from their stated cycles, type multiplicities and the preceding local corrections. This verifies the arithmetic of the rows, not independently the existence or exhaustion of their elliptic points or exceptional curves.

| D / component / ambient | Computed (e,K²,χ,h11) | README comparison |
|---|---|---|
| 5 | (14,−2,1,12) | equal |
| 8 | (15,−3,1,13) | equal |
| 13 | (15,−3,1,13) | equal |
| 17 | (16,−4,1,14) | equal |
| 29 | (28,−4,2,24) | equal |
| 37 | (29,−5,2,25) | equal |
| 41 | (30,−6,2,26) | equal |
| 53 | (40,−4,3,34) | equal |
| 61 | (41,−5,3,35) | equal |
| 73 | (43,−7,3,37) | equal |
| 89 | (52,−4,4,44) | equal |
| 97 | (53,−5,4,45) | equal |
| 12 / 1 / sl | (16,−4,1,14) | equal |
| 12 / dual / sl | (16,−4,1,14) | equal |
| 12 / 1 / gl | (15,−3,1,13) | equal |
| 12 / dual / gl | (15,−3,1,13) | equal |
| 21 / 1 / sl | (18,−6,1,16) | equal |
| 21 / dual / sl | (25,−1,2,21) | equal |
| 21 / 1 / gl | (15,−3,1,13) | equal |
| 21 / dual / gl | (15,−3,1,13) | equal |
| 24 / 1 / sl | (19,−7,1,17) | equal |
| 24 / dual / sl | (26,−2,2,22) | equal |
| 24 / 1 / gl | (19,−7,1,17) | equal |
| 24 / dual / gl | (26,−2,2,22) | equal |
| 28 / 1 / sl | (20,−8,1,18) | equal |
| 28 / dual / sl | (26,−2,2,22) | equal |
| 28 / 1 / gl | (18,−6,1,16) | equal |
| 28 / dual / gl | (25,−1,2,21) | equal |
| 33 / 1 / sl | (21,−9,1,19) | equal |
| 33 / dual / sl | (28,−4,2,24) | equal |
| 33 / 1 / gl | (19,−7,1,17) | equal |
| 33 / dual / gl | (26,−2,2,22) | equal |
| 85 / 1 | (56,−8,4,48) | equal; h11 derived |
| 85 / other | (48,0,4,40) | equal; h11 derived |

### Pinned library and ownership audit

The pins inspected are Mathlib `f6090c70` and Tau Ceti `358314d4`. Searches were by objects as well as proposed declaration names: positive units, narrow classes, scalar quotients, continued fractions, periodic cycles, optimal embeddings, toric fans, plumbing, surface intersection, Chern numbers and zeta values. I used the roadmap search/show service for the open-head/main audit and searched the board packages. The only matching fully qualified `TauCetiRoadmap.HilbertModularSurfaces` declarations were this roadmap's own copy; no collision with another readable roadmap was found.

The following native definitions and theorem signatures were opened or located at the pins. Paths in this table are relative to the pinned library roots, not machine paths.

| Object | Pinned declaration and locator | Scope checked |
|---|---|---|
| Real places | `NumberField.InfinitePlace.embedding_of_isReal`, `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`:240 | Requires a real place. The target explicitly orders two distinct real embeddings. |
| Discriminant/class number/units | `NumberField.discr`, `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean`:36; `classNumber`, `NumberTheory/NumberField/ClassNumber.lean`:64; `Units.fundSystem`, `NumberTheory/NumberField/Units/DirichletTheorem.lean`:475; `regulator`, `NumberTheory/NumberField/Units/Regulator.lean`:266 | Native number-field arithmetic, not new surface carriers. |
| Fundamental discriminant | `Int.IsFundamentalDiscr`, `Mathlib/NumberTheory/FundamentalDiscriminant.lean`:41 | Admits D=1, so positivity is stated with D>1 in the README. |
| Pell generator | `Pell.IsFundamental`, `Mathlib/NumberTheory/Pell.lean`:430 | A generator condition is stronger than norm one; the headline keeps the needed generator law. |
| Upper-half-plane properness | `UpperHalfPlane.instProperSMul`, `Mathlib/Analysis/Complex/UpperHalfPlane/ProperAction.lean`:122; discrete subgroup instance :128 | SL₂ only. R06 corrects the contract's GL₂ overclaim. |
| One-variable cusps | `Subgroup.IsArithmetic`, `Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean`:102; `CuspOrbits`, `NumberTheory/ModularForms/Cusps.lean`:166; `strictWidthInfty`, same file :317 | One-variable subgroup carriers; not a two-variable Hilbert quotient. |
| Dedekind zeta | `NumberField.dedekindZeta`, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`:49; `dedekindZeta_residue` :56 | Definition is an LSeries counting integral ideals, not a meromorphic continuation. The headline quantifies over a continuation with value fixed at −1. |
| Zeta/L values | `HurwitzZeta.hurwitzZeta_neg_nat`, `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean`:189; `riemannZeta_neg_nat_eq_bernoulli` :251; `DirichletCharacter.completedLFunction_one_sub`, `LSeries/DirichletContinuation.lean`:283 | Hurwitz theorem requires k≠0 and x∈[0,1]; k=1, x=a/D meet them. The functional equation retains character primitivity. |
| Regular continued fraction | `IntFractPair.stream`, `Mathlib/Algebra/ContinuedFractions/Computation/Basic.lean`:142; `GenContFract.of` :185 | These are regular fractions. No pinned minus-period/fundamental-multiplier result was found. R05 concerns a roadmap owner instead. |
| Trace dual | `Submodule.traceDual`, `Mathlib/RingTheory/DedekindDomain/Different.lean`:57; `FractionalIdeal.dual` :229 | Defined by integrality of the trace pairing; inverse-different factors are retained by the Hilbert supplier. |
| Positive matrix predicate | `Matrix.PosDef`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean`:164 | Hermitian plus strict positivity on nonzero vectors; no nonempty-index condition. The empty matrix is why cusp nonemptiness needs the arithmetic hypotheses. |
| Totally positive units | `NumberField.IsTotallyPositive`, `TauCeti/NumberTheory/NumberField/TotallyPositive.lean`:71; iff :76; multiplication/inverse :96, :102; `totallyPositiveUnits` :130 | Positivity at real places is vacuous for a totally complex field. The headline's real embeddings and degree exclude that case. |
| Narrow classes | `NumberField.NarrowClassGroup`, `TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean`:83; `mk` :96; surjection :159; kernel :206; `Finite.lean`:38, :59 | Ordinary class group is a quotient, not a subgroup of the narrow class group. |
| Ray/narrow bridge, squares | `narrowEquivNarrowClassGroup`, `TauCeti/NumberTheory/NumberField/Global/RayClass/Narrow/Basic.lean`:134; `units_sq_index_eq`, `Units/ElementaryTwoQuotient.lean`:84 | Unit-square index is 2^(rank+1) for all units; extracting the positive-unit index uses signatures. |
| Plumbing | `TauCeti.PlumbingGraph`, `TauCeti/LowDimTopology/Plumbing/IntersectionForm.lean`:89; matrix :108; negative definiteness :150, :155; bilinear form :171; `blowUpVertex`, `Plumbing/BlowUp.lean`:230 | Underlying graph is simple. It cannot represent a node or a double edge; the target's special matrices are necessary. |
| Toric fan/cones | `TauCeti.Toric.Fan`, `TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean`:83; `IsToricCone`, `Cone/Basic.lean`:147; `IsRegularCone`, `Algebraic/Regular.lean`:113 | Fan includes `finite_cones`; the infinite cusp system comes from ShimuraCompactifications §0.13. |
| Quadratic forms/class numbers | `TauCeti.BinaryQuadraticForm`, `TauCeti/NumberTheory/BinaryQuadraticForm/Basic.lean`:94; `IsReducedForm`, `Reduced.lean`:60; `reducedForms` :76; `hurwitzClassNumber`, `NumberTheory/HurwitzClassNumber.lean`:84 | Weighted Hurwitz class number is not an unweighted CM-order class number. |
| Algebraic cohomology | `Scheme.Modules.eulerCharBelow`, `TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean`:105; `Scheme.genus`, `Cohomology/Genus.lean`:64; `affineBlowupι`, `Blowup/AffineCharts.lean`:61 | Native algebraic pieces do not themselves construct the analytic Hilbert surface or its comparison. |
| Hodge carrier | `TauCeti.Hodge.HodgeStructureOn`, `TauCeti/Geometry/Hodge/Structure.lean`:62; `hodgeNumber`, `Hodge/Dimension.lean`:73; `hodgeType` :152 | Linear Hodge data require the geometric decomposition supplier; not an arbitrary assigned Hodge diamond. |
| Elliptic values/width | `apply_I_eq_zero_of_not_dvd`, `TauCeti/NumberTheory/ModularForms/EllipticPoints.lean`:49; `apply_ρ_eq_zero_of_not_dvd` :64; `Subgroup.integerCuspWidth`, `ModularForms/Cusps/Basic.lean`:143 | Degree-one tests only; no existing Hilbert elliptic-count theorem was found. |

Cross-roadmap citations were resolved anew. The following are the operative contracts, with line locators in their README files (the service's heading comment is not counted). Existing roadmaps were read on main where available; the indexed new-roadmap heads supplied the unmerged contracts. These are not citations to revisions of an existing roadmap as new suppliers.

| Supplier | Resolved sections / locators | Boundary checked |
|---|---|---|
| HilbertModularForms | §§0.1,0.3–0.4,1.1–1.4,2.2–2.3,2.5–2.6,3.2,3.5; notably §0.4:422, §1.2 and §1.4 | All-degree groups, d≡1 Γ₁, scalar kernel, determinant/index, diag(1,α), cusp count, forms and measure are imported. This resolves previous R01. Its Eisenstein target §4.2 supplies the §0.5 Check. |
| ShimuraVarieties | P.6:201; §0.1:213; §0.4:268; §1.2:360; §2.5:594; §2.7:628; §2.8:647 | Effective component groups, neat covers, finite analytic quotient and projective minimal compactification; not a free GL action. |
| ShimuraCompactifications | §0.13:655; §§2.1–2.8:1174–1338; §§8.14–8.15:3343–3371; §§8.23–8.25:3510–3556; §§8.32–8.38:3685–3766; §8.56:4103 | General characteristic-zero construction versus tame Hilbert moduli comparison; full affine stabilizer and translation cocycle retained. |
| HilbertModularVarietiesAndShimuraCurves | H0.3:245; H1.1:352; H1.10:525; H5.2:1307; R18:1572 | Rank-one ordered polarization module; row-lattice convention; N≥4 complex comparison and explicit tame restrictions in H5.2 are not silently applied at arbitrary level. |
| AutomorphicBundles | B3.Hilbert.0a is explicitly identified with §7.2 at :220; §7.2:2307 | Prime-to-p cusp exact sequences, stabilizers and cocycle laws; distinct from the all-level complex surface construction. |
| GlobalNumberFields | `Completed/GlobalNumberFields/README.md`:279 (Layer2), :571 (Layer11) | Moduli/ray classes, orders, conductors and Picard groups. |
| ClassFieldTheory | Layers10–13, `TauCetiRoadmap/ClassFieldTheory/README.md`:1552, :1683, :1724, :1799 | Global reciprocity, existence and class fields; Artin character applied only in its allowed unramified/selective situation. |
| ImaginaryQuadraticClassNumber | H1.3:35; H1.4:43; H2.2:57 | Conductor class-number formula at base ℚ; quadratic Euler factorization includes real quadratic fields. |
| SchemeAndStackFoundations | §§5.9–5.10, README:7129, :7175 | Intersection, adjunction, Riemann–Roch, Noether and Hodge index; étale Gauss–Bonnet is not silently supplied. |
| ComplexKahlerGeometry | K6.0:1245; K6.1:1274; K7.2:1444 | Submanifold Kähler metric, compact Kähler Hodge decomposition, Fubini–Study normalization. |
| ComplexManifolds | Milestone4, README:238 | Free properly discontinuous holomorphic quotients and invariant-map descent; used after removing effective torsion. |
| FuchsianOrbifolds | Layers1:215,3:263; Layer6 item1:349 | Cyclic one-variable charts, cusps, compact modular quotient X(1). |
| AnalyticToricGeometry | `Completed/AnalyticToricGeometry/README.md`:186, :302, :361 | Algebraic, regular affine analytic, and finite-fan gluing inputs. |
| NeronModelsAndSemistableAbelianVarietiesPartII | §6.1:9792; supporting rationality theorem at :9824 | Castelnuovo–Zariski q=P₂=0 criterion is present inside the cited target, even though its heading is the fourteen-model classification. |
| AutomorphicSpectralTheory | §4.17a:2641–2655 | Earlier ownership of maximal-order narrow-ideal minus periods: R05. |

The resolver's 22 leads were checked against declarations and field names; they do not establish 22 missing suppliers. Object searches also reached FuchsianOrbifoldsPartII's use of AutomorphicSpectralTheory §4.17a and the board design for SchemeAndStackFoundationsPartII, which proposes surface contractions and cyclic quotient resolutions. That later design is not an earlier supplied contract: it cannot be used to add an upward dependency here. The earlier surface-specific construction here should remain the owner for that later consumer unless ownership is explicitly moved. The nonmaximal-order lattice extension and the Hilbert cusp/Chern geometry are not the objects supplied by the degree-one orbifold or finite toric fan libraries. No source text was treated as an instruction, and no computational implementation was proposed as a substitute for a general theorem.

### Seeded source sample

Source ids refer to the service's line-numbered legal texts: `assaf` is arXiv:2301.10302v2; `assaf-errata` is the authors' errata; `hirzebruch` is the institutional scan of the 1973 article; `voight` is the author version v1.0.7u; `DasguptaKakde2021` is arXiv:2010.00650v1; `zagier` is the author-hosted 1976 article. Assaf locators below use preprint pages, not unverified printed-version pagination. LMFDB ids identify official knowls. There are no README locators explicitly marked unverified; all 15 seeded targets were inspected.

| Seeded target | Text and locator actually read | Result and limits |
|---|---|---|
| 0.3 groups/projective quotients/index | `assaf` lines89–128, §2.1, p.3; `DasguptaKakde2021` lines151–167, §2.1, p.5; HilbertModularForms §§1.2–1.3 | Group matrices checked. Assaf's a≡1 and DK's d≡1 differ, contrary to convention2. Actual scalar subgroup corrects the source's overbroad Γ₁ projective-index claim. |
| 0.4 action/effective group/quotient | `assaf` lines70–86 and145–175, §§2.1–2.2, pp.2–4; ShimuraVarieties §§0.4,1.2,P.6 | Möbius action, scalar kernel and quotient interpretation match; proper-action supplier overclaim is R06. |
| 0.5 canonical two-form | `assaf` lines1038–1049, §6.3 and (6.3.1), p.21; HilbertModularForms slash law | Jacobian checked directly; secondary text supports the cusp-form dimension consequence. Van der Geer I.§4/IV.§6 extension proof unread. Ratio defect R04 is independent of that access limit. |
| 1.2 𝔰,𝔐 | `assaf` lines229–235, (3.1.1), Lemma3.1.2, p.5 | Definitions and scalar invariance supported. Computed ∞, zero and scaling witnesses above. |
| 2.3 cusp cycle | `hirzebruch` lines1171–1203,1246–1259, §2.5 lemma/theorem, scan pp.34–35; `assaf` §3.3 | Complete lattice, finite-index positive unit subgroup, primitive period and repetition hypotheses match. Hirzebruch formula extraction is imperfect; readable theorem text supports repetition. |
| 2.7 dual/reversal | `hirzebruch` lines1215–1244, §2.5, scan p.35 | Supports cyclic equivalence and reversal under conjugation. Mixed-sign duality's cited van der Geer II.§2 was unread; two explicit dual cycles computed, not represented as a proof of the general theorem. |
| 3.1 elliptic points/order | `assaf` lines610–638, §4.1/Lemma4.1.1, pp.12–13 | Isolated fixed points and finite cyclic stabilizers supported. Source's nonsquare-determinant bound needs the order12 correction already present here. |
| 3.7 rotation factors | `assaf` lines728–754, (4.3.1)–(4.3.3), p.15 | Fixed-point/derivative expression and determinant-sign inversion checked. README correctly excludes q2 from the converse. |
| 4.3 volume/proportionality | `assaf` lines1000–1007, (6.2.1)–(6.2.2), p.20; `hirzebruch` §1.3, lines353–377 | Source uses an inconsistent PGL normalization and a wrong sign/factor in the ζ(2) expression. README's PSL convention passes D5/D12 tests. Van der Geer IV.2.1 unread. |
| 4.9 Chern record | `assaf` lines1013–1049, Theorem6.2.3/(6.2.4)–(6.3.1), pp.20–21 | Structure of both sums, χ and Hodge formulas supported, with positive b convention corrected. The 34 row substitutions agree. |
| 5.3 criteria | `assaf` lines1075–1088, Propositions6.4.1–6.4.2, pp.21–22 | Rational-curve correction in part(i) is necessary and present. No support for the matrix-only definition in part(ii); R03. Van der Geer VII.2.8 unread. |
| 6.2 HZ curves/intersections | `assaf` lines1089–1098 and1123–1126, §§6.4–6.5, pp.22–23; van der Geer V.§§1–4 attempted | Secondary text points to the theory and explicitly needs higher-level component/intersection information; it does not certify the whole general target. Equation and blow-up witnesses checked; primary claim not verifiable. |
| 6.3 smallest rational cases | `assaf` lines1238–1252, Example7.3.4, p.25 | D13 contraction verified. D5,D8,D17 configurations cited to van der Geer VII.§3 were not inspected in the primary text. |
| 7.1 intrinsic prefix | `lmfdb-label` lines90–102; `lmfdb-component` line90; `assaf` lines167–175, (2.2.4), p.4 | Field/level/component/type and narrow-class interpretation supported. The component knowl's erroneous rank-two polarization-module phrase is not copied into this roadmap. |
| 7.3 page coverage | `lmfdb-label` lines90–102; `lmfdb-search` line90; official congruence, standard-surface, x0 and x01 knowls, lines90–96 | These readable pages support the intrinsic labeling/group branch. Many invariant knowls returned a browser challenge; column-by-column completeness is not certified. |

Additional source checks included Voight Proposition30.6.12 (`voight` lines23163–23173, printed pp.544–545), with the finite residue-root formula for local Eichler embedding numbers; the optimal-order decomposition in `assaf` lines654–670; and the order/unit factors and errata in `assaf` §§4.2–4.3. These checks distinguish local roots at all prime powers from a good-prime-only symbol formula. The source's hypotheses were kept rather than inferring generality from a successful build.

## Not verifiable

- **van der Geer, Hilbert Modular Surfaces (1988), DOI 10.1007/978-3-642-61553-5:** the sources service resolved a paywalled Springer book. The I.1.1, I.§4, II.§2, II.3.2, II.§6, IV.2.1, IV.2.5, IV.6.1, V.§§1–4, VII.2.2, VII.2.8, VII.2.9, VII.3.3, VII.5.1 and classification-table locators were not inspected in that book. Assaf quotations are identified as secondary evidence above, not certification of the primary hypotheses or page numbers. This is especially material to §5.3(ii), §6.2 and the full classification.
- **Prestel (1968) and Hartshorne (1977):** the service resolved paywalled publisher records. Prestel's elliptic-point formulas and Hartshorne V.3 were not read; their locators remain uncertified. No duplicate missing-source request was created for those settled paywall responses.
- **Hamahata (1995):** title lookup and DOI 10.1002/mana.19951730113 did not yield an accessible text; the Kyoto RIMS index lists RIMS-952 without an accessible text link. Theorems3.5,4.6,5.15,6.13 were checked only through Assaf Theorem6.5.1, preprint p.23. The geometric exhaustion claim remains unverified in the primary source.
- **Hirzebruch–van der Geer (1981):** the institutional book page restricts PDF access to registered/internal users. ChapterII.1 unread. No restriction was bypassed.
- **Siegel (1969), Beauville (1996), Fulton (1993), Cox (1989):** service searches found catalogues/paywalled previews or an unavailable teaching link. The cited Siegel pp.87–102, Beauville II.17/V.1/VI–VIII, Fulton §2.6, and Cox7.24 were not inspected. These six unresolved works, including the two preceding items, are recorded in the job's missing-reference file.
- **Zagier (1976), §3 formula(17):** the legal text was obtained, but the display is absent from the extraction (`zagier` lines441–448, scan p.16). The surrounding prose identifies the m=1 specialization; it does not expose the formula. PDF rendering tools were unavailable. The 22 independent rational checks above therefore do not certify the general finite-sum identity against this display.
- **Dasgupta–Kakde:** Lemma3.6 and the d≡1 definition were read in arXiv:2010.00650v1. Agreement of that version's numbering with the published version was not certified. R01 is a direct counterexample to the roadmap's own statement regardless of numbering.
- **LMFDB:** the official `hmsurface.cusps`, `cusp_resolution`, `elliptic_point`, `elliptic_point_resolution`, `euler_number`, `k2`, `hodge_numbers`, `kodaira_dimension`, and `ag.holomorphic_euler_char`, `ag.arithmetic_genus`, `ag.kodaira_dimension` fetches returned access-challenge pages. Their contents were not inferred from a successful fetch status. The readable label, component, main surface, congruence, standard-surface and x0/x01 pages were inspected separately. The claimed complete column coverage is not verified.

The review is finished with these limits recorded; no inaccessible text was treated as evidence for a new mathematical assertion, and no sources manifest or PR file was changed.

## Source issues

- **Error** in assaf at (2.1.6), preprint p.3, lines115–116: the source says conjugation by diag(α,1) transports component 𝔟 to α𝔟; it should be diag(1,α) for that direction, or component α⁻¹𝔟; affects a stated result.
- **Error** in assaf at the paragraph after (2.1.8), preprint p.3, lines125–128: the source says equality of narrow and ordinary class groups makes Γ₁ and Γ₁¹ agree projectively; it should retain the squares of the actual scalar subgroup at level 𝔑; affects a stated result.
- **Error** in assaf at Lemma3.1.8, preprint pp.5–6, lines238–264: the source says independently unit-quotiented residue data classify raw Γ₁-vector orbits; it should retain the residue constrained by the Γ₁ congruence before taking projective orbits; affects a stated result.
- **Error** in DasguptaKakde2021 at Lemma3.6, arXiv v1 p.9, lines322–332: the source says two positive-unit-quotiented residues classify raw Γ₁-vector orbits; it should keep the second residue unquotiented in the d≡1 convention; affects a stated result.
- **Misprint** in assaf at Proposition3.3.8(b), preprint p.10, line490: the source says the square-unit congruence modulus is 𝔑+𝔑/𝔐; it should be 𝔐+𝔑/𝔐; affects a stated result.
- **Error** in assaf at the CM dictionary after Lemma4.1.1, preprint p.13, lines642–645: the source says all embeddings of CM orders with extra units correspond bijectively to elliptic points; it should use optimal orders and the full nontrivial stabilizer; affects a stated result.
- **Error** in assaf at Lemma4.1.1(b), preprint p.13, line631: the source says γ²=u⁻¹ζ for determinant u; it should be γ²=uζ, as γ=(0,−u;1,0) verifies; affects a stated result.
- **Error** in assaf-errata at item(5), p.1, lines19–20: the source says the same inverse-unit expression holds inside R[γ]; it should change u⁻¹ to u as well as specifying the containing order; affects a stated result.
- **Error** in assaf at Lemma4.1.1(b), preprint p.13, line632: the source says nonsquare-determinant projective orders in degree two are at most six; it should also allow order twelve over ℚ(√3); affects a stated result.
- **Error** in assaf at (4.3.3), preprint p.15, line754: the source says unchanged rotation factors force totally positive conjugator determinant; it should exclude order two from this converse because −1 equals its inverse; affects a stated result.
- **Error** in assaf at (4.3.19), preprint p.17, line872: the source says signatures map through Cl⁺R/ClR; it should use the kernel of Cl⁺R→ClR and then the oriented type quotient; affects the proof.
- **Error** in assaf at (6.2.2), preprint p.20, lines1001–1007: the source says volume relative to PGL₂⁺(R) is always twice the index times ζ_F(−1); it should use PSL₂(R), or include the positive-unit-square index; affects a stated result.
- **Error** in assaf at (6.2.2), preprint p.20, line1007: the source says twice ζ_F(−1) equals −D^(3/2)ζ_F(2)/π⁴ in degree two; it should equal D^(3/2)ζ_F(2)/(2π⁴); affects a stated result.
- **Misprint** in assaf at Theorem6.2.3, preprint p.20, line1028: the source says bσ,k are the self-intersection numbers; it should identify positive continued-fraction digits, with the nodal self-intersection correction stated separately; affects a stated result.
- **Error** in assaf at Proposition6.4.1(i), preprint p.22, line1082: the source says two intersecting square-minus-one curves force rationality; it should require smooth rational curves, excluding blown-up genus-two curves on a K3; affects a stated result.
- **Misprint** in assaf after Table1, preprint p.21, line1067: the source says Enriques surfaces remain possible for χ=2,K²=0; it should omit Enriques surfaces, whose χ is one; affects nothing.
- **Error** in assaf at Example7.3.2, preprint p.25, line1218: the source says ℚ(√11) has h=h⁺=2; it should give h=1,h⁺=2, with principal norm-two ideal and no norm-minus-one unit; affects nothing.
- **Error** in lmfdb-component at hmsurface.component_ideal, unpaginated, line90: the source says the polarization module is R⊕𝔟; it should be the rank-one ordered module (𝔡𝔟)⁻¹, while R⊕𝔟 is the rank-two lattice; affects a stated result.
- **Error** in LMFDB at hmsurface.hmsurface, unpaginated, line92: the source says the congruence group acts properly on the completed domain; it should distinguish the effective proper action on the interior from cusp points with infinite stabilizers; affects a stated result.
- **Misprint** in LMFDB at hmsurface.hmsurface, unpaginated, line94: the source says the quotient of the open upper-half-plane square is projective; it should adjoin the rational cusps before asserting projectivity; affects a stated result.
