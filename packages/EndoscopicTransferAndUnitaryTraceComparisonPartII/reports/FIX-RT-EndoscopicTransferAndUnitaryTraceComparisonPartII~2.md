# Repair of EndoscopicTransferAndUnitaryTraceComparisonPartII (red team, round 2)

This round settles the findings of red-team passes `RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a` (four findings) and `~2b` (two findings). The two reviews do not overlap, so each finding has its own section. I checked every witness myself against the cached sources and the pinned libraries.

Files changed:
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/README.md`
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/plan.json`: only the `needs` of `jr-product-base-change` and `hermitian-field-classification` in its top-level `gaps` list
- `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/sources.toml`: `locator` and `cited_for` of Leslie25 and Leslie19

`Suggested.lean` and `metadata.toml` are unchanged.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a/F01 (P2) — applied differently

**Verification.** The finding is correct.
- Leslie25 line 3696 states Theorem 11.1 for every unramified extension of p-adic fields.
- Lemma 10.6 (lines 3619–3624) uses the value 1 of the normalized functional (8.7) on the spherical vector. That value is Lemma 8.6 (line 2829), which assumes odd residue characteristic.
- Corollary 10.8 (line 3689) and the last step of the proof (line 4012) apply Lemma 10.6 at the place under study.
- Theorem 7.12 needs no residue hypothesis (lines 2637–2639). The other dyadic gap is the one the review names.

**Change.** In the contract (README and `plan.json`): "in every m≥0" → "in every m≥0 and every residue characteristic, two included". A clause names the dyadic dependence on Lemma 8.6 (E18). New Source correction E18. §§4.4 and 4.10 cite E18. `sources.toml`: E18 and the locators Lemmas 8.6 and 10.6 and Corollary 10.8 are added.

**Why differently.** The suggested wording would require proving Lemma 8.6 at p=2. That is one route, but the contract should not fix it. Suppose α^♮(W₀)=c instead of 1, with c depending only on Π_v0. Then:
- Lemma 10.6 reads J^♮(f′)=c·I^♮(BC f′).
- Corollary 10.8 gives C=J^♮(1_K′)/I^♮(1_K)=c, which is nonzero by Proposition 10.7.
- Proposition 10.7 gives J^♮(ϕ)=c·I^♮(f°), so I^♮(f°)=I^♮(BC ϕ), and (11.6) follows.

E18 records both options. The contract asks only for the theorem at p=2.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a/F02 (P2) — applied

**Verification.** ℂ/ℝ is a quadratic extension of characteristic-zero local fields. diag(1,1) and diag(−1,−1) both have dimension 2 and discriminant 1 in ℝ^×/N(ℂ^×)={±1}. Their signatures are (2,0) and (0,2), so they are not isometric.

**Change.** In the gap sentence (README and `plan.json`): "characteristic-zero local fields" → "nonarchimedean local fields of characteristic zero". The ℂ/ℝ pair is added as a negative-control Check under the gap.

**Pattern.** The other gap sentence that names a field class, gap:unitary-factor-all-quadratic, already says "p-adic fields". The Conventions fix a nonarchimedean F. No other occurrence.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a/F03 (P3) — applied

**Verification.** Leslie19 line 431 opens §3 (p. 9) with "quadratic extension of local fields of odd residue characteristic". Lemmas 3.6 and 3.9 (lines 558 and 608) and §3.2 (line 571) lie in §3. Proposition 4.5 (line 699) uses them. By contrast, Leslie25 Part 1 (line 510, p. 13) works over any nonarchimedean F with a quadratic étale algebra.

**Change.** New Source correction E19 (scope). It says which routes here avoid the hypothesis: the geometric torsor, gap:hermitian-field-classification, H¹(F,GL_n)=1 for split E, and base §4.7. The locators of §§0.5, 0.8 and 1.5 now cite E19. `sources.toml` Leslie19 gains `cited_for` "Source corrections E19" and the locator Lemmas 3.6 and 3.9.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2a/F04 (P3) — applied

**Verification.** I recomputed the witness. Take W₁=V₂, W₂=(E²,diag(1,π)) and X=I₂. Then X^τ=G₂⁻¹X*=diag(1,π⁻¹), and det r₁(X)=π⁻¹ has odd valuation. With W₁=W₂=V₂, det r₁(X)=N(det X) has even valuation. Separately, V_n was defined only in the unramified setting; Leslie25 line 511 defines it in the étale setting.

