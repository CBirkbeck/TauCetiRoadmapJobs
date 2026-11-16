# Repair report: red-team round 1 of LocalLanglandsCorrespondenceForG2

Files changed: `packages/LocalLanglandsCorrespondenceForG2/README.md`, `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean`, `packages/LocalLanglandsCorrespondenceForG2/design/plan.json` (top-level `gaps` only). `sources.toml` and `metadata.toml` unchanged (every new locator is in GS or CG, already recorded).

## RT-LocalLanglandsCorrespondenceForG2~1a/F01, RT-LocalLanglandsCorrespondenceForG2~1b/F01 (P2) — applied

Docstring "local form … needs the `Spin₇`-valued parameters that the pins lack" → new headline `spin7_not_acceptable_weilGroup` on `TauCeti.ClassFieldTheory.WeilGroup K` with its Weil topology (open-kernel finite-image `r`, open-kernel central `η` of square one, elementwise conjugacy, no global conjugator), import `TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology`. README §0.8 names it; Tau Ceti contract, §0.8 *Needs*, Layer 0 Dependencies, one encoding Check added. Review a's form (open kernel on `η`) chosen over b's.

## RT-LocalLanglandsCorrespondenceForG2~1a/F02, RT-LocalLanglandsCorrespondenceForG2~1b/F03 (P2) — applied differently

gap:pgsp6-similitude-theta-tables → four contracts: pgsp6-similitude-twist-rule (§§2.5, 10.3, 10.4), pgsp6-steinberg-pgo6-vanishing (§§2.3, 8.1), pgsp6-lower-tower-parameters (§§9.1, 9.2, 10.4, 10.7), pgsp6-pgso8-induction-principle (§§5.5, 9.3). gap:cubic-jordan-global-theta → itself (§3.11(ii)(b)) plus cubic-period-global-theta (§3.11 uniqueness). Every citation, *Needs* and Dependencies line repointed; `plan.json` 19 → 23 gaps.

