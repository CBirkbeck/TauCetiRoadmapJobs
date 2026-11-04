# GATE-OperatorAlgebraDynamics~3: answers to the review of 87a15f7

The review covers head 87a15f7. Commit 9b0b717, the head this job started from, already carries the repairs for F01 and F03–F06; each one was re-checked at 9b0b717. This job adds commit 84a6c17. Line numbers refer to `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (README) and `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (Lean) at 84a6c17.

## H01 (CBirkbeck) — applied

Option (B) is in place: Fourier inversion with the dual Haar measure, the Plancherel unitary and the Pontryagin duality theorem are now D4.Harmonic targets, stated in Lean as `pontryagin_duality` (Lean 244) and `exists_dualHaar_plancherel_inversion` (Lean 260). Their routes run through Tau Ceti `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` (`Analysis/Fourier/Pontryagin/StronglyContinuous.lean` 283) and `FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular` (`Uniqueness.lean` 263), both checked at the pin. The V11 scope bullet and every "whose owner Scope and ownership names" phrasing is gone (grep returns 0). D2's weak-closure identification is now stated in generator form, with no von Neumann crossed product as input (README 55–61, 853–875). In this round's adversarial pass on the new headline, `[μ.Regular]` was added and `ν.Regular` concluded (Lean 260–261; README 1583–1588, 1618, 1644, 1696), because Mathlib's `IsHaarMeasure` does not include regularity: Mathlib's uniqueness up to scalar, `isMulLeftInvariant_eq_smul_of_regular` (`Haar/Unique.lean` 906), and the sources' Haar measure both assume it. VonNeumannAlgebras at head 889 still plans the same harmonic theorems in V11 (its lines 3150–3245). Since this roadmap is on main, those V11 items should re-point to D4.Harmonic. That re-pointing is the other roadmap's edit, and no consumer line was added here because V11 does not cite D4.Harmonic yet.

## H02 (CBirkbeck) — applied

README 2842–2844 (Downstream consumers) now records that NoncompactQuantumSymmetry M2.FixedTwistTypeI's single-weight fiber identification `J_k(E_ω)≅C*(G,ω^k)` belongs to D1.TwistedBorel, and that NQS uses it for `C*(E_ω)≅⊕_kJ_k(E_ω)`. This matches NQS at head 1015, line 1551.

## H03 (CBirkbeck) — answered

No edit. The scope clause (README 78–86) already states how D5.Fields differs from VonNeumannAlgebras V4.0.Fields: the standard-fibre model of SA-B85 only, with every fibre inside one `ℓ²(ℕ)`. The README has to stay timeless, so a sentence of the form "when VonNeumannAlgebras merges, cite V4.0.Fields" cannot go in it. A roadmap on main also cannot cite the open pull request without an UPWARD edge. Re-pointing the decomposable-operator criteria to V4.0.Fields is the follow-up for after VonNeumannAlgebras merges.

## H04 (CBirkbeck) — applied

At README 1797, "commutative of dimension n²" → "commutative of dimension n": for `A=ℂ`, `C*(G)` has dimension n.

## H05 (CBirkbeck) — applied

At README 1991–1993, the non-decomposable constant field is now `E_10` (`e_0↦e_1`). The text also notes that `E_01` sends `e_0` to 0 and so does preserve `H(x)=span{e_0}`, which is right for the matrix-unit convention `E_ij e_j = e_i`.

## H06 (CBirkbeck) — applied

At README 386–393, the last clause is now the argument the review gives: the closed span I of `⟨X,X⟩_B` is a closed two-sided ideal, hence a C*-subalgebra containing `b^(1/n)`. So `xb^(1/n)` lies in the closure of `X⟨X,X⟩_B`, which equals the closure of `_A⟨X,X⟩X`. The text adds that fullness is not needed for this direction.

## H07 (CBirkbeck) — applied

`Real.coth` is gone (grep returns 0). The D8 Needs line (README 2656–2659) and the D8 Dependencies now name `NormedSpace.exp`, and write the hyperbolic cotangent as `(exp x+1)/(exp x−1)`. The pinned Mathlib has no `Real.coth` (confirmed by grep).

## H08 (CBirkbeck) — applied

At README 2802–2805 and in the D9 Dependencies, "the matrix exponential and logarithm" → `NormedSpace.exp` and "the logarithm of a positive-definite matrix as the Hermitian functional calculus `cfc Real.log` of `Matrix.IsHermitian`" (`Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean` 97).

## H09 (CBirkbeck) — applied

"QuantumFoundations QF4" → "QuantumFoundations Layer 6 (6.3–6.4)" at README 88–92 and 2836, and grep for `QF4` returns 0. QuantumFoundations at its open head has 6.3 "Second quantization and its domains" at line 722 and 6.4 "Creation and annihilation, CCR and CAR, Weyl continuity" at line 738.

## H10 (CBirkbeck) — applied

D8 (README 2528) and Downstream consumers (README 2836–2841) no longer say that QuantumFoundations consumes the general CAR automorphism. They now say that QuantumFoundations 6.3–6.4 uses D8's Fock carriers, sector formulas and Segal-field adapter, and that its `Γ(U)b̄(f)Γ(U)*=b̄(Uf)` (QuantumFoundations line 740) is the case `V=0` of `γ(a(f))=a(Uf)+a(Vf)*`.

## H11 (CBirkbeck) — applied

At README 2845–2848, "cite D1–D2, D6 or D7" → "cite D1–D2, D6, D7 or D8 … or the CAR algebra with its Fock representation". Subfactors at head 874 cites D8 (its lines 70, 279, 1695, 1709, 1718).

## H12 (CBirkbeck) — answered

