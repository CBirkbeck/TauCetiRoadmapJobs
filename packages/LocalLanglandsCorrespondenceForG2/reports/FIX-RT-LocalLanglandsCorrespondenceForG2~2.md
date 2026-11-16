# Repair report: red-team round 2 of LocalLanglandsCorrespondenceForG2

Files changed: `packages/LocalLanglandsCorrespondenceForG2/README.md` and `packages/LocalLanglandsCorrespondenceForG2/design/plan.json` (top-level `gaps` only: four new entries, two `needs` rewritten). `Suggested.lean`, `sources.toml` and `metadata.toml` are unchanged: no declaration is affected, and every new locator is in GS or GF, both already in the manifest. No text is missing, so there is no `needs-references.toml`.

## RT-LocalLanglandsCorrespondenceForG2~2a/F01 (P1) — applied differently

Three contracts are now declared on ModularityAndLanglandsExtensions, Layer 3, §3.15: gap:classical-discrete-packets, gap:classical-packets-parabolic-induction and gap:classical-packets-cuspidal-support. Each is in the README and in `plan.json`. They are cited in the routes and *Needs* lines of §§2.0, 3.1, 3.4, 3.6, 3.7, 5.1, 5.2, 5.5, 6.1, 8.2, 9.3, 10.2 and 10.8, and in the Dependencies of Layers 2, 3, 5, 6, 8, 9 and 10. Scope and ownership names all three.

Where the text differs from the proposal:
- **Rank bounds.** The discreteness clause ("multiplicity-free sum of irreducible orthogonal summands") is false for split SO₂. That group is a torus, so all of its parameters are discrete, yet χ ⊕ χ⁻¹ with χ² ≠ 1 is not such a sum. The two contracts that mention discreteness are therefore stated for Sp₂ₙ with n ≥ 1 and split SO₂ₙ with n ≥ 2.
- **More consumers.** §3.7 also needs gap:classical-discrete-packets (a discrete series in Irr♦ has a discrete v ∘ L(π)), and so does §6.1.
- **Steinberg Check.** The §2.0 Check now derives the Steinberg value Sym⁶ step by step.

## RT-LocalLanglandsCorrespondenceForG2~2a/F02 (P2) — applied differently

The spin-factor contract now states the global functional equation and names the factor at an archimedean place v: the Weil-group factor γ(s, s ∘ φ_v, Ψ_v). In §2.4, at a complex place, both sides have that factor, so R_v = 1. Following the same pattern, the complex-place contract is cut back to parameters only: constituents of the f₂-pullback have parameter s ∘ φ_σ.

Where the text differs from the proposal: the proposal copies GS's display L^S(1 − s, Σ∨) = ∏γ · L^S(s, Σ). With γ = ε · L(1 − s, ·∨)/L(s, ·), which is the convention of §2.4's first Check and of AL.3.6.2 (Λ(s) = ε Λ(1 − s, ∨)), that display is inverted. The witness is ζ(s) = γ_∞(s) ζ(1 − s) at s = 2: γ_∞(2) = Γ_ℝ(−1)/Γ_ℝ(2) = −2π², and −2π² · (−1/12) = π²/6. The contract therefore states L^S(s) = ∏γ · L^S(1 − s, ∨).

The same inverted display was repaired in §3.11(ii), which follows GF p. 5. That section gains a Check on ζ, and a Notes-on-the-sources entry records the change.

## RT-LocalLanglandsCorrespondenceForG2~2a/F03 (P3) — applied

"the centralizer comparison is Gross–Savin's" → a proof route with locator (GS, §8.3, p. 24).

The route:
1. s ∘ i ∘ φ = 1 ⊕ v ∘ φ, and v ∘ φ has no invariant vector (§0.2). So the invariant spinors form one line ℂx₀, x₀ is nonisotropic, and its stabilizer is i(G₂).
2. The centralizer acts on x₀ by ±1, and −1 ∈ Z(Spin₇) acts by −1. So Z_Spin₇(i ∘ φ) = i(Z_G₂(φ)) × μ₂.
3. Dividing by the image of μ₂ gives S_φ.

Check: for the principal parameter this gives the trivial quotient of μ₂.

## RT-LocalLanglandsCorrespondenceForG2~2b/F01 (P2) — applied