Differences from the two proposals: the old slug is dropped, not kept for the Levi part (review a), because "the parameters of the lift of every induced representation" names no parameter (review b's witness); the Levi part becomes an explicit induction principle. Review b's clause "members of one Xu packet have the same φ_τ" is not put in a contract: it is §10.7's own target and stays here. The triality pullback of χ ∘ sim leaves the contract (it is §2.1). The lower-tower contract gains the PGSO₈ lift of σ ∈ Irr♣ (Kudla persistence with exponent zero), which §9.1's agreement on Irr♣ needs and neither proposal stated. MetaplecticAutomorphicForms at its head (§§3.34, 3.41, 3.42) states none of the four, so all stay supplier gaps.

## RT-LocalLanglandsCorrespondenceForG2~1a/F03, RT-LocalLanglandsCorrespondenceForG2~1b/F05 (P3) — applied

(2, = a/F03) "SRU.5, §5.3" / "SRU.5 (§5.3)" → "SRU.5.4 (*unramified-principal-series-irreducibility*)" and "SRU.5.5 (*spherical-generic-criterion*)" at all eight places (Scope, supplier contract, §2.4 twice, Layer 2, §8.1 twice, Layer 8). (1) §3.11 "(§§5.9, 6.7)" → "(§§5.9, 8.3)", 8.3 added to *Needs*. (3) §10.9 "§12.8, p. 40" → "pp. 39–40". (4) §0.0 *Needs* "Layer 0 (the inclusion G₂ ⊂ SO₇)" → §0.1 (norm, imaginary part, v in SO₇) and §0.6.

## RT-LocalLanglandsCorrespondenceForG2~1a/F04 (P3) — applied

§3.14 "a map satisfying §§3.5–3.7 and the two diagrams of §3.2 equals L" → "a map satisfying the two diagrams of §3.2 equals L; in particular so does one also satisfying §§3.5–3.7 (GS Main Theorem (v))"; Route spelled out per diagram. New Check: St_G₂ ∈ Irr♥, v-image Sym⁶, §0.4 gives the principal parameter without §3.7.

## RT-LocalLanglandsCorrespondenceForG2~1b/F02 (P2) — applied differently

Instead of a Conventions bullet containing "Prove …", a new target §2.0 *Parameters of all irreducible representations of Sp₆ and split SO₈* (Langlands-classification extension of ModularityAndLanglandsExtensions §3.15, four API bullets, four Checks, *Needs*), plus a Conventions line defining "Arthur parameter" as §2.0's. §2.0 added to the *Needs* of §§2.2, 3.1, 3.2, 3.4, 3.9, 5.2, 8.2, 9.1–9.4; Scope, How to read and Layer 2 Dependencies updated.

## RT-LocalLanglandsCorrespondenceForG2~1b/F04 (P2) — applied

§3.1 and §8.2 Routes now pass from the localization to the component's parameter: packet of the localization (§3.17), genericity by the §5.1 image statement and AL.3, tempered L-packet if bounded (§3.15), irreducible standard modules if unbounded (§3.25). §8.2 does this on both the Sp₆ and the SO₈ side. The same gap was in §5.2 and is repaired there too. *Needs* and Layer 8 Dependencies extended.

## RT-LocalLanglandsCorrespondenceForG2~1b/F06 (P3) — applied

"the faithful unitary representation of Spin₇(ℂ)" → "the faithful representation of Spin₇(ℂ) by left multiplication on the complex Clifford algebra with its Hermitian inner product and adjoint g†, in which the unitary elements form Spin(7)". This matches SpinRepresentations (main, README line 564). No other occurrence.

## RT-LocalLanglandsCorrespondenceForG2~1b/F07 (P3) — applied

§1.1 "eight-dimensional unital K-algebra" → "… that is not assumed associative (a unital ring with K-bilinear multiplication, as the `NonAssocRing` … of `TauCeti.Octonion K`)". New Check: (uu′)w = ⟨0,0,−e₂,0⟩ while u(u′w) = 0, recomputed on the pinned Zorn product; the associative reading admits no object.

## RT-LocalLanglandsCorrespondenceForG2~1b/F08 (P3) — applied

Three Checks on `sumSquaresSeven` added to §0.8: values 1 at e₁ and 7 at (1,…,1) (0 at e₇ for weights (1,…,1,0)); isotropic at e₁ + i e₂, so the group is complex Spin₇(ℂ), not compact Spin(7); polar form 2δ_ij is nondegenerate, against the radical e₇ of the degenerate weights.

## Checks

- **Elaboration.** `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean` (from the content checkout): exit 0. Three `declaration uses 'sorry'` warnings (`griess_conjugacy`, `spin7_not_acceptable`, `spin7_not_acceptable_weilGroup`), no errors. The imported `TauCeti.NumberTheory.ClassFieldTheory.WeilGroup.Topology` object file was already present at the pin.
- **Signatures.** I put `#check @name` for all six declarations in one scratch copy and elaborated it once. The five old types are unchanged from the elaborated signatures the worker supplied. The new one is `∀ (K : Type u_1) [Field K] [ValuativeRel K] [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K], ∃ r η, IsOpen ↑r.ker ∧ Finite ↥r.range ∧ IsOpen ↑η.ker ∧ (∀ w, η w ∈ Subgroup.center ↥(spinGroup sumSquaresSeven) ∧ η w * η w = 1) ∧ (∀ w, IsConj (r w) (η w * r w)) ∧ ¬∃ g, ∀ w, η w * r w = g * r w * g⁻¹`. Every binder is present, `IsOpen` uses the Weil topology instance, and the generality is README §0.8's: F nonarchimedean of characteristic zero, as in CG §8 (CG line 1189: finite extensions of ℚ_p).
- **Dependency check** (`gate --depcheck … --movable`), full output:

      depcheck: 257 roadmaps, 2445 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere.
- **Gaps:** 23 slugs in the README (`gap:` lines under "Exact supplier contracts"), the same 23 in `design/plan.json`. Each new slug is on MetaplecticAutomorphicForms or ExceptionalThetaCorrespondencesForG2, both earlier in the merge order.
- **Text:** no process words or LaTeX delimiters in the added lines (grep).

## Adversarial pass on the added or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `spin7_not_acceptable_weilGroup` | r, η trivial; r trivial, η = sgn_(E/F); unramified r into Spin₂ of infinite order; F = ℚ₅ pullback; F = ℚ₃ | trivial pair meets every clause but the last (g = 1); IsConj(1, −1) false; kernel I_F open, image ℤ infinite; ℚ₅×/ℚ₅×⁴ ≅ (ℤ/4)², 16 elements; ℚ₃×/ℚ₃×⁴ has order 8 | true (CG Prop. 8.3; Lemma 8.1 gives continuity of η); each clause discriminating | added, plus §0.8 Check |
| §0.8 compact-form remark | finite subgroup of Spin₇(ℂ) | compact, so conjugate into the maximal compact Spin(7) | holds | none |
| `sumSquaresSeven` Checks | e₁; (1,…,1); e₁ + i e₂; polar(e_i, e_j); weights (1,…,1,0) | 1; 7; 1 + i² = 0; 2δ_ij; e₇ ↦ 0, radical | hold | Checks added |
| §1.1 definition and Check | u = ⟨0,0,e₁,0⟩, u′ = ⟨0,0,e₂,0⟩, w = ⟨0,0,0,e₁⟩ on the pinned product | uu′ = ⟨0,0,0,e₃⟩; (uu′)w = ⟨0,0,−(e₃×e₁),0⟩ = ⟨0,0,−e₂,0⟩; u′w: scalar e₂·e₁ = 0, vectors 0, so u(u′w) = 0 | non-associative, so the definition must not ask for associativity | applied |
| §2.0 definition | trivial rep of Sp₆; St_Sp₆; trivial rep of split SO₈; dual summands dropped; tempered σ | ρ = (3,2,1): \|·\|^(±3,±2,±1) ⊕ 1, Frobenius eigenvalues q^(−3..3), N = 0 (= §3.2 Check); Sym⁶, same semisimple part, N ≠ 0; ρ = (3,2,1,0): dimension 6 + 2 = 8; dimension 3 + 1 = 4 ≠ 7; P = G gives §3.15 | well defined; separates St from 1; agrees with §3.2 | new target |
| §2.0 orbit bullet | GSp₆ element diag(1,1,1,λ,λ,λ) on the Siegel Levi | acts trivially on GL₃ and by similitude on the Sp₀ factor | GL data fixed | none |
| §3.1 Route | ψ_v₀ bounded or unbounded | bounded: tempered packet; unbounded: §3.25 needs a generic member, supplied by σ′ from the §5.1 image (A cuspidal, orthogonal, trivial central character) | closes the gap | applied |
| §5.2 Route | σ discrete series, ψ_v₀ unbounded | members would be standard modules from proper parabolics, non-tempered, so not discrete series | ψ_v₀ bounded | applied (pattern) |
| §8.2 Route | Sp₆ side and SO₈ side | GL₇: single cuspidal by the Steinberg place; GL₈: single cuspidal by irreducibility; both orthogonal with trivial central character, so §5.1 image applies | both parameters are the localizations | applied |
| §3.14 | L′ = L on Irr♥, dual on Irr♠; π = St_G₂ | j(φ_τ∨) conjugate to j(φ_τ) (§0.2); v ∘ L′(St) = Sym⁶, so L′(St) is principal (§0.4) | diagrams suffice | applied |
| pgsp6-similitude-twist-rule | ω on R = {sim g = sim h}; PGSO₆ ≅ PGL₄; PGSO₅,₁ ≅ PGL₂(D) | χ(sim g)χ(sim h) = χ(sim g)² = 1 for quadratic χ; sim(g, a) = det g · a² ≡ det g mod squares; similitude ≡ Nrd | holds | contract |
| pgsp6-steinberg-pgo6-vanishing | σ = St | Sym⁶ has SL₂-invariants of dimension 0; a PGO₆ lift has standard parameter 1 ⊕ Λ²φ_τ with at least a one-dimensional invariant line (GS line 1577) | consistent with §8.1 Check | contract |
| pgsp6-lower-tower-parameters (b) | φ_τ = Sym³; σ ∈ Irr♣ | SO₈ parameter 1 ⊕ 1 ⊕ Λ²φ_τ = 1 ⊕ 1 ⊕ 1 ⊕ Sym⁴; half-spin φ_τ ⊕ φ_τ∨ = Sym³ ⊕ Sym³ (dimension 8) = §9.1 value; Adams index l = 8 − 6 − 1 = 1 gives exponent 0 | agrees with §§9.1–9.2 Checks and Examples | contract |
| pgsp6-pgso8-induction-principle | Siegel Levi n₀ = 0; Klingen n₀ = 2 with τ₀ quaternionic | n₀ = 0: θ(τ₀) = τ₀ ∘ sim on GSO₂, giving φ_τ ⊕ φ_τ∨ ⊕ 1 ⊕ 1 for §5.5; τ₀ with first quaternionic occurrence at dimension 4 forces σ into Irr♠ by conservation (dimensions 4 + 8 = 12 for GSp₄, 6 + 10 = 16 for Sp₆), so σ ∈ Irr♥ excludes it | consistent | contract |
| cubic-jordan / cubic-period split | §3.11(ii)(b) against the uniqueness case | (ii)(b) uses only local components; the uniqueness case uses nonvanishing, cuspidality and the lift back for division D | each consumer cites one | split |

## Ownership

§2.0 is owned here: `roadmaps grep` finds no roadmap on main or at an open head that extends Arthur's tempered correspondence to all irreducible representations. ModularityAndLanglandsExtensions §3.15(c) covers tempered packets only, and SmoothRepresentationsOfLocalGroups SR.3.3 gives the Langlands classification without parameters.

The four PGSp₆ theta contracts stay on MetaplecticAutomorphicForms: its §§3.34, 3.41, 3.42 at its head state none of them, and no other roadmap states a theta induction or persistence principle (`roadmaps grep`; the MetaplecticAutomorphicFormsPartII checkout has no PGSp₆ or PGSO₈ material). No declaration of `Suggested.lean` takes the name of another roadmap's declaration. Ownership against open pull requests was checked through the `roadmaps` tools and the listed sibling checkouts.

## For the maintainer

- **Slugs.** gap:pgsp6-similitude-theta-tables no longer exists. Its replacements are gap:pgsp6-similitude-twist-rule, gap:pgsp6-steinberg-pgo6-vanishing, gap:pgsp6-lower-tower-parameters and gap:pgsp6-pgso8-induction-principle, and there is a new gap:cubic-period-global-theta. No other roadmap cites any of these slugs (`roadmaps grep`), so nothing outside this package breaks. MetaplecticAutomorphicForms and ExceptionalThetaCorrespondencesForG2 now receive these finer requests.
- **New section.** The README gains §2.0. No existing section is renumbered.
- **Untrusted text.** The two reviews contained no instruction outside their findings; nothing suspicious to quote.
