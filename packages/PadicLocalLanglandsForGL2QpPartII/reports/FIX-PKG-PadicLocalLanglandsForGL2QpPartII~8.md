# FIX-PKG-PadicLocalLanglandsForGL2QpPartII~8

I checked all seven findings of REV-PKG-PadicLocalLanglandsForGL2QpPartII~7 against the cached sources, the supplier heads and the README. All seven are correct. Only `packages/PadicLocalLanglandsForGL2QpPartII/README.md` changed. `Suggested.lean`, `sources.toml`, `metadata.toml` and the `gaps` list of `design/plan.json` are unchanged, since no new supplier gap was needed. I did not act on the review's "For the human reviewers" section.

## F01 (P2) — applied

§6.3 route: source-ordered sketch (traces; "else almost all fibres reducible"; Smith normal form) → four own steps: saturation of H = Hom_(A[G])(V,W); generic absolute irreducibility from one fibre and commutant F; traces; det φ a unit. E-variant restated likewise. New E23. Third Check corrected: one irreducible fibre already forces generic irreducibility.

## F02 (P2) — applied differently

The §7.5 contract states the supplier's integral form; Scope line 35 reworded; §4.9 points to the infinite-level use. §6.4 reaches H¹_ét[M] ⊂ X⁺_st(M)⊗̂(LL(M)^∧)* via §0.2, §4.9 and that form; *Needs* → §§0.2, 4.9, 5.5, 5.6, Proetale §7.5, base §2.5. Not done: §7.5 in §4.9's *Needs*, since its route uses only §§7.1–7.3.

## F03 (P3) — applied

New base contract bullets for §1.7 and §§4.1–4.2. Layer 6 *Dependencies* → "Layers 0 and 4–5; base §§2.5, 3.3, 3.5, 3.6, 3.8, 5.1–5.6, 5.8, 5.12; Proetale §7.5; …". Line 37 → "LocallyAnalyticDistributions §§0.0, 0.2 and 0.3". The §§4.1–4.2 bullet also states the base's supercuspidal hypothesis, and that hypothesis is now cited where it is used (see "Pattern repairs" below).

## F04 (P3) — applied

The §7.2 sentence "first map … (u⁺)ᵏ⁺¹ (Remarque 0.11(i))" now ends "…, with source correction E22". New E22 (misprint, COLMEZ19POIDS lines 321 and 333): the printed k-th derivative should be the (k+1)-st, acting as (u⁺)^(k+1), as in DLB17 line 2722. At k = 0 the printed operator is the non-equivariant identity from weight 0 to weight 2.

## F05 (P3) — applied

First Check of §6.3: "χ a nontrivial unramified character congruent to 1" → "χ unramified with χ(p) = 1+p". The reductions are isomorphic, but the determinants differ by χ², with (1+p)² ≠ 1. Added: the p = 2 counterexample to the old wording, where the unramified quadratic χ₀ gives ρ⊗χ₀ ≅ ρ for every ρ induced from G_(ℚ_4).

## F06 (P3) — applied

§4.14: "Π(V) := Hom(V, H¹_ét)′" → "the strong dual Π_n(V) of Hom_(W_ℚ_p)(V, H¹_ét(M^p_(n,C), L(1)))". Also fixed: "contains an absolutely irreducible Π" → "has an absolutely irreducible quotient Π". Its transpose embeds Π* in the Hom space, giving V ↪ Hom_G(Π*, H¹_ét) against §4.13; a subrepresentation gives no such map. New E24 (CDN23 lines 2549–2551).

## F07 (P3) — applied

§6.1: "compare with Π^univ … relates to Π(ρ_x)* by … the duality of §0.2" → a stated comparison. For absolutely irreducible ρ̄_B, the base §5.8 family for ρ̄_B⊗ε̄⁻¹ has fibre Π(ρ_y(ε)) = Π(ρ_x) at the κ(x)-point y with ρ_y = ρ_x⊗ε⁻¹, and κ(x)⊗Π*(ρ_(B,M)) is its Banach dual. Added Check: the untwisted family's central character is off by ε².

## Pattern repairs and other places

