# Review of PadicHodgeTheoryPartII (pull request #2412 at b7f4b9b)

**Verdict:** accepted

## Previous findings

- R01 — repaired: §0.2 (README:141): "the degree sum d_s(v) = … is Mathlib's Birkhoff sum `birkhoffSum` of d along φ with s terms, evaluated at v"; the three API bullets now cite `birkhoffSum_zero_apply`, `birkhoffSum_one_apply`, `birkhoffSum_succ_apply`. From Mathlib (:43) and Layer 0 Dependencies (:249) cite them.
- R02 — repaired: §3.4 (README:455): "`BialgHom.comap_derivedDefiningIdeal_of_injective` makes the scheme-theoretic image of D(J°), which is f(D(J°)), equal to D(f(J°))". The declaration is also in From Tau Ceti (:47), the §3.4 *Needs:* line and the Layer 3 Dependencies (:481), together with `semisimple_derived`.
- R03 — repaired: §1.5 (README:321): "This μ^◇ is the Galois average of BunGAndNewtonStrata §1.7 … averaging first over N gives μ̄, and then over Q/N gives `(1/m)Σ_{0≤i<m}` σ_0^i(μ̄), which equals the s-term average because σ_0^m μ̄ = μ̄ and m divides s."
- R04 — repaired: the description now says "the targeted Lake build succeeds with no warnings (the file states no declarations)" and "DeligneWeightsAndPurity is named only because its §2.2 states the Sp(V) case of §3.3, and is not a supplier."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §0.2 d_s = `birkhoffSum φ d s v` (sampled) | three-cycle (2,0,−5) at point 0; involution (1,−1); φ = id; s = 0, 1 | `decide`: 3-term −3, 2-term 2; involution 0, 0; id: s·d(v) (`Function.IsFixedPt.birkhoffSum_eq`); s = 0: 0; s = 1: d(v) | holds | none |
| §0.2 wrong model | shifted sum `Σ_{1≤i≤s}` on the three-cycle, s = 2 | shifted: 0 + (−5) = −5; `birkhoffSum`: 2 + 0 = 2. The recursion `birkhoffSum_succ_apply` excludes the shifted model | excluded | none |
| From Mathlib `birkhoffSum` contract | elaborated types at the pin, lines 31, 33, 42, 51 | succ: `birkhoffSum f g (n+1) x = birkhoffSum f g n x + g (f^[n] x)`, which is d_{s+1} = d_s + d(φ^s v); the target ℤ is an `AddCommMonoid` | holds | none |
| §1.5 μ^◇ = orbit average (sampled) | split GL₂, μ = (1,0); `Res_{Q_{p²}/Q_p}𝔾_m`, μ = e₁, s = 2 and s = 4 | GL₂: Q = 1, m = 1, both give (1,0) (BunG §1.7 Check). Res: N = 1, m = 2, both s give (e₁+e₂)/2 = orbit average | holds | none |
| §1.5 μ^◇ = orbit average | quasisplit unramified U(3), s = 2, μ = (1,0,0); ramified norm-one torus, s = 1, μ = 1; cyclic quartic torus | U(3): σ₀(a,b,c) = (−c,−b,−a), giving (½,0,−½) both ways. Norm-one: μ̄ = 0 = μ^◇ (BunG Check). Quartic: ¼Σe_τ both ways | holds | none |
| §1.5 d_s(v) ≤ s⟨w₀λ, μ^◇⟩ | `Res_{Q_{p²}/Q_p}𝔾_m`, b = 1, μ = e₁, V standard, s = 2 | χ₁- or χ₂-line: d₂ = 1+0 = 1 ≤ 2·½ = 1; generic v: 0 ≤ 1. With unaveraged μ̄ = e₁: bound 2⟨χ₂,e₁⟩ = 0 < 1 | holds; Frobenius average needed | none |
| §3.4 central lifting | GL₂→PGL₂ with J = SL₂, and with J = Borel | SL₂: ker∩SL₂ = μ₂ ⊆ Z(SL₂), dim_k O(μ₂) = 2; dim D(J°) = 3 = dim SL₂. Borel: f(D(B)) = U′ = D(B′), dimension 1; hypothesis fails | holds | none |
| §3.4 central kernel needed | det: GL₂→𝔾_m, J = diagonal torus T | ker ∩ G̃_der = SL₂ ⊄ Z(SL₂) = μ₂, so the finite-centre step fails; f(T) ⊇ 1, yet T ⊉ SL₂ | hypothesis needed | none |
| From Tau Ceti comap contract (Image.lean:58) | elaborated type; H = O(f(J°)), K = O(J°); SL₂→PGL₂ in characteristic 2 | Only `[Field k]`, no finite type: (I_K).comap f = I_H, so image of D(J°) = D(f(J°)). Char 2: O(PGL₂) ↪ O(SL₂), image PGL₂ = D(PGL₂) | holds | none |
| `semisimple_derived` (:90), `moduleFinite_centerCoordinate` (:92) | GL₂, 𝔾_m over Q_p | D(GL₂) = SL₂ semisimple, centre μ₂ of dimension 2; D(𝔾_m) = 1, trivial centre; hypotheses: reductive (resp. semisimple), finite type, any field | holds | none |

