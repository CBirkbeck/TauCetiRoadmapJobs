# Design repair report

The edited files are `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md`, `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json` and `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml` (one locator). This design package has no `Suggested.lean`, and none was created. No other package, merge-order file, tooling or pull-request text was changed, and nothing was committed. All six findings of the review were verified and applied. The plan was edited field by field, so its diff touches only the intended statements, tests, sources and one prerequisite.

## F01 (P2) — applied

§0.1 "This supplies the split model directly from finite-dimensional duality" → split carrier M⊕M*, pairing and GL(M) isometry group imported from MetaplecticAutomorphicForms §3.2a (`splitHermitianOscillator`, sign +1); only the paired-map Hom description, exchange adjoint and block stay here. Added to Scope, the Metaplectic contract, §0.1 *Needs* and proof route, Layer 0 Dependencies and the node prerequisites.

Evidence: MetaplecticAutomorphicForms README §3.2a (open head 22bee85, README line 608) constructs `splitHermitianOscillator` over a field F of characteristic ≠ 2 with E=F×F. It uses finite projective E-modules with perfect ε-Hermitian pairings identified with A⊕A∨, the pairing (ℓ(y),εk(x)), and isometry group GL(A) acting by (g,(g⁻¹)∨). For ε=+1 this is exactly our pairing (ℓ(w),m(v)), and characteristic zero satisfies its hypothesis. MetaplecticAutomorphicForms is already a supplier earlier in the merge order, so the import adds no new supplier edge. The adjoint of the paired maps was recomputed on the imported carrier: h₁(Xv,w)=((A′ℓ)(w₁),m₁(Av₂)) forces X^τ=(B,Aᵗ), so (A,B)↦(B,A). The split action Check (2,1/2) is unchanged.

## F02 (P2) — applied

§2.3 "Identify its symmetric Laurent-polynomial image with the F-Satake algebra" → an explicit dictionary U_i=q^(−z_i)↦−T_i in every rank, followed by inverse normalized F-Satake. API bullet added. New Checks: ê_(1,0)=√q(U₁+U₂) and H₂(e_(1,0))=−T_(1,0),F; H₂(e_(2,0)+(q+1)e_(1,1))=BC₂(T_(1,0),E). §5.1 gains ξ_X(e_(1,0))=−(e₁⊗e₀+e₀⊗e₁). Locators were updated in the README and in `sources.toml`.

Evidence. The OCR omits the signs and exponents, so I rendered printed pp. 566, 571, 578 and 579 of the cached publisher scan and read them visually. Hironaka99 line 697–699 is (2.6): Ψ_z(π^λ)=(−1)^(n(λ)+|λ|) q^(n(λ)−((n−1)/2)|λ|) (w_λ⁽ⁿ⁾/w_n)(−q⁻¹) P_λ(q^(z);−q⁻¹). Line 720 is (2.7), the orbit volumes. Line 499–517 gives (2.2)–(2.3). The appendix (lines 989 onward, pp. 578–579) defines w_m(t)=∏(1−tⁱ) and the Hall–Littlewood normalization.

- **Rank one.** The transform evaluates at y⁻¹, so ê_j=(−1)^jU^j. The existing Check H₁(e_j)=1_(π^jO_F×) therefore forces U↦−T.
- **Rank two, e_(1,0).** The orbit volume is q−1 and ê_(1,0)=√q(U₁+U₂). I also checked the volume against the additive measure: there are (q−1)(q²+1) rank-one reductions, which gives μ=q−1.
- **Rank two, e_(2,0) and e_(1,1).** ê_(2,0)=q(U₁²+U₂²)+(q+1)U₁U₂ and ê_(1,1)=−U₁U₂.
- **Why the sign must be fixed.** ê_λ is homogeneous of degree |λ|, so the two dictionaries differ exactly on the nonreference orbit (|λ| odd). They agree on every cyclic value, which is why the sign has to be part of the definition.
- **E-Satake normalization.** Hironaka's (2.3) is the normalized E-Satake transform at Z_i=U_i². The K·B Haar decomposition gives the factor δ^(1/2) once, and the consistency check Φ₂,₂=e_(2,0)+(q+1)e_(1,1) ↦ T_(2,0)−(q−1)T_(1,1)=BC₂(T_(1,0),E) agrees with source correction E10.

## F03 (P2) — applied

§4.9 "for a fixed datum Xi is equivalent" → for a fixed ordinary datum, the relative unit theorem for all four (α,β) at once ⇔ the ordinary compact graded transfers; the four contraction images partition the invertible target locus and the target vanishes off (I_a,I_b); a single Xi matches only its image. Proof route, a negative-control Check, §4.10 proof step and plan updated.

Evidence: Leslie25 line 873–875 (Theorem 2.12) covers every form pair; line 1248–1253 (Corollary 3.10) is stated for Theorem 2.12 as a whole. Witness (unramified, a=b=1, Xi=(ε,1) with ε=π):