This is a note for the board, not a defect in this folder, and this job may edit only this branch's README and Lean files. Before merge, a human has to decide which of the two open revisions of the on-main folder (this branch, or the other revision by the same author at head 443d35c) supersedes the other.

## Additional repair found in the pass

The Rudin reference had been inserted inside the Williams entry, so the paragraph "Appendix D for D1.BorelPrefix …" (Williams's Appendix D) appeared to belong to Rudin. The Rudin entry now follows the Williams entry (README 2888–2893). Its sentence "the routes given there avoid Bochner's theorem" wrongly suggested that Rudin's proofs avoid it. It now reads "Rudin's proofs of inversion and Plancherel pass through Bochner's theorem; the routes D4.Harmonic gives do not."

## Adversarial pass (statements added or changed at 9b0b717 and 84a6c17)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `pontryagin_duality` | trivial group; ℤ; 𝕋 | trivial: Ĝ and (Ĝ)^ are points, so ev is the identity. ℤ: Ĝ=𝕋 and (Ĝ)^=ℤ through n↦(z↦zⁿ), with ev(n)(z)=zⁿ. Discreteness is recovered because, for n≠0, `|zⁿ−1|<1` fails at some z∈𝕋 | true; the T2 and locally compact hypotheses are in the signature (`#check`) | none |
| Plancherel part of `exists_dualHaar_plancherel_inversion` | ℤ/n with counting measure; ℤ/2, f=δ_0 | for f=δ_e: ‖f‖₂²=1, Σ_χ\|f̂\|²=n, so ν=(1/n)·counting. ℤ/2: ν_f=(1/2)·counting, so \|f̂\|⁻²ν_f=ν_f | true | `[μ.Regular]` hypothesis and `ν.Regular` conclusion added: `IsHaarMeasure` at the pin does not include regularity (see H01) |
| Inversion part | ℤ/3, f=δ_1, ν=(1/3)·counting | (1/3)Σ_χ χ(1)conj(χ(x)) = [x=1] = f(x). Without the conjugate: (1/3)Σ_χ χ(1+x) = [x=−1], which is wrong at x=1 | the conjugate is correct for the positive-character convention `f̂(χ)=∫fχ` | none |
| D4.Harmonic route `ν_(λ(k)f)=\|k̂\|²ν_f` | unimodular abelian G, k∈C_c | (k*)^(χ)=∫conj(k(t⁻¹))χ(t)dt=conj(k̂(χ)), so (k**k)^=\|k̂\|². ⟨f,λ(h)f⟩=∫h(s)∫χ(s)dν_f ds=∫ĥ dν_f. Tau Ceti's transform is ∫χ(g)dμ (`Measure.lean` 30), which has the same sign | consistent | none |
| translation step | χ₀f | ⟨χ₀f,λ_s(χ₀f)⟩=χ₀(s⁻¹)⟨f,λ_sf⟩=conj(χ₀(s))⟨f,λ_sf⟩; (χ₀f)^(χ)=f̂(χχ₀) | consistent | none |
| inversion route | t↦conj(φ(t⁻¹x)) | the substitution u=t⁻¹x gives the transform χ(x)·conj(φ̂(χ)) | consistent | none |
| injectivity and openness of ev | (λ_xf)^ and g*g̃ | (λ_xf)^(χ)=χ(x)f̂(χ); (g*g̃)(e)=∫\|g\|²=1 and (g*g̃)^=\|ĝ\|² | consistent | none |
| D4.Takai finite Check (H04) | A=ℂ, \|G\|=n=2 | dim C*(G)=2, while dim M_2(ℂ)=4 | the corrected value n is right | applied |
| D5.Fields Check (H05) | x<1/2, H(x)=span{e_0} | E_01e_0=0∈H(x); E_10e_0=e_1∉H(x) | the corrected non-example E_10 is right | applied |
| D1.Modules density (H06) | b=⟨x,x⟩, u=b^(1/n) | ⟨x−xu,x−xu⟩=b(1−u)², and its norm is at most sup_t t(1−t^(1/n))², which tends to 0 | the ideal argument closes the gap | applied |

## Signatures

`#check @name` was run for all 18 declarations in one build: the `#check` lines were appended temporarily, then removed. Every type agrees with its README statement. In the scratch transcript, `hU : sorry` in `exists_integratedOperator` was an artefact of the missing import: in the build the binder elaborates as `TauCeti.ContRepresentation.IsUnitary U`. The only change is the one above: `exists_dualHaar_plancherel_inversion` now carries `[μ.Regular]` and concludes `ν.Regular`. The binders that look dropped from `IsCovariant`, `convolution`, `CentralCocycle`, `CentralCovariantPair` and `transitive_commutant_scalar` are ones their types do not use, as recorded in the review's "Verified sound" section.

## Ownership and direction

The harmonic theorems moved down into D4.Harmonic because this roadmap is on main and cannot consume VonNeumannAlgebras V11, which exists only at head 889 (head 1041 has no V11). No later roadmap is cited. Ownership against the open pull requests listed in the brief was checked with `roadmaps grep` and the checkouts. The only overlap found is VonNeumannAlgebras V11's harmonic layer at head 889 (see H01).

Dependency check output:

    depcheck: 203 roadmaps, 1656 edges, 0 problem(s)

## Build and gate

`lake build TauCetiRoadmap.OperatorAlgebraDynamics.Suggested`: Build completed successfully (8979 jobs). The only warnings are 12 `declaration uses sorry`.

    gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Commit: 84a6c17 "OperatorAlgebraDynamics: review repairs (regular Haar measures in Plancherel headline; Rudin reference placement)". Not pushed.

Rudin, *Fourier Analysis on Groups*, is cited by locator only. It is not in the sources cache, and its locators were not checked against the text this round.