The rows for the statements this change leaves untouched (§§0.1, 0.5, 0.7, 1.2–1.4, 1.6, 2.1–2.4, 3.2, 3.3, 3.5, 4.1, 4.2) stand as in the previous review, of fdbccfd.

- Source locators checked against the cached texts (5): GLX26 (2.5)–(2.7), lines 585–595, pp. 14–15; GLX26 (5.4), line 1316, p. 33 (§0.2); GLX26 (5.30)–(5.36), lines 1659–1685, p. 39 (§1.5); Milne iAG 8.20–8.23, lines 5283–5333, pp. 131–132. Each has the right number, page and hypotheses. The other sampled targets lie in text this change leaves untouched.
- Library declarations: 9 `#check`ed in one scratch file, with file and line confirmed at the pins. Mathlib: `birkhoffSum`, `birkhoffSum_zero_apply`, `birkhoffSum_one_apply`, `birkhoffSum_succ_apply` (Basic.lean:31, 33, 42, 51). Tau Ceti: Image.lean:58, Semisimple.lean:90, Center/Finite.lean:92, Functoriality.lean:68, Connected.lean:153. The dropped `mapPointsFunctor_derivedMap_app_surjective` and `faithfullyFlat_derivedMap` appear nowhere else in the README.
- Cross-roadmap citations in the changed text (2): BunGAndNewtonStrata §1.7 at its open head (μ◇ is the Γ-orbit average) and ReductiveGroups Layer 7 on main. Layer 1 Dependencies already list both. The declared gaps are untouched.
- Gate: OK (every check 0). Dependency check: `depcheck: 234 roadmaps, 2232 edges, 0 problem(s)`. `lake env lean Suggested.lean` exits 0 with no output. `Suggested.lean` is byte-identical to fdbccfd. No change outside the folder.
- Pull-request title and description, read against this head: no sentence is contradicted. The validation sentence (no warnings, 0 dependency problems, 0 paths outside the folder) matches. The change adds no supplier and removes no section or declaration.
- Overlap check: read AdmissiblePairsAndPadicHodgeStructures, BunGAndNewtonStrata, ReductiveGroupsPartIII, HeckeStacksAndLocalShtukas, PadicHodgeTheory, ReductiveGroupsPartII, ReductiveGroups, AdelicAlgebraicGroups (scope as in the previous review). Owners of the objects the change touches: degree sum → Mathlib `birkhoffSum`; derived-image equality, semisimplicity of the derived group and finiteness of the centre → Tau Ceti; μ^◇ → BunGAndNewtonStrata §1.7. `roadmaps grep -i birkhoff` finds no second owner, only ArithmeticDynamics' unrelated pointwise ergodic theorem.
- Source independence: changed passages only; 10 passages compared with 4 sources (GLX26, MilneiAG, the pinned Mathlib and Tau Ceti docstrings), none shared beyond formula-forced runs or statements of about a dozen words from the Apache-licensed pins; largest share GLX26, 43 of 66 locators; contents not compared again with GLX26, since no layer was added, removed or reordered (compared at fdbccfd: independent).

## Not verifiable

- none

## Source issues

- **Misprint** in GLX26 at proof of Theorem 5.8, equation (5.34), p. 39: the source turns each summand ⟨w₀φ₀^iλ, μ̄⟩ into ⟨w₀λ, φ₀^iμ̄⟩ by equivariance. It should be φ₀^{−i}μ̄ (for `Res_{Q_{p³}/Q_p}𝔾_m`, λ = χ_{σ²}, i = 1: 1 versus 0); the full-period sums agree after reindexing; affects nothing.

## For the human reviewers

- none