- **F01.** The false claim of the third §6.3 Check ("with finitely many closed points this step fails") was the same misstep as the source's route. It is corrected. §6.5's appeal to §6.3 for E_(B,M)×G_ℚ_p is still valid and was left as is: the new E-variant needs only absolutely irreducible, isomorphic closed fibres.
- **F02.** In §6.4, LL(M)⁺ is now required to be finitely generated over O_L[G]. The third bullet already used this ("hence finitely generated"), as does the base §2.5 identification (LL(M)^∧)* = Y^d[1/p]. CDN23 line 2822 uses it as well.
- **F03, the supercuspidal hypothesis.** Writing the §§4.1–4.2 contract exactly shows that the base states §4.2(v) for irreducible WD(V) only under its "supercuspidal comparison input". The base's Scope assigns that input to CompletedCohomologyAndLocalGlobalCompatibility §6.3, read at its head ("Locally algebraic vectors of B(V) by a global argument"). §§2.4, 4.12 and 7.2 use base §4.2 for supercuspidal M, and §2.4 explicitly identifies Colmez's LL_p(M) with LL(M) (COLMEZ19POIDS line 240–243 says this needs global arguments). So I added CompletedCohomology §6.3:
  - to the CompletedCohomology contract list and to the Scope paragraph;
  - to the *Needs* lines of §§2.4, 4.12 and 7.2;
  - to the *Dependencies* of Layers 2, 4 and 7.
- **F03, other dependency lines.** I compared every layer's *Dependencies* with the union of its *Needs* lines:
  - Layer 2: + Layer 0 (§2.4 needs §0.3).
  - Layer 4: + LocallyAnalyticDistributions §0.2 and PadicHodgeTheory §4.4 (both needed by §4.5).
  - Layer 5: "Layers 0 and 4" → "Layer 0" (no Layer 5 target cites Layer 4).
  - Layer 7: + Layer 0 (§§7.3, 7.6, 7.7); − ProetaleCohomologyOfPAdicCurvesAndTowers §6.2 (no Layer 7 *Needs* line cites it).
  - Scope line 22: base "§§5.1–5.8 and 5.12" → "§§5.1–5.6, 5.8 and 5.12" (no target uses §5.7).

## Checks run

- `lake env lean packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, docstring only, no declarations. With no declarations, the `#check @name` scratch file has nothing to elaborate; there was nothing to compare and nothing changed.
- Dependency check (`gate --depcheck … --movable`), full output:
  `depcheck: 244 roadmaps, 2250 edges, 0 problem(s)` (exit 0; no UPWARD, CYCLE or `moved:` line).
- `roadmaps resolve` on the README: no cross-roadmap citation found nowhere, no Lean name found nowhere.
- `roadmaps overlaps PadicLocalLanglandsForGL2QpPartII`: "no roadmap … on main or in an open roadmap pull request". This is a board package. The worker's `overlaps.md` lists no pull request changing it and no dropped id.
- No gate failures were listed for this round.

## Citations resolved this round

Each was checked at its current head:

- ProetaleCohomologyOfPAdicCurvesAndTowers (head #2287), §§7.1–7.5. §7.5 contains "Prove its integral form: passing to G-bounded vectors gives an injection H¹_ét(M_∞, L(1))[M] → X^+_st(M)⊗̂L̂L(M)^*".
- PadicLocalLanglandsForGL2Qp (head #1312), §§1.7, 2.5, 4.1, 4.2 (with (v) and the Scope paragraph assigning the supercuspidal input) and 5.8 (universal family: fibre Π(ρ_x(ε)), central character det(ρ_x)ε).
- CompletedCohomologyAndLocalGlobalCompatibility (head #1270), §6.3.

No new roadmap edge is upward: CompletedCohomologyAndLocalGlobalCompatibility was already a supplier and comes earlier in the merge order. Ownership was checked against the open heads and main through the roadmap tools. Nothing new is owned here.

## Sources

Nothing was fetched and the manifest is unchanged. I read these cached texts at the cited lines:

- CDN23 lines 2560–2600 (Lemme 5.12 and its proof), 2536–2552 (Théorème 5.10 and its proof) and 2779–2840 (Théorème 5.24(i));
- COLMEZ19POIDS lines 228–252 and 305–342;
- DLB17 lines 2714–2730.

No text is missing, so no `needs-references.toml` was written.

## Adversarial pass (changed or added statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.3 saturation step | A = L[T], H′ = T·A·id ⊂ End_A(V) (not saturated) | H′/𝔪H′ → End(V_x) is 0 at T = 0; the saturated A·id maps to id ≠ 0 at every point | injectivity needs saturation; holds for H |
| §6.3 generic absolute irreducibility | DVR O, V = O² with a stable line e₁ in V_F | U ∩ V = Oe₁, saturated, reduces to the stable line k·ē₁ | one irreducible fibre forces V_F irreducible; old third Check false, corrected |
| §6.3 commutant ⇒ absolutely irreducible | finite-dimensional V_F, image B of F[G] simple with End_B = F | B = End_F(V_F), so V_F̄ is irreducible | holds in every characteristic |
| §6.3 trace step | A = L[T], ratio of two A^×-valued characters ≡ 1 mod every 𝔪 | ratio − 1 ∈ ∩𝔪 = 0 | holds |
| §6.3 trace step in characteristic p | 1 and 1^(⊕(p+1)) over 𝔽_p: traces 1 and p+1 = 1 | equal traces, not isomorphic | absolute irreducibility (not semisimplicity) is what the step uses |
| §6.3 first Check | p = 2, χ(2) = 3; p = 3, χ(3) = 4 | χ² values 9 and 16, ≠ 1; 3 ≡ 1 mod 2, 4 ≡ 1 mod 3 | determinants differ, reductions agree |
| §6.3 p = 2 counterexample | χ₀(2) = −1; θ̄ = ω₂ of order 3 on inertia of ℚ_4 | ω₂^σ = ω₂² ≠ ω₂, so Ind θ̄ is absolutely irreducible; Ind θ⊗χ₀ = Ind(θ·χ₀\|) = Ind θ | old wording fails at p = 2 |
| §6.3 E-variant | E = A; E = (A-algebra, noncommutative) | E = A gives the main case; the route uses only A-linearity of Hom and traces of e∘g | holds |
| §6.1 comparison | central characters of Π(ρ_x(ε)) and Π(ρ_x); a = 1+p | det(ρ_x)ε vs det(ρ_x)ε⁻¹; ratio ε²(a) = (1+p)² ≠ 1 | twist by ε̄⁻¹ needed; Check added |
| §6.1 residual | ρ̄_B absolutely irreducible ⇔ ρ̄_B⊗ε̄⁻¹ absolutely irreducible | twisting by a character preserves absolute irreducibility | holds |
| §4.14 dim ≥ 3 route | non-split 0 → Π₁ → Π_n(V) → Π₂ → 0 | sub Π₁: only Π_n(V)* ↠ Π₁*, no map Π₁* → Hom; quotient Π₂: Π₂* ↪ Π_n(V)* | quotient needed (E24) |
| §4.14 contradiction | dim V = 3 | §4.13 answers: V_(M,ℒ)⊗JL(M) (constituents of dimension 2), δ⊗δ_Ǧ (dimension 1), 0 | no embedding of V |
| §6.4 bullet 1 | n = 0; M with χ(p) = 1+p | no supercuspidal M at level 0 (vacuous); M ∉ ΦNᵖ is outside the statement and H¹_ét[M] = 0 on M^p_n | holds |
| §6.4 lattice | c-Ind_J^G λ⁺ | generated by the finite O_L-module λ⁺, so finitely generated | the lattice exists |
| Contract §1.7 | twist rule | LL(M⊗η_geo) = LL(M)⊗(η∘det) (base §1.7 Check) | agrees |
| Contract §§4.1–4.2 | weights (0,1); weights (0,3) | Alg trivial and Π^alg = LL(V); dim Alg = b − a = 3 | agrees |
| CompletedCohomology §6.3 bullet | WD = Ind from ℚ_(p²) of θ with θ\|units not a norm-composite | irreducible WD, not crystabelline; if θ\|units = ψ∘N then Ind θ = ψ⊗(μ⊕μ′) is reducible | "irreducible WD ⇔ potentially crystalline, not crystabelline" holds |
| E22 | k = 0; k = 1 | identity O(0) → O(2) is not equivariant (factor (cz+d)⁻²); d/dz gives det¹·(f′\|₂g); (d/dz)² from O(−1) to O(3)⊗det² | misprint confirmed |
| Layer *Dependencies* | union of *Needs* per layer | L2 adds §0.3; L4 adds LocallyAnalyticDistributions §0.2 and PadicHodgeTheory §4.4; L5 drops Layer 4; L6 exact; L7 adds Layer 0 and drops Proetale §6.2 | agree |

## For the maintainer

- **Conditional supercuspidal input.** The roadmap's supercuspidal uses of base §4.2(v) now name CompletedCohomologyAndLocalGlobalCompatibility §6.3, the owner the base itself assigns. Base §6.9 also inherits that input, since its parametrisation of V(π) by ℙ(M_dR(π)) passes through Π^lisse ≅ π. This roadmap uses base §6.9 in §0.4, Layers 1–2 and §3.3, and those uses take it as the base states it. Whether base §6.9 should cite CompletedCohomology §6.3 itself is a question for the base roadmap, not this package.
- **No renamed ids.** No section, layer or target id changed, and there are no Lean names, so no other roadmap's citation is affected. The new source corrections are E22–E24.
- **No suspicious instructions** were found in any text read.
