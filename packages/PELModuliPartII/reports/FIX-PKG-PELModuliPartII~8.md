# FIX-PKG-PELModuliPartII~8

Repair of the findings of `REV-PKG-PELModuliPartII~7` (two P3 findings). Both are right and both
are applied. The review's "For the human reviewers" section (the RZ96 licence question and the
untested published pagination of Zhang21 and LTXZZ22) lists no finding, so nothing was changed
because of it.

## F01 (P3) — applied

Mathlib `Module.Grassmannian` bullet: "their representability and smoothness are imported from §1.3" →
affine base represented by Tau Ceti; arbitrary base, smoothness k(m−k), tangent Hom from
AlgebraicModuliForArithmeticGeometry §1.3. New From Tau Ceti bullet (`scheme`, `toSpec`,
`schemeHomEquiv`, `isSeparated_toSpec`, `isProper_toSpec`). §0.6 bullet: "represented by §1.3" →
"represented over Spec O_L̆ by `Module.Grassmannian.scheme` …; smoothness rs is §1.3".

Same pattern, also repaired: Scope and ownership (the Grassmannian line now names the Tau Ceti
scheme for an affine base and §1.3 for the rest); the §0.6 *Needs:* line and the Layer 0
Dependencies suppliers line gain Tau Ceti `Module.Grassmannian.scheme`. The other Grassmannian uses
(§§1.2, 5.1, 7.5, the local-model diagram of Layer 7) are over a formal or global base, so they stay
with AlgebraicModuliForArithmeticGeometry §1.3 and were not changed.

Verification at the Tau Ceti pin `2fd255d9`: `Module.Grassmannian.scheme`
(`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`, `Scheme.{u}` with M in the universe of R),
`toSpec` (`Basic.lean:166`), `schemeHomEquiv` (`Points.lean:405`: points of `G(k, A ⊗[R] M; A)` ≃
morphisms `Spec A ⟶ scheme R M k` over `Spec R`), `isSeparated_toSpec` (`Proper.lean:137`),
`isProper_toSpec` (`Proper.lean:230`, under `[Module.Finite R M]`). A case-insensitive search for
"smooth" and "tangent" over `TauCeti/AlgebraicGeometry/Grassmannian/` and
`TauCeti/RingTheory/Grassmannian/` returns nothing, so the import of AlgebraicModuliForArithmeticGeometry
§1.3 (`grassmannSmoothness`, read at its open head) stays necessary. Conventions agree: Mathlib's
`Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean:66`) is submodules with finite projective
quotient of rank k, so §0.6 uses k=r. The reviewer's wording "d(n−d)" was changed to "k(m−k) for a
locally free sheaf of rank m", because n is the roadmap's hermitian rank and d is not defined in that
bullet. No headline of `Suggested.lean` concerns the Grassmannian, so the Lean docstring is unchanged.

## F02 (P3) — applied

§9.10: "Ñ¹_n" → "Ñ_n of §2.4"; "no integral identification Ñ¹_n≅Z(x₀)" → "of Ñ_n with the
special divisor Z(x₀) of §2.4". §2.4 now defines Z(x₀)⊂`N_{n+1}` (LZ22 §2.3, (10.2.0.3)), states that
π₂ factors through it, and adds a closedness route and a Check. §4.6 opens by defining 𝕏_Φ, N_Φ,
V_Φ (LL22 Definition 2.64).