- The target contractions −π⁻¹N(z) and −N(z) have odd and even valuations, while every source determinant N(det X) is even. No orbit matches, so the Xi assertion holds for every source.
- With the doubled source, the ordinary identity needs the value 2 at (2,0), but the target gives 1.
- The four images are distinct because det r₁ ≡ (−1)^a det V_a/det V_α modulo norms.

## F04 (P2) — applied

"Retain both GL_n(E)-orbits", "infinitely many nonzero grades", "total function is not in H(Xn)", the Layer 2 intro and "zero on the other orbit" (§4.2) → qualified by n>0. The rank-zero carrier is stated: X₀ is a point, H(X₀)=ℂe₀, and Φ₀=Φ₀,₀=e₀. New n=0 Checks were added in §2.1 and §4.7, and the plan was synchronized.

Evidence: at n=0, End(Λ₀)={0} and U(V₀)=1, so Φ₀=1 on X₀. The coweight is the empty tuple, m₀=1, and the self-density is the empty product 1. There is one orbit and one nonzero grade. At n=1, Φ₁(π^(2j))=1 for every j≥0, so the positive-rank claims are unchanged. In rank zero ê₀=1, so H₀ is the identity. Leslie25 line 803 asserts two orbits for every n; the reviewer's source-issue list already records that as a source error.

## F05 (P3) — applied

§0.4 "In rank one, r=−N(z) and charpoly δ=T²+N(z)" → for ⟨a₁⟩,⟨a₂⟩: r=−(a₁/a₂)N(z) and charpoly δ=T²+(a₁/a₂)N(z), with the nonstandard witness a₂=π. §1.3 "For κ=1 the sum equals SRO" plus the two symbolic Checks → three numerical Checks: SRO=7, κ-sum −3, and shifted sum 3=κ(d₀)⁻¹(−3).

Evidence: δ=[[0,z],[−(a₁/a₂)z̄,0]] has det δ=(a₁/a₂)N(z) and trace 0. At a₁=1, a₂=π, z=1 the constant coefficient is π⁻¹, not 1. Pattern search: every other rank-one contraction formula (Conventions, §0.2, §0.3, §0.5) already carries the ratio or says "standard". The tautological Check passed for the zero distribution; the replacements give 0≠7 and 7≠−3.

## F06 (P3) — applied

Scope "their allocation … requires an ownership decision" → "The Jacquet–Rallis inputs consumed here are the named supplier contracts below." The empty "Its direct consumers are ." was deleted, and so was the doubled "of §1.1". Duplicated locators were merged in §§0.5, 0.8, 1.5, 2.3, 3.2, 3.3, 3.7, 3.8 and 4.3, and in the corresponding plan `sources` entries.

Evidence: the duplicated text came from Leslie25 entries in the plan that embedded Leslie19, Xiao18, BP21 or Hironaka99 locators, plus a repeated Leslie25 entry in §4.3. Each was reduced to its own source, and no page or theorem number was lost. The `restructure` proposal in the plan is untouched. All seven gap declarations and every prerequisite are still present (plan validated as JSON).