- **First statement of §2.3.** It now assumes that the global SO₈ parameter Ψ is generic (every b_i = 1). Its route is: image statement of §5.1 → a Whittaker-generic member of the packet of Ψ_v → §3.25 → the component's parameter is Ψ_v. It now covers complex places too.
- **Second statement of §2.3.** New contract gap:pgsp6-pgso8-global-generic-theta on MetaplecticAutomorphicForms: the lift is globally generic, f₂ preserves Whittaker coefficients, so by §5.1 and AL.3 Ψ is generic.
- **New Check.** It records why the hypothesis is needed.
- **Consumers.** §§2.4 and 5.2 cite the second statement.

## RT-LocalLanglandsCorrespondenceForG2~2b/F02 (P2) — applied

- **Contract.** pgsp6-shahidi-spin-factor (README and `plan.json`) now includes γ(s, σ, spin, ψ_a) = |a|^(8(s−1/2)) γ(s, σ, spin, ψ).
- **§2.4 Check.** It now explains both sides: the Langlands–Shahidi side by this rule, the GL₈ side by det(s ∘ φ) = 1. Instance: ℚ₅, s = 2, a = 5 gives 5⁻¹² on both sides. It also says what fails without the rule.
- **§2.4 *Needs*.** It lists the rule and the archimedean factors.
- **Notes on the sources.** A new entry records GS's single global character.

## RT-LocalLanglandsCorrespondenceForG2~2b/F03 (P3) — applied

- "GL₁ × PGSp₄ Levi" → "Klingen Levi, image of GL₁ × GSp₄ ≅ GSp₄ via (a, g) ↦ a⁻¹g". This changes the supplier contract and the §9.3 Check.
- §9.3's "types GL₃, GL₂ × PGL₂ quotient, GL₁ × PGSp₄ quotient" → "images of GL₃ × GL₁, GL₂ × GSp₂, GL₁ × GSp₄, isomorphic to GL₃, (GL₂ × GL₂)/GL₁, GSp₄". The old GL₂ × PGL₂ description was wrong as well: (GL₂ × GL₂)/GL₁ has derived group SO₄, while GL₂ × PGL₂ has derived group SL₂ × SO₃.
- New Check: a central character with ω(−1) = −1 is missed by a GL₁ × PGSp₄ model.

## RT-LocalLanglandsCorrespondenceForG2~2b/F04 (P3) — applied

The §2.0 bullet changes from "constant … on O₈(F)-orbits for SO₈" to "… on GO₈(F)-orbits (orthogonal similitudes, containing O₈(F)- and PGSO₈(F)-conjugation)". The argument is unchanged: the stable character identity is invariant under conjugation by similitudes. §2.2's independence of the constituent now cites this (one GSO₈(F)-orbit).

## RT-LocalLanglandsCorrespondenceForG2~2b/F05 (P3) — applied

- **§3.15 hypothesis.** "ρ_Π(Frob_v)^ss conjugate to the Satake class" → "fix ℓ and ι : ℚ̄_ℓ ≅ ℂ; ι(ρ_Π(Frob_v)^ss) conjugate to v of the Satake class".
- **§3.15 conclusion.** It is now "transported by ι, is L(Π_u)".
- **New Check.** Swapping arithmetic and geometric Frobenius dualizes ρ_Π, and G₂ classes are inverse-stable: the eigenvalues 1, a^(±1), b^(±1), (ab)^(±1) are closed under inversion, and the Chevalley involution is inner.

## RT-LocalLanglandsCorrespondenceForG2~2b/F06 (P3) — applied

- **§6.1 *Needs*.** "§0.3, §2.4, §2.5, §5.2" → "§0.3, §0.4, §2.4, §2.5, §3.2, §5.2". The route now ends "θ(π) = σ, so v ∘ L(π) = q ∘ i ∘ φ (§3.2) and L(π) = φ (§0.4)".
- **§6.2.** "§5.3 makes their KS parameters i ∘ φ ⊗ χ" → "§5.3 and §2.5 make their KS parameters χ · (i ∘ φ)"; its *Needs* line gains §2.5.

## Checks

- **Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, run from the content checkout: exit 0, with three warnings "declaration uses `sorry`" at lines 121, 140 and 155. The file is unchanged.
- **Mechanical signature check.** A scratch copy with `#check @name` for all six declarations elaborated with exit 0.
  - `octonionRep` and `griess_conjugacy` keep `{Γ} [Group Γ]`, both semisimplicity hypotheses and the intertwiner.
  - `spin7_not_acceptable_weilGroup` keeps `(K) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]`.
  - `octonionAut`, `sumSquaresSeven` and `spin7_not_acceptable` are closed.
  - Every type agrees with its README statement. Nothing changed.