Placement and pattern. The reviewer's repair defined Z(x₀) inline in §9.10. The same undefined
object also appeared in the §2.5 Check ("not an integral isomorphism of Ñ with its lifting
divisor"), so it is defined once where π₂ is constructed (§2.4, prose and the π₂ API bullet), and
§2.5 and §9.10 refer to it. The bare "Ñ" in §2.4 prose and in the §2.5 Check became "Ñ_n". The
Downstream consumers paragraph said that no special cycle is constructed here; it now excepts the
single divisor Z(x₀) of §2.4, so the roadmap agrees with itself. §4.6 gains §4.1 (Exo_Φ) on its
*Needs:* line and a third Check (f=2, n=2 dimensions and the multiplier c≠1 non-example). Sources
manifest: LZ22 locator "§§2.1–2.2" → "§§2.1–2.3"; LL22 locator gains "Definition 2.64"; RZ96 locator
gains "Lemma 2.10" and `cited_for` gains "§2.4".

Verification. The symbol in §9.10 was N + U+0303 + "¹_n" (the same combining tilde as §2.4; the
difference is the superscript ¹, LZ22's name, not an encoding). LZ22 lines 427–433 (§2.3, p. 11)
defines the special cycle Z(L) as the locus where ρ⁻¹∘x∘ρ_Ē lifts to a homomorphism Ē_S→X; lines
2859–2867 (p. 65) give the closed embedding of the mixed space in `N¹_n×N_{n+1}` and π₂ landing in
Z(x₀)⊂`N_{n+1}`. LL22 lines 2169–2175 (Definition 2.64, p. 43) give N_Φ, with "quasi-morphism"
meaning a height-zero O_E-linear quasi-isogeny with ρ*λ=λ (Definition 2.59, lines 1942–1943), and
lines 2189–2191 give V with the form "similar to (2.1)", whose u^−2 normalization is line 466.
LRZ26 Theorem 14.6.2(iii)–(iv) (lines 2622–2634) confirms π₂ is proper onto Z(u) with exceptional
fibres ℙ^{n−1}, so no integral identification holds.

## Adversarial pass on the changed text

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Tau Ceti contract: points of `scheme R M k` = `G(k, A⊗M; A)` | M=R^m with k=0, k=m, k>m; (k,m)=(1,3) | k=0: one point (N=A⊗M), scheme ≅ Spec R; k=m: N=0, ≅ Spec R; k>m over A≠0: no projective quotient of rank >m, empty; (1,3): ℙ², relative dimension 1·2=2 = rs at (r,s)=(1,2), as in the Layer 0 example | pass | none |
| Tau Ceti contract: proper for finite M | M=R^n (finite); M=R^(ℕ) (not finite) | `isProper_toSpec` needs `Module.Finite R M`: holds for R^n; the bullet claims nothing for R^(ℕ), and `isSeparated_toSpec` has no hypothesis | pass | bullet says "separated, and proper when M is finite" |
| Mathlib bullet: relative dimension k(m−k) | (k,m)=(1,n), (r,n), (0,n), (n,n) | n−1 (§1.2: n−1), rs, 0, 0 (§0.6 Check "r=0 or s=0 gives the base") | pass | d(n−d) → k(m−k) |
| §0.6: local model represented by `scheme` of O_L̆ⁿ with k=r | (r,s)=(1,2), (2,0), (0,3) | ℙ² of dimension 2=rs; G(2,O²)=point, rs=0; G(0,O³)=point, rs=0 | pass | none |
| §2.4: π₂ factors through Z(x₀) | point (Y,X,α) with β=α restricted to ℰ̄; framing compatibility ρ_X∘α=α₀∘(ρ_Y×ρ_ℰ̄) | β over the special fibre equals ρ_X⁻¹∘x₀∘ρ_ℰ̄, and β is a homomorphism over S, so the point lies in Z(x₀) | pass | stated with LZ22 locators |
| §2.4 Check: norm of β | α*λ_X=λ_Y×ϖλ_ℰ̄ (block diagonal) | λ_ℰ̄⁻¹β^∨λ_Xβ=λ_ℰ̄⁻¹(ϖλ_ℰ̄)=ϖ=h(x₀,x₀) (valuation 1); a unit vector of W_n has valuation 0 ≠ 1 | pass; wrong model (divisor of a unit vector) excluded | Check added |
| §2.4 route: Z(x₀) closed | x̃ the unique lift (rigidity, uniformizer locally nilpotent on S) with p^m x̃ a homomorphism | x̃=h a homomorphism ⇒ p^m h kills ℰ̄[p^m]; conversely p^m x̃ kills ℰ̄[p^m] ⇒ p^m x̃=h∘p^m with h a homomorphism (p^m an epimorphism with kernel ℰ̄[p^m]) ⇒ x̃=h; the vanishing is closed by RZ96 Lemma 2.10 | pass | route sentence added |
| §2.4: Z(x₀) is a proper divisor | x₀=0 versus x₀ of norm ϖ | Z(0)=N_{n+1} (every 0 lifts); x₀≠0 since h(x₀,x₀)=ϖ≠0, a Cartier divisor (LZ22 line 435) | pass | none |
| §9.10 / §2.5: no integral identification of Ñ_n with Z(x₀) | n=2, q=3 | exceptional fibre of π₂ over a centre point is ℙ¹ (LRZ26 line 2653), positive-dimensional, so π₂ is not an isomorphism; generic fibre degree of π₁ is q+1=4, deg α=9 (unchanged Checks) | pass | none |
| §4.6: N_Φ and V_Φ | f=1 | banal condition vacuous, Lie_{ψ₀}=Lie, Exo_Φ=Exo, N_Φ=N^exo, V_Φ=V^exo, μ=1: comparison is the identity (first Check) | pass | none |
| §4.6: dimension of V_Φ | f=2, n=2 | isocrystals of K₀-dimension 4 (X₀,Φ) and 8 (𝕏_Φ), free of rank 1 and 2 over E⊗K₀; the Hom isocrystal is slope 0 of K₀-dimension 8, invariants of ℚ_p-dimension 8 = L-dimension 2 = n; absolute height 8 ≠ 2 | pass | Check added |
| §4.6: framing normalization | multiplier c=1, c≠1; height 0, height 1 | LL22 line 1943: quasi-morphisms have height zero and ρ*λ=λ exactly; c≠1 and height 1 rejected, as in §3.3 Checks | pass | Check added |
| §4.6: form on V_Φ | u^−2 present versus omitted | with u^−2 the form matches (2.1) (LL22 line 466) and (2.25) is an isometry onto V^exo (Corollary 2.66); without it h is multiplied by u², not equal to the normalized form of §3.6 | pass | none |
| Downstream consumers paragraph | §2.4 now defines Z(x₀) | "no special cycles constructed here" would contradict §2.4; now excepts Z(x₀) only | pass | sentence amended |

`#check @name` audit: `Suggested.lean` declares nothing (0 declarations), so there is nothing to
compare; it was not changed.

## Checks

- `lake env lean packages/PELModuliPartII/Suggested.lean`, run from the content checkout: exit 0, no
  output. The file is unchanged (one `import Mathlib`, one docstring, an empty namespace).
- Dependency check (`gate --depcheck … --name PELModuliPartII --movable`), exact output after all
  edits:

  ```text
  depcheck: 243 roadmaps, 2257 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. It did
  not check names outside TauCetiRoadmap; the five Tau Ceti names added were checked by hand at the pin
  (file and line above).
- Backtick parity over the README: 0 lines with an odd number of backticks; no LaTeX delimiters; no
  machine path in the README, the manifest or this report.
- Gate failures: none were listed for this round.

## For the maintainer

- Ownership. The Grassmannian over an affine base is Tau Ceti's at the pin; over an arbitrary base,
  with smoothness and tangent sheaf, it stays AlgebraicModuliForArithmeticGeometry §1.3 (read at its
  open head). The special divisor Z(x₀) is the one special cycle this roadmap now defines; a search of
  main and the open heads (`roadmaps grep` for Kudla–Rapoport cycles and special divisors) finds no
  roadmap that owns special cycles on unitary Rapoport–Zink spaces (only reference-list mentions), so
  no owner is cited. N_Φ and V_Φ were already this roadmap's (Layer 4); only their definitions were
  missing.
- No name, section or id that other roadmaps cite changed; no `design/plan.json` gap changed; no
  target was added or deleted, and `Suggested.lean` is unchanged.
- Ownership against open pull requests rests on the index read this round (2026-11-15T20:41:33Z).