**Change.**
- Layer 1 example: "the four relative data" → "with source spaces W₁=W₂=V₂, the four relative data". It now also states det(−XX*)=N(det X), and gives the diag(1,π) source as a counterexample.
- Conventions: V_n=(E^n,I_n) is now defined in every setting (for split E, the carrier with M=F^n), together with V_α. The unramified bullet no longer defines it.

**Pattern.** The §4.9 Check about the label (π,1) now says "on W₁=W₂=V₂".

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2b/F01 (P3) — applied

**Verification.** Transitivity of the norm gives ker(η∘N_(F_i/F))⊇N(E_i^×). Index 2 does not exclude the kernel being all of F_i^×. The missing input is that an Artin symbol fixing E_i comes from a norm. This is `TauCeti.ClassFieldTheory.mem_normGroup_of_mk_eq_artinMap_of_fixes`, at the pin in `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean`, line 165, with hypotheses as described (σ represents `artinMap K x` and fixes a finite Galois M pointwise).

**Change.**
- The Tau Ceti contract lists the third declaration and says what it states.
- The §3.2 route proves the kernel equals N(E_i^×). It notes that two representatives of one class in G_F^ab agree on the abelian extension E.
- The declaration is added to the §3.2 *Needs* and the Layer 3 Dependencies.

## RT-EndoscopicTransferAndUnitaryTraceComparisonPartII~2b/F02 (P3) — applied differently

**Verification.** At this head, each name occurred only in its contract paragraph.

**Change.**
- `MvPolynomial.bind₁` is kept, scoped in the Mathlib contract to polynomial (not Laurent) substitution. It is named in the §4.8 route, *Needs* and Layer 4 Dependencies.
- `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` is named in the §§2.3 and 4.7 routes and *Needs*, and in the Layer 2 and Layer 4 Dependencies.

**Why differently.**
- *bind₁.* §4.8's identity is a polynomial identity. q^(d(n−1))h_d(Z) is a polynomial, and the scaled substitution is `bind₁` (`aeval`, Monad.lean:67). So the declaration has a real consumer and is not deleted. Deleting it would also leave the README disagreeing with the `baseline` of `plan.json`, which this job may not edit.
- *mem_normGroup_iff_dvd_normalizedValuation.* §4.2's vanishing on the other orbit needs no valuation: XX*=X∗I_n lies in the orbit of I_n. So §4.2 is not given the declaration. §2.3 is the real consumer instead: "|λ| odd is the whole nonreference orbit".

## Checks

**Elaboration.** `lake env lean packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/Suggested.lean`, run from the content checkout, exits 0 with no output. The file imports only `Mathlib`, so no `TauCeti.*` build was needed.

**`#check @name` comparison.** `Suggested.lean` declares nothing (an empty namespace with its docstring), so there was nothing to compare. No name in it changed.

**Dependency check** (command of the brief, unchanged):

```text
depcheck: 207 roadmaps, 1902 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**Citations.** `roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." The earlier lead `IntegralHermitianLattice.ofCarrier` no longer appears; it is target 2.7.1 of GeometryOfNumbersAndQuadraticArithmetic. The gap sentences of `plan.json` occur verbatim under "Exact supplier contracts" for all seven slugs (checked by string comparison).

**Ownership.** This round adds no new construction or target. The changes refine contracts on existing suppliers (EndoscopicTransferAndUnitaryTraceComparison, GeometryOfNumbersAndQuadraticArithmetic), cite one more pinned Tau Ceti declaration, and add Source corrections. So no ownership question arises, and ownership against open pull requests was not re-searched.