- **Dependency check** (the command of the brief), full output:

      depcheck: 259 roadmaps, 2478 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line. The edge count went from 2476 (the reviews' run) to 2478. The suppliers of the new contracts are earlier in the merge order than this roadmap (line 316): ModularityAndLanglandsExtensions (line 196) and MetaplecticAutomorphicForms (line 151).
- **Gap slugs.** The README has 27 and `plan.json` has the same 27 (symmetric difference empty, computed). Every "X contract" phrase in the README names one of them.
- **Policy grep of added lines.** No LaTeX delimiters, no process words, no machine paths.
- **Other gates.** No gate failures were listed for this round.

## Adversarial pass on the added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| classical-discrete-packets | St_Sp₆; unitary principal series of Sp₂ from the trivial character; split SO₂; SO₄ with 1 ⊕ χ₁ ⊕ χ₂ ⊕ χ₁χ₂ (distinct quadratic characters) | Sym⁶ irreducible orthogonal, so discrete, and St is square-integrable. 1 ⊕ 1 ⊕ 1 has multiplicity 3, so not discrete; the member is tempered, not square-integrable. SO₂: every character is square-integrable modulo the centre (= G), but χ ⊕ χ⁻¹ is not a sum of orthogonal irreducibles. SO₄ example: centralizer finite in O₄, so discrete | false at SO₂ | n ≥ 1 (Sp), n ≥ 2 (SO) |
| classical-packets-parabolic-induction | I₃(St₃) on Sp₆ (Siegel, G₀ = Sp₀); Borel, trivial character | Sym² ⊕ Sym² ⊕ 1 = v ∘ j ∘ Sym² (dimensions 3 + 3 + 1); 1^⊕7 with one member | holds | none |
| classical-packets-cuspidal-support | St_Sp₆; St_SO₈; φ trivial on SL₂; n = 0 | Support (3, 2, 1): exponents ±3, ±2, ±1, 0, so one odd segment, a = 7, giving Sym⁶. Support (3, 2, 1, 0): 0 occurs twice, so segments a = 7 and a = 1, giving Sym⁶ ⊕ 1 (principal SL₂ of SO₈). Every a_i = 1 gives part (a) only. n = 0: trivial group | holds | none |
| pgsp6-pgso8-global-generic-theta | Σ globally generic with a Steinberg place; f₂ on N | Lift nonzero, consistent with the Rallis route. f₂ : N_SO₈ ≅ N_PGSO₈ (central isogeny), and triality permutes the simple root groups, so ψ ∘ f₂ is nondegenerate | holds | none |
| spin-factor contract: ψ_a rule | unramified σ with trivial Satake class, F = ℚ₅, s = 2, a = 5 | Product of 8 Tate factors, each times |a|^(s−1/2), gives |5|^(8·3/2) = 5⁻¹². GL₈ side: det(s ∘ φ)(5) · 5⁻¹² = 5⁻¹² | holds | none |
| spin-factor contract: FE direction | ζ over ℚ, S = {∞}, s = 2 | γ_∞(2) = (π^(1/2) Γ(−1/2))/(π⁻¹ Γ(1)) = (−2π)/(1/π) = −2π²; γ_∞(2) ζ(−1) = π²/6 = ζ(2). The inverted form would give ζ(−1) = −π⁴/3 ≠ −1/12 | proposal's display inverted | direction fixed here and in §3.11(ii) |
| spin-factor contract: archimedean factor | complex v, φ_v trivial | Spin side: γ(s, 1^⊕8, Ψ_v). SpinLift(Σ)_v has parameter s ∘ 1 = 1^⊕8 (complex-theta contract), with the same factor, so R_v = 1 | holds | none |
| complex-theta contract (trimmed) | φ_σ trivial | ι ∘ 1 = 1, and f₂ pulls back to s ∘ 1 = 1^⊕8, matching §2.2's unramified Check (all eigenvalues 1) | holds | clause on gamma factors moved to the spin contract |
| §0.3 centralizer route | principal φ; diamond φ trivial on SL₂ with S_φ = 1; subregular φ (outside the hypothesis) | Z_G₂ = 1 and Z_Spin₇ = μ₂, quotient 1 (matches the Check). Quotient 1 for the second. Subregular: invariants of 1 ⊕ 1 ⊕ Sym² ⊕ Sym² have dimension 2, so the one-line step fails, and i ∘ φ is not discrete anyway | holds | none |
| §2.0 orbit bullet | g ∈ GSO₈(F) with sim g non-square; F×/F×² of order 4 (p odd) | Ad(g) is not induced by O₈(F); stable characters are invariant under G_ad(F), so the packet is preserved | holds | GO₈(F) |
| §2.3, first statement | Ψ = 1 ⊞ A (§5.3); a single cuspidal summand (§8.2); Ψ with μ ⊠ ν₂ | b_i = 1, 1 resp. 1 (holds); excluded by the hypothesis | holds | Check added |
| §2.3, second statement | Σ with Σ_u ≅ St | Sp₆ side: single cuspidal Π of GL₇. SO₈ side: generic Ψ by the new contract, §5.1 and AL.3 | holds | none |
| §2.4 cancellation | #T = 1, 2; complex v | R_u R_w R_σ = 1 and R_u R_w R_σ² = 1, so R_σ = 1; R_v = 1 at complex v | holds | none |
| §3.7 added route step | St_G₂; π_gen[1] | θ(St) = St_PGSp₆ has parameter Sym⁶ (discrete), so L(St) is principal and discrete. π_gen[1] ∈ Irr♣ has a non-discrete θ, so it is outside the Irr♦ step | holds | none |
| §3.11(ii) FE direction | ζ witness above; route (a) through AL.3.6.2 | Λ(s) = ε Λ(1 − s, ∨) gives L^S(s) = ∏γ · L^S(1 − s, ∨) | now consistent | display inverted to the correct form |
| §3.15 with ι | unramified u ∤ ℓ, Satake diag(a, b, (ab)⁻¹) in SL₃ ⊂ G₂; Steinberg u | Eigenvalues {1, a^(±1), b^(±1), (ab)^(±1)}, stable under inversion; Sym⁶ with N ≠ 0 | holds | ι added; Check added |
| §6.1 added route steps | φ principal; φ trivial on SL₂ with S_φ = 1 | St via tables, parameter Sym⁶ from the support; σ₀ supercuspidal by (a), so σ supercuspidal (Jacquet modules agree on Sp₆) and §8.9 of ExceptionalThetaCorrespondencesForG2 applies | holds | none |
| Klingen Levi | (a, g) ↦ a⁻¹g; Siegel and middle Levis | Kernel {(z, z·1₄)} = centre; surjective, since g ↦ (1, g) is a preimage. Siegel (GL₃ × GL₁)/{(z, z²)} ≅ GL₃ via det(A)λ⁻¹ᵗA⁻¹ (kernel computed). Middle: (GL₂ × GL₂)/Δ has derived group SO₄. Character χ₁ ⊗ 1 ⊗ 1 has ω = χ₁, so ω(−1) = −1 is not a square | holds | Check added |

## Ownership

**Classical-group packet facts.**
- Searched by object with `roadmaps grep` on main and at the open heads: Mœglin's cuspidal support, square-integrability of discrete packets, induction of classical packets. There is no owner.
- ModularityAndLanglandsExtensions, Layer 3, owns Arthur's local packets (§3.15), §3.24 (Mœglin input) and §3.25. It is the supplier of the three new contracts.

**Global genericity of the PGSp₆–PGSO₈ similitude theta lift.**
- No roadmap states it. The only hit is the exceptional G₂ → PGSp₆ lift of ExceptionalThetaCorrespondencesForG2, a different object.
- MetaplecticAutomorphicForms owns the similitude theta correspondence (§3.34) and the global theta theory (§§6.13–6.14), so it is the supplier.

**Pull requests and declarations.**
- Ownership against open pull requests was checked through the `roadmaps` tools at their heads.
- No `Suggested.lean` declaration was added or renamed.

## For the maintainer

- **ModularityAndLanglandsExtensions** gains three supplier contracts at Layer 3, §3.15: classical-discrete-packets, classical-packets-parabolic-induction and classical-packets-cuspidal-support. The third is Mœglin's theorem, outside Arthur's book.
- **MetaplecticAutomorphicForms** gains one: pgsp6-pgso8-global-generic-theta.
- **Two existing contracts change their text (slugs unchanged):**
  - pgsp6-shahidi-spin-factor on AutomorphicLFunctionsAndLocalFactorsPartII: ψ_a rule, explicit functional equation, archimedean factors.
  - pgsp6-pgso8-complex-theta on MetaplecticAutomorphicForms: parameters only.
- **§3.11(ii)** changed the direction of its displayed functional equation. A Notes-on-the-sources entry explains this departure from GS p. 18 and GF p. 5.
- No id, section number or Lean name that other roadmaps cite was changed or removed.
- The review texts contain no instructions addressed to this job; nothing suspicious was found.
