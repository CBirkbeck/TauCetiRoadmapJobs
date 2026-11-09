# Review of DeligneWeightsAndPurity (pull request #929 at 5930b27)

**Verdict:** accepted

This is an incremental re-review of the 122 lines changed since e0046cb. The change does three things: it moves the pinned contract links of "From Mathlib and Tau Ceti" to the current pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`), it repairs R01 of the previous report by giving §9.7(iii) and `lefschetzPairings` a two-part locator and by writing out the arguments for the nondegeneracy and parity of `ψ_r`, and it rewords the docstring of `lefschetzPairings` to match. No finding remains, new or carried, and the gate passes.

## Previous findings

- R01 — repaired: `README.md:3062` now reads "[Lef], Théorème (1.5) and (1.6), p. 108, for (i), of which (ii) is the dimension count; [WII], §4, proof of Corollaire (4.1.5), p. 218, for the nondegeneracy and parity of `ψ_r`"; `README.md:3074–3077` gives `lefschetzDecomposition` and `lefschetzPairings` the same split; `Suggested.lean:171–173` cites Weil II (4.1.5) for nondegeneracy and parity and §9.7 for orthogonality and the primitive restriction; `README.md:3058` now argues graded symmetry, nondegeneracy on `V^{n−r}` and nondegeneracy on `P^{n−r}`. Every clause of (iii) has a locator or an argument. The repair introduced no new problem (the arguments are checked below).

## Verified sound

### Gate, dependency check, elaboration

- **Gate** rerun at 5930b27 (text scanners and dependency check): `gate DeligneWeightsAndPurity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run at this head adds `build=0`.
- **Dependency check** (`--movable`, with the board's merge order): `depcheck: 236 roadmaps, 2275 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` edge and no supplier citation.
- **Outside the folder.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/DeligneWeightsAndPurity/` is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Elaboration.** `lake env lean TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` at the pins: no error, five `sorry` warnings (lines 82, 96, 111, 154, 179).
- **Signatures.** The Lean change is a docstring only. The worker's elaborated types of the ten declarations at this head are identical to those of the previous review at e0046cb, so the comparison with the README made there stands: `lefschetzPairings` keeps `[FiniteDimensional K V]`, puts `B.Nondegenerate` and the grading condition as premises of the nondegeneracy conjunct only, and `primitivePiece` correctly drops `[FiniteDimensional K V]` (an intersection with a kernel).
- **Padding probes.** No statement changed; the previous report's `simp`/`aesop` probes on `lefschetzPairings` (goals left open) are carried forward.

### Pinned contract links (changed: the revision in every URL)

- The manifest pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`; the README sentence and all 48 links use exactly these revisions (44 Mathlib, 4 Tau Ceti). The package checkouts under `.lake/packages` are at those commits.
- Every linked file exists at the pin and declares the named object. Declaring lines at the pin, among others: `minpoly.algHom_eq` `Mathlib/FieldTheory/Minpoly/Basic.lean:71`; `IsAlgClosed.lift` `IsAlgClosed/Basic.lean:366`; `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` `NumberField/InfinitePlace/Embeddings.lean:138`; `IsAlgClosed.ringEquiv_of_equiv_of_charZero` `IsAlgClosed/Classification.lean:160`; `LinearMap.charpoly_baseChange` `Charpoly/BaseChange.lean:21`; `Module.End.hasEigenvalue_iff_isRoot_charpoly` `Eigenspace/Charpoly.lean:41`; `LinearMap.finrank_maxGenEigenspace_eq` `Eigenspace/Zero.lean:200`; `Module.End.iSup_maxGenEigenspace_eq_top` `Eigenspace/Triangularizable.lean:74`; `Module.End.independent_maxGenEigenspace` `Eigenspace/Basic.lean:732`; `Matrix.charpoly_fromBlocks_zero₂₁` `Matrix/Charpoly/Basic.lean:193`; `LinearMap.charpoly_prodMap` `Charpoly/ToMatrix.lean:60`; `Matrix.reverse_charpoly` `Matrix/Charpoly/Coeff.lean:292`; `Matrix.charpoly_inv` `Coeff.lean:313`; `Matrix.trace_eq_sum_roots_charpoly` `Matrix/Charpoly/Eigs.lean:108`; `Matrix.det_kronecker` `Matrix/Kronecker.lean:402`; `LinearMap.trace_tensorProduct'` `LinearAlgebra/Trace.lean:258`; `LinearMap.det_dualMap` `Determinant.lean:781`; `Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` `IsAlgClosed/Basic.lean:267`; `LinearMap.aeval_self_charpoly` `Charpoly/Basic.lean:88`; `Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` `RingTheory/Polynomial/Basic.lean:870`; `AddValuation` `Valuation/Basic.lean:1078`; `Multiset.sort` `Data/Multiset/Sort.lean:33`; `MonoidHom.eqLocus` `Subgroup/Ker.lean:388`; `exteriorPower.map` `ExteriorPower/Basic.lean:260`; `Module.Basis.exteriorPower` `ExteriorPower/Basis.lean:95`; `Representation.IsSemisimpleRepresentation` `RepresentationTheory/Semisimple.lean:34`; `LinearMap.BilinForm.Nondegenerate` `BilinearForm/Properties.lean:291` (abbreviation of `LinearMap.Nondegenerate`); `LinearMap.BilinForm.restrict_nondegenerate_iff_isCompl_orthogonal` `BilinearForm/Orthogonal.lean:285`; `DirectSum.IsInternal` `DirectSum/Basic.lean:440`; `Even.pow_nonneg` `Order/Ring/Basic.lean:89`; `MonoidHom.mrange` `Submonoid/Operations.lean:642`; `exists_finite_inj_algHom_of_fg` `RingTheory/NoetherNormalization.lean:292` (the new `#L292` anchor of `README.md:2224` is exact; it was `#L287` at the old pin). Tau Ceti: `TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` `RepresentationTheory/Induction/Clifford/Basic.lean:327`; `LinearMap.BilinForm.IsAlt.even_finrank` `LinearAlgebra/BilinearForm/SymplecticBasis.lean:365`; `AbelianVariety` `AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `WeierstrassCurve.hasse_bound` `EllipticCurve/HasseBound.lean:57` and `frobeniusTrace_sq_le_four_mul_card` at line 44, the file without `sorry`, the proof rewriting through `frobeniusTrace_eq_card_point` (line 59). The previous report's remark that `README.md:201` still linked the old Tau Ceti pin is resolved by this change.

### The repaired locators, re-opened in the sources cache

| Target | Locator opened | Supports the statement as written |
| --- | --- | --- |
| 9.7(i) | Lef line 50 (header "108 P. DELIGNE"), lines 58–71: Théorème (1.5) and the two decompositions (1.6) with exponents `k` and `i+k` from the primitive parts `ker u^{i+1}` | yes: this is (i). (ii) is not stated there; the README says so ("of which (ii) is the dimension count"), and the count follows from (i): `dim V^{n−r} = Σ_k dim P^{n−r−2k}`, `dim V^{n−r−2} = Σ_{k≥1} dim P^{n−r−2k}` |
| 9.7(iii), nondegeneracy and parity | WII line 3073 (header "218 PIERRE DELIGNE"), lines 3097–3102: Corollaire (4.1.5) and proof: for `η = c₁(ℒ)` ample, `Tr(η^i x y)` on `H^{n−i}(X)` is nondegenerate by (4.1.1) and Poincaré duality, alternating for `n − i` odd | yes, in the cohomological case, exactly as the README and the docstring say ("from hard Lefschetz and Poincaré duality"); the arbitrary-form clauses are argued in the README, checked below |
| `lefschetzDecomposition` docstring | Lef (1.5)–(1.6), p. 108 | unchanged, yes |
| `lefschetzPairings` docstring | WII proof of (4.1.5), p. 218; §9.7 for orthogonality and primitive restriction | yes; agrees clause by clause with `README.md:3058` and `README.md:3074–3077` |

### Adversarial computations

Rows for the three new arguments of `README.md:3058`, the two locator sentences, the dimension-count clause and the pin change are new. Every other row is carried forward unchanged: the previous report's rows for 9.7(iii)a–c, the new Check, `lefschetzPairings`, 9.8, 9.2 and 9.10; the rows of `PRREVIEW-DeligneWeightsAndPurity~3` for 1.6, 1.8 and 8.13; the rows of `PRREVIEW-DeligneWeightsAndPurity~2` for sections 0.1–0.19, 1.1–1.5, 1.7, 1.9–1.10, 2.1–2.11, 3.1–3.11, 4.1–4.4, 5.1–5.19, 6.1–6.5, 7.1–7.15, 8.1–8.12, 8.14–8.24, 9.1–9.6, 9.9, 9.11–9.12, 10.1–10.6 and the headlines `abelianPointCountBound`, `finiteFieldZetaRationality`, `degreeFactorExtraction`, `lefschetzDecomposition`. Those passages did not change. The seeded sample of this round (0.3, 0.4, 0.8, 0.17, 1.4, 5.1, 5.2, 5.6, 5.12, 5.14, 7.3, 8.3, 9.1, 9.12, 10.2) falls entirely outside the changed passages and is covered by those carried rows.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 9.7(iii) nondegeneracy on `V^{n−r}` (new argument: grading kills `B(V^{n+r}, V^b)` for `b ≠ n−r`, then bijectivity of `λ^r`) | `ℙ¹×ℙ¹` model `n=2`, `V^0=K`, `V^2=⟨a,b⟩`, `V^4=K·ab`, `η=a+b`, `B=Tr(xy)`, `Tr(ab)=1`, `a²=b²=0`; chain `n=1`, `V^0=Ke₀`, `V^2=Ke₂`, `λe₀=e₂`, `B(e₀,e₂)=B(e₂,e₀)=1` | grading: `B(V^0,V^0)=Tr(1)=0`, `B(V^2,V^4)=0` (degree 6), `B(V^0,V^2)=0`; `r=0`: `ψ₀` on `V^2` has matrix `[[0,1],[1,0]]`, `det=−1≠0`; `r=2`: `ψ₂(1,1)=Tr(η²)=Tr(2ab)=2≠0` (`K=𝔽₃`: `2≠0`); chain, `r=1`: `z=e₂∈V^2`, `B(z,V^0)=B(e₂,e₀)=1≠0`, `ψ₁(e₀,e₀)=1`; `λ^r` bijective so `ψ_r(x,·)=0 ⇒ λ^r x ⟂ V^{n−r} ⇒ λ^r x=0 ⇒ x=0`; right variable: `ψ_r(·,y)=0 ⇒ B(V^{n+r},y)=0` by surjectivity `⇒ y=0`; both separations, as `Nondegenerate` at the pin is `SeparatingLeft ∧ SeparatingRight` | pass |
| 9.7(iii) nondegeneracy on `P^{n−r}` (new argument: orthogonality plus spanning (i)) | `ℙ¹×ℙ¹`, `r=0`; the same over `K=𝔽₃`; negative control `V=K`, `λ=0`, `B=0` (the fifth Check) | `P²=V^2∩ker η=K(a−b)` (`η(a−b)=a²−b²=0`, `ηa=ab≠0`); `λP⁰=Kη`; `ψ₀(a−b,η)=Tr(a²−b²)=0` (orthogonal); `ψ₀(a−b,a−b)=Tr(−2ab)=−2≠0`, over `𝔽₃` equal to `1≠0`; so `x∈P²` with `ψ₀(x,P²)=0` and `ψ₀(x,λP⁰)=0` has `ψ₀(x,V^2)=0`, `x=0`; control: `P⁰=K`, `ψ₀=0` degenerate, excluded by `B.Nondegenerate` | pass |
| 9.7(iii) graded symmetry (new chain of equalities `ψ_r(y,x)=B(λ^r y,x)=(−1)^{n−r}B(x,λ^r y)=(−1)^{n−r}ψ_r(x,y)`) | curve model `n=1`, `V^1=⟨e,f⟩`, `B(e,f)=1=−B(f,e)`, `B(e₀,e₂)=B(e₂,e₀)=1`, `λe₀=e₂` | hypothesis `B(y,x)=(−1)^a B(x,y)` for `x∈V^a`: `B(f,e)=−1=(−1)^1·1`, `B(e₂,e₀)=1=(−1)^0·1`; `r=0`: `ψ₀(f,e)=−1=(−1)^1ψ₀(e,f)`; `r=1`: `ψ₁(e₀,e₀)=B(e₂,e₀)=1=(−1)^0·1`; the second equality applies the hypothesis to `x∈V^{n−r}` and `λ^r y`, the third is self-adjointness `B(x,λ^r y)=B(λ^r x,y)`; char 2: `−1=1`, only symmetry claimed | pass |
| 9.7(ii) as "the dimension count" of (i) | `ℙ¹×ℙ¹`, `r=0`; chain `e₀→e₂→e₄`, `n=2`, `r=0`; boundary `r=n=2` | `dim P²=1=2−1=dim V^2−dim V^0`; chain: `P²=0`, `1−1=0`; `r=n`: `dim P⁰=1=dim V^0−dim V^{−2}=1−0` (`V^{−2}=⊥` by `hout`; the Lean difference is in `ℤ`, no natural subtraction) | pass |
| Locator sentences `README.md:3062`, `3074–3077` | Lef lines 50–71; WII lines 3073–3102 | printed pages 108 and 218 read from the page headers; theorem numbers (1.5), (1.6), (4.1.5) read at the lines; the WII clause is restricted to "the cohomological case", as the source is | pass |
| Pin change of the contract list | 48 links, manifest revisions | 44 links at `1b1ccf4`, 4 at `2fd255d`, 0 at any other revision; 48 files present; 48 declarations located (lines above) | pass |
| `lefschetzPairings` docstring (changed) | elaborated type vs docstring | type unchanged since e0046cb; the docstring's four claims (orthogonality under `hadj` alone, `(−1)^{n−r}`-symmetry under the graded symmetry, nondegeneracy on `𝒱(n−r)` and on the primitive piece under `B.Nondegenerate` and the grading, no characteristic or semisimplicity assumption) each match a conjunct or the absence of a binder | pass |

### Remark on untouched text (no change requested)

The grading hypothesis `B(V^a,V^b)=0` unless `a+b=2n` of the nondegeneracy clause is sufficient but not necessary: self-adjointness and hard Lefschetz already force `B(V^a,V^b)=0` whenever `a+b>2n` (decompose `y` into `λ^k`-images of primitive vectors and move the powers of `λ` onto the side killed by the primitivity exponent), and a dimension count on the flags `⊕_{b≥m}V^b` then gives nondegeneracy of `ψ_r` on `V^{n−r}` for every nondegenerate self-adjoint `B`. The chain `n=1`, `B(e₀,e₀)=c≠0`, `B(e₀,e₂)=B(e₂,e₀)=1`, `B(e₂,e₂)=0` is self-adjoint, nondegenerate (`det=−1`), violates the grading, and still has `ψ₁(e₀,e₀)=1≠0`. The statement as written is true, the README's argument uses the hypothesis, and every consumer (the trace pairing) satisfies it; the stronger form is available if a consumer ever needs it.

### Cross-roadmap citations and consumers

- The diff adds no cross-roadmap citation; the worker's citation and overlap checks list nothing missing, nothing dropped and no other pull request changing this roadmap.
- Consumers of `lefschetzPairings` at their open heads: LefschetzStructures (`README.md:47,168,283,286`) consumes §9.7's `lefschetzPairings` and `primitivePiece`; the statement is unchanged, so the citation is unaffected. §9.8's Examples (`README.md:3177`) compute `ψ₁` on `H⁰` as multiplication by `e` and `ψ₀` on `H¹` alternating, consistent with the parity clause (`(−1)^{n−r}` with `n=1`, `r=0`).
- Ownership against open pull requests was checked only through the sibling heads the brief provides and the `roadmaps grep` index.

### Shape

The changed passages are prose with hypotheses in the sentence, no LaTeX, no process words, no pull-request numbers, no local paths. The locator sentences name the roadmap's own definitions in backticks only where `Suggested.lean` declares them. The docstring states the mathematics and the sources.

## Not verifiable

- Nothing this round needed an unreadable text. [Int] (SGA 7 II XXI §5, §§7.9–7.10) is still cited by locator only, as in the previous reports; those passages are unchanged.

## Source issues

- none