## Adversarial pass (changed statements)

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | gap:jr-product-base-change, all residue characteristics | F=ℚ₂, E=ℚ₂(ζ₃) (x²+x+1 irreducible mod 2), m=0 | dyadic unramified place, GL_0×GL_1: inside the contract | covered |
| 2 | E18 cancellation | α^♮(W₀)=c≠0 | Lemma 10.6: J=c·I(BC); C=c·1/1=c; J(ϕ)=c·I(f°)=c·I(BCϕ) ⇒ (11.6); c=1 is the source | holds |
| 3 | gap:hermitian-field-classification | ℂ/ℝ; ℚ₂(i)/ℚ₂; ℚ₃(√3)/ℚ₃; rank 0 | ℂ/ℝ: disc 1,1, signatures (2,0),(0,2), excluded; ℚ₃(√3): −1∉N, so ⟨1⟩≇⟨−1⟩, disc distinct; rank 0: one class | correct after the fix |
| 4 | E19 / §0.5 kernel comparison | n=1, F=ℚ₂, E unramified; E=ℚ₂(i); E=F×F | \|F^×/N(E^×)\|=2 (index 2), det is the identity on it; split: H¹(F,GL_1)=1, both kernels trivial | consistent |
| 5 | V_n in every setting | E=F×F, n=1; n=0 | h((x,y),(x′,y′))=(yx′,xy′), the split carrier with A=F; V_0=0, Herm(V_0) a point | holds |
| 6 | Layer 1 example, W₁=W₂=V₂ | X=diag(π,1); z=diag(π,πu) | det r₁=N(π)=π², v=2; −z⁻¹ has det π⁻²u⁻¹, v=−2 | even, as stated |
| 7 | counterexample with W₂=diag(1,π) | X=I₂; target (−π⁻¹,−1) | X^τ=diag(1,π⁻¹), det r₁=π⁻¹ (v=−1); −diag(x,y)⁻¹=diag(π,1), det π ≅ disc W₂ | match exists, as stated |
| 8 | §4.9 Check, label (π,1) | source End(V₂) | det=N(det X), even; target xy odd | no match, holds |
| 9 | §3.2 η_i | F_i=F; F_i unramified cubic; F_i=F(√π) with E unramified | η_i=η, kernel N(E^×); η(N π)=η(π³)=−1; N(√π)=−π, η(−π)=−1, and √π∉N(E_i^×) since E_i/F_i is unramified and v(√π)=1 | nontrivial in each case |
| 10 | §4.7 even grades | n=1, X=π; r₋ sign | det(XX*)=π², v=2; det(−XX*)=(−1)^n N(det X), same parity; Φ_1,1=0 | holds |
| 11 | §2.3 parity of the nonreference orbit | λ=(1,0),(1,1),(−1),() | v=1 nonreference; v=2 reference; v=−1 nonreference; v=0 reference (X_0) | agrees with the §2.3 Checks (e_(1,1) reference, e_(1,0) sign) |
| 12 | §4.8 `bind₁` identity | (a,b,d)=(1,1,1),(1,1,2),(2,1,1) | q(Z₁+Z₂)↦X+Y; q²(Z₁²+Z₁Z₂+Z₂²)↦X²+XY+Y²; q²h₁(Z)↦q(X₁+X₂)+Y=Sat(c_2,1)⊗1+1⊗Sat(c_1,1) | matches Checks at §4.8 |
| 13 | contract text of `mem_normGroup_of_mk_eq_artinMap_of_fixes` | pin, ArtinMap.lean:165 | σ∈G_K, class=`artinMap K x`, M finite Galois, σ fixes M ⇒ x∈`normGroup K M` | description agrees |
| 14 | contract text of `bind₁` | pin, Monad.lean:67 | `bind₁ f := aeval f`, MvPolynomial σ R →ₐ[R] MvPolynomial τ R | polynomial only, as stated |

## For the maintainer

- gap:jr-product-base-change now asks EndoscopicTransferAndUnitaryTraceComparison for Leslie25 Theorem 11.1 in residue characteristic two explicitly. Source correction E18 explains why the source's proof does not deliver it as written, and how the constant may cancel.
- No section, layer or target id changed. E18 and E19 are new. The definition of V_n moved from the unramified bullet to the general Conventions paragraph with the same notation, so no citing roadmap is affected.
- The `baseline` list of `design/plan.json` still names `MvPolynomial.bind₁`, which the README keeps. It does not list the class-field-theory declarations of the Tau Ceti contract, and did not before this round either. This job may edit only the `gaps` list, so the baseline is unchanged.
- No suspicious instructions were found in the reviews or the sources.
