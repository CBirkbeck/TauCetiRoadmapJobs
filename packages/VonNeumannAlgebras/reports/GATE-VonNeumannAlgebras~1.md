# GATE-VonNeumannAlgebras~1 — answers to review of head 4831498

Commit `8b00f8a8` (on top of `4831498`), not pushed. Files: `TauCetiRoadmap/VonNeumannAlgebras/README.md`, `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean`.

## H01 (roed-math) — applied
V2's last paragraph ("For σ-finite measure spaces … direct sum.") now has an explicit comparison target between the abelian classification and the generator. For normal a on separable H: a finite Borel control measure μ on σ(a) with `μ(B)=0 ↔ P_a(B)=0`, and an isometric unital star isomorphism `L∞(σ(a),μ) ≅ W*(a)`, `[f] ↦ f(a)`. It states independence of the representative, the essential-sup norm, agreement with the CFC, indicators going to P_a(B), and surjectivity. For H=0 it takes the zero measure (H≠0: probability). The route is the reviewer's countable-weights / Kaplansky / L²-Cauchy one, with *Needs:* SelfAdjointSpectralTheory SA-B05–B11, SA-B30, SA-B46, SA-B49–B53 and V1, and an explicit statement that it uses neither SA-B85–B86 nor V4.0.Fields. The classification paragraph now derives the atomic/nonatomic split through this comparison (Peterson Thm 2.8.9, pp. 38–39). The target is stated for normal rather than self-adjoint a because Houdayer Thm 3.4 (p. 13) is stated for normal T; the self-adjoint generator is the case the classification uses. On main, SelfAdjointSpectralTheory's Part B header says SA-B85 consumes V4.0.Fields, and SA-B86 compares inside SA-B85's model. Consuming either here would therefore be a cycle, so the comparison is owned here.

## H02 (roed-math) — applied differently
V2 "prove associativity, flip and normal inclusions" → the canonical maps `x↦x⊗1_K` and `y↦1_H⊗y` are normal unital star homomorphisms with no hypothesis. They are injective (hence isometric) when K≠0, resp. H≠0. The README states `M⊗̄0=0` and `0⊗̄N=0` and gives the ℂ-on-ℂ, 0-on-0 counterexample. The README does not say "iff": for H=K=0 the left map 0→0 is injective although K=0, so the README says the map is zero when K=0 and injective only if H=0 as well.

## H03 (roed-math) — applied
V3 line 173 "Prove the group/subgroup free-module rank formula using coset representatives." → `ℂ[Γ]` is a free left `ℂ[Η]`-module on representatives of the right cosets Ηg, of rank [Γ:Η] (Jones §4.5, p. 29). The line now says explicitly that this is about the algebraic group rings, and it includes the reviewer's `(2−U)⁻¹ = Σ 2^(−n−1)Uⁿ ∈ L(ℤ)` example to show why. Check: `(2−U)⁻¹ = ½(1−U/2)⁻¹`, and applied to δ₀ it gives `Σ 2^(−n−1)δ_n`, which has infinite support. The source places §4.5 on p. 29 only, not pp. 28–29.

## H04 (roed-math) — applied
V2 "Hilbert completion of the algebraic tensor product with its product inner product, quotienting any null seminorm" → the completion of Mathlib's inner-product space `TensorProduct ℂ H K` (no null quotient), extending `TensorProduct.mapL`, `TensorProduct.commIsometry` and `TensorProduct.assocIsometry`. All three are at the pin in `Mathlib/Analysis/InnerProductSpace/TensorProduct.lean` (lines 602, 347, 437; `instInnerProductSpace` line 145, `norm_tmul` line 147).

## H05 (roed-math) — applied
V4.Core "proving Krein–Smulian for the required dual Banach spaces" → consumes BanachSpaceTheory B2's Krein–Šmulian (on main, B2, the "Krein–Šmulian" bullet) and owns only its W*-algebra specialization. The opening supplier paragraph now also lists B2. Pinned Mathlib has no Krein–Šmulian: a grep for Krein/Smulian finds only Krein–Milman files.

## H06 (roed-math) — applied
V4.0.Fields "Construct measurable essentially bounded operator fields" → "…, taken modulo almost-everywhere equality".

## H07 (roed-math) — applied
V4.0.Fields gains a comparison target: if every member of one fundamental family is measurable for another, the two give the same measurable sections, square-integrable sections and direct integral. The route is measurable Gram–Schmidt on the first family. One direction of membership is enough: for B-measurable s, `⟨s,a_n⟩ = Σ_k ⟨s,e_k⟩⟨e_k,a_n⟩`, where (e_k) is the measurable Gram–Schmidt basis of B. Conversely, A-measurable sections pair measurably with the A-measurable b_m.