## Adversarial mathematics pass

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §0.1 imported split carrier | A=F, g=2; rank zero A=0 | Pairing after (2x,ℓ/2): (ℓy,kx), before: (ℓy,kx); A=0 gives GL(0)=1 and pairing 0 | Matches Metaplectic §3.2a with ε=+1 |
| §0.1 exchange adjoint | X=(A,A′), A′=Bᵗ | h₁(Xv,w)=((A′ℓ)(w₁),m₁(Av₂)) forces X^τ=(B,Aᵗ), i.e. (A,B)↦(B,A) | Adapter kept here, carrier imported |
| §0.1 split action | n=1, (g,h)=(2,1), (A,B)=(1,1) | (gAh⁻¹,hBg⁻¹)=(2,1/2); AB=1 before and after | Unchanged Check still holds |
| §0.4 rank-one charpoly | ⟨1⟩,⟨π⟩,z=1; ⟨1⟩,⟨1⟩,z=1; z=0 | T²+π⁻¹ versus T²+1; T²+1; T² | Ratio required; z=0 not regular |
| §1.3 sums | D=C₂, values 2,5; zero functional; trivial κ | SRO=7 versus 0; κ-sum −3 versus 7; shift 5−2=3=(−1)⁻¹(−3) | Three discriminating numerical Checks |
| §2.1 rank zero | n=0; n=1 | 1 orbit, basis {e₀}; 2 orbits (valuation parity) | n>0 qualifier |
| §2.3 rank one | e_j, j=−1,0,1,2 | ê_j=−U⁻¹,1,−U,U²; U↦−T gives T^j; U↦T gives −T at j=1 | Rank one forces U↦−T |
| §2.3 rank two, odd orbit | e_(1,0) | volume q−1 (equal to the additive count (q−1)(q²+1)·q⁻⁴·(1−q⁻¹) times C·q²); ê=√q(U₁+U₂) ↦ −√q(T₁+T₂) | H₂(e_(1,0))=−T_(1,0),F |
| §2.3 rank two, even orbit | e_(2,0), e_(1,1), Φ₂,₂=e_(2,0)+(q+1)e_(1,1) | q(U₁²+U₂²)+(q+1)U₁U₂; −U₁U₂; sum q(U₁²+U₂²) ↦ T_(2,0)−(q−1)T_(1,1) | Equals BC₂(T_(1,0),E), consistent with E10; e_(1,1)↦−T_(1,1) rules out e_λ↦T_λ |
| §2.3 module law | φ=1_(πO_E×), f=e₁ | φ̃ê₁=U²(−U)=−U³=ê₃ ↦ T³=T²·T | BC_n compatibility kept |
| §2.3 unit, rank zero | n=0,1,2 | ê₀=1 in each rank; H₀=identity; free ranks 1,2,4 | Unit and rank unchanged |
| §2.3 opposite dictionary | λ with odd or even total degree d(λ)=λ₁+…+λ_n | Signs differ by (−1)^d(λ): e₁, e_(1,0) flip; e_(2,0), e_(1,1) do not | Dictionary is part of the definition |
| §4.2 rank zero | n=0, φ=c∈ℂ | r₊,!φ=c·e₀; no second orbit | n>0 qualifier |
| §4.7 grades | n=0; n=1, d=−1,0,1,2 | Φ₀=e₀ only; grades 0,e₀,0,e₂ and Φ₁(π^(2j))=1 for all j≥0 | Noncompactness only for n>0 |
| §4.9 reference image | a=b=1, d=1 | Target 1 at (2,0) and (0,2); 0 at (1,1) | Matches |
| §4.9 nonreference datum | Xi=(ε,1), ε=π | Target parity (odd,even); source parity even; no matches, so the assertion is automatic | Fixed-Xi equivalence false; restated over all four pairs |
| §4.9 doubled source | 2·1_End(Λ₂) | (ε,1) assertion still true; ordinary identity needs 2 but the target gives 1 at (2,0) | Negative-control Check |
| §4.9 singular/odd orbits | Target y_a with a zero eigenvalue; odd total valuation | All functions vanish there: 0=0 | Covered by the proof route |
| §4.9 image partition | det r₁ class | (−1)^a det V_a/det V_α: two classes per block, four disjoint products | Partition statement correct |
| §4.10 derivation | All four pairs | §4.9 gives all four at once; each Xi follows | Proof step updated |
| §5.1 noncyclic value | n=2, a=b=1, e_(1,0) | −T_(1,0) ↦ −(T₁⊗1+1⊗T₁) ↦ −(e₁⊗e₀+e₀⊗e₁); opposite dictionary gives + | Value now determined |
| §5.1 central and unit | 1_(πK)*e₀=e_(2,2); e₀ | U₁²U₂² ↦ q⁻²X²Y² (q⁻²ᵃᵇ at a=b=1); e₀ ↦ e₀⊗e₀ | Existing Checks unchanged under the dictionary |
| F06 locators | Nine merged lines | Same theorem and page numbers before and after (for example Leslie19 Lemmas 3.6, 3.9, pp. 12–13 once instead of twice) | No locator lost |

## Checks run

Dependency check after all edits (exit 0):

```text
candidate: EndoscopicTransferAndUnitaryTraceComparisonPartII is not in the merge order yet; checked as if placed after MetaplecticAutomorphicForms (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 635 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- **Citation resolver** after the edits: no cross-roadmap citations and no Lean names found nowhere. The one earlier lead, `IntegralHermitianLattice.ofCarrier`, is a planned target name in GeometryOfNumbersAndQuadraticArithmetic §2.7 (README line 1130 at head 465728d), not a pinned declaration, so it is a false positive.
- **Lean:** no Lean command was run. This design package has no `Suggested.lean`, and its acceptance specification has zero declarations, so there was nothing to put through a `#check` binder comparison.

## Notes for the maintainer

- **Ownership.** I searched the open roadmap heads and main with `roadmaps grep`. The split Hermitian carrier is owned by MetaplecticAutomorphicForms §3.2a and is now imported. The X_n spherical Fourier transform and its spectral dictionary stay owned here: GeometryOfNumbersAndQuadraticArithmetic §3.2 uses Hironaka's different space U(2n)/(U(n)×U(n)).
- **No names changed** that other roadmaps cite. GanGrossPrasadUnitaryGroups is unaffected.
- **Definition change in the full-module operator.** H_n is now fixed on the nonreference form by U_i↦−T_i, so the full-module operator ξ_X has definite values there. Any consumer of Leslie25 Remark 3.7's conjectural extension must use this sign.
- **Suspicious text.** The review contained no instruction-like text.