## Further repairs (gate failures at the reviewed head, not raised by the review)
- `Suggested.lean`: the six `import Mathlib.<submodule>` lines → the single line `import Mathlib`.
- `generated`: its `centralizer_centralizer'` field was `sorry` (sorry'd data). It is now proved by `StarSubalgebra.coe_centralizer_centralizer` and `Set.centralizer_centralizer_centralizer` (`Mathlib/Algebra/Star/Subalgebra.lean:332`, `Mathlib/Algebra/Group/Center.lean:183`).
- README: a `## References` section for the three newly cited sources.

The other form deviations of this file were not in the review and are left unchanged: the module docstring is not in the "target signatures" form, the namespace is `VonNeumannAlgebra` rather than `TauCetiRoadmap.VonNeumannAlgebras`, and several declarations have no docstring.

## Adversarial pass on changed statements

| statement | instances | values | result / change |
|---|---|---|---|
| `L∞(σ(a),μ) ≅ W*(a)` | H=0, a=0 | σ(a)=∅ (every scalar is a unit in the zero ring), μ=0, both sides are the zero algebra | holds only with the zero measure, so "probability" is restricted to H≠0 |
| same | a=diag(1,1,2) on ℂ³ | σ={1,2}, μ({1}),μ({2})>0, L∞=ℂ²=W*(a), ‖f(a)‖=max(\|f(1)\|,\|f(2)\|)=ess sup | holds |
| same, wrong model: Lebesgue measure | a = (mult. by x on L²[0,1]) ⊕ 2 on ℂ | σ=[0,1]∪{2}; Lebesgue gives {2} measure 0 but P({2})≠0 | excluded by `μ(B)=0 ↔ P_a(B)=0` |
| same, route weights | H=0 | no unit vectors; "Σw_n=1" impossible | changed to "positive summable weights (family empty when H=0)" |
| abelian classification | zero algebra; ℓ∞(ℕ); L∞[0,1] | ℓ∞(∅); atoms only; no atoms | holds; zero algebra = ℓ∞ of ∅ added (Peterson: "possibly empty") |
| tensor maps injective | M=ℂ/H=ℂ, N=0/K=0 | `ℂ⊗0=0`, left map ℂ→0 is zero | not injective, consistent with K≠0 being needed |
| same | H=K=0 | left map 0→0 is injective with K=0 | refutes "iff"; phrased as "when K≠0" plus the zero case |
| same | K=ℂ | `‖x⊗1‖=‖x‖·1` | isometric |
| group ring basis | Η=Γ; Η=1; Γ=S₃, Η=⟨(12)⟩ | rank 1; rank \|Γ\|; rank 3 with `ℂ[Η]g = span(Ηg)` | right cosets are correct for a left module |
| group-vNA non-example | Η=1, Γ=ℤ | `(2−U)⁻¹δ₀ = Σ2^(−n−1)δ_n` | infinite support; correct |
| fundamental-family comparison | constant fibre ℂ, A={1}, B={f} with f measurable and nowhere zero | ⟨s,1⟩ measurable ⇔ ⟨s,f⟩ measurable | holds; non-measurable f falls outside the hypothesis |
| `generated` triple centralizer | — | carrier = `(s∪star s)′′`; `′′′′ = ′′` | proved, no `sorry` |

Signatures: the types of the 12 declarations are textually unchanged; only the body of `generated` and the imports changed. The brief allows only the build and gate commands, so no separate `#check @name` scratch file was elaborated. The comparison rests on `scratch/signatures.md` (0 lost binders) and a clean build after the import change.

Sources: Houdayer (Thm 3.4, p. 13), Peterson (Thm 2.8.5–2.8.6, Cor 2.8.7, p. 38; Thm 2.8.9, pp. 38–39) and Jones (§4.5, p. 29) were fetched from the authors' pages through the sources service, and every locator above was read there. No `sources.toml` exists in the folder, and this job may not create one, so the manifest entries are left to the worker.

Ownership against open pull requests: the L∞ comparison and the fundamental-family comparison sit inside this roadmap's own V2 and V4.0.Fields. On main, SelfAdjointSpectralTheory SA-B85/86 consume V4.0.Fields, so this roadmap is the upstream owner. A search of the open-PR sibling checkouts for a competing owner of these two objects was not done.

## Build
`lake build TauCetiRoadmap.VonNeumannAlgebras.Suggested`: Build completed successfully (8976 jobs). It reports 5 `declaration uses 'sorry'` warnings, on theorems only; the reviewed head had 6, and `generated` now carries no sorry.

## Depcheck
`depcheck: 148 roadmaps, 1006 edges, 0 problem(s)` (no UPWARD or CYCLE line).

## Gate
`gate VonNeumannAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
