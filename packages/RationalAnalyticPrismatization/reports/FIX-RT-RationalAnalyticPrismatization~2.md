# FIX-RT-RationalAnalyticPrismatization~2

This round repairs the findings of the red-team reviews `RT-RationalAnalyticPrismatization~2a` (five findings) and `RT-RationalAnalyticPrismatization~2b` (four findings). Two pairs overlap and are settled once each: 2a/F01 with 2b/F01, and 2a/F04 with 2b/F02.

Files changed:

- `packages/RationalAnalyticPrismatization/README.md`
- `packages/RationalAnalyticPrismatization/sources.toml`: the ABLB entry gains the locators Definition 4.1.5 and Example 4.1.13, and "6.1" in `cited_for`. No source was added and none was fetched.

Files unchanged: `Suggested.lean`, `metadata.toml` and `design/plan.json`. No new gap was needed, because the new supplier section is on main.

No section, layer or target was renumbered or removed. No Lean name was added or removed.

## RT-RationalAnalyticPrismatization~2a/F01, RT-RationalAnalyticPrismatization~2b/F01 (P2) — applied

**6.1 (README:1095):** `D_{FF,S}` = ⋃_s `GSpec(B^†_{[0,s]})` → `D^×_{FF,S}` = Spa(A_inf) ∖ V(p[ϖ]) = ⋃ `GSpec(B^†_{[r,s]})`, [r, s] ⊂ (0, ∞), with the reason p is a unit. κ now lands in (0, ∞). Deleted: `κ^{-1}(0)` and `D^⋄_{FF,S}`. Checks rewritten, plus a C♭ negative Check.

**Elsewhere:** Conventions:25; Layer 6 introduction; 7.4 Check (README:1264).

## RT-RationalAnalyticPrismatization~2a/F02 (P3) — applied

**10.2 (README:1670):** a new sentence says NoncommutativeAndEquivariantIwasawa §0.11 is the algebraic Lazard–Serre resolution and explains why it is a solid resolution. Inverting p gives the perfectness hypothesis.

**Also added:** §0.11 in the routes and *Needs:* lines of 10.2, 10.4 and 10.8; Scope:9; the supplier contract and its "Sections consumed"; the Layer 10 Dependencies.

## RT-RationalAnalyticPrismatization~2a/F03 (P2) — applied

**4.8 (README:970):** "if for some arc-cover X′ → X by a perfectoid space the base change Y ×_X X′ admits a quasi-pro-étale surjection from a perfectoid space" → "if there are perfectoid spaces X′ and Z, an arc-cover X′ → X and a surjective quasi-pro-étale map Z → Y ×_X X′ (ALRS Lemma A.3.4, …)".

## RT-RationalAnalyticPrismatization~2a/F04, RT-RationalAnalyticPrismatization~2b/F02 (P3) — applied

**2.8 (README:664)** now defines:
- `ArcStk_{𝔽_p}`;
- Marc(A) for separable Banach rings, with Marc(𝔽_p) final and Marc(ℚ_p) ⊂ Marc(ℤ_p);
- the slices `ArcStk_{ℤ_p}` and `ArcStk_{ℚ_p}`, and their qfd variants;
- what unsubscripted ArcStk means.

**Also:** the Marc law is widened (README:675), a Check is added (README:680), and 6.3 and 7.4 refer to these definitions.

## RT-RationalAnalyticPrismatization~2a/F05 (P3) — applied

**4.3 Check (README:880):** "a disc of radius 1/2 into a disc of radius 1" → "the †-rational disc {|T| ≤ p^{-1}} into the closed unit disc".

**Also added:** the reason it is not Zariski closed, and a note that ALRS's radius 1/2 is rational only for p = 2.

## RT-RationalAnalyticPrismatization~2b/F03 (P3) — applied

The eleven missing supplier sections are added to the Dependencies of Layers 1–7 and 9.

**Same pattern:** internal layer ranges now cover every layer that *Needs:* lines cite:
- Layer 3: "Layers 1 and 2"
- Layer 6: "Layers 1–5"
- Layer 7: "Layers 1–6"
- Layer 9: "Layers 2–8"
- Layer 12: "Layers 2–11"

## RT-RationalAnalyticPrismatization~2b/F04 (P3) — applied

**0.1 (README:213):** "formed in 1Pr, that is, in κ-presentable ∞-categories and colimit-preserving functors" → "formed in 1Pr = Pr^L_κ, whose morphisms are the colimit-preserving functors that preserve κ-compact objects". This was the only such gloss in the README.

## Evidence for the findings

Every witness was checked and every finding holds.

- **F01 (both reviews).** In Spa(A_inf(C♭)), the point p = 0 satisfies |p|^s = 0 ≤ |[ϖ]|. So the ring of {|p|^s ≤ |[ϖ]| ≠ 0} maps onto C♭ by p ↦ 0, and p is not a unit in it. Gelfand rings are ℚ_p-algebras (README:407). ABLB itself uses only intervals in (0, ∞): ABLB line 2607–2610 and ABLB Corollary 4.4.10(1), ABLB line 2641.
- **2a/F02.** NoncommutativeAndEquivariantIwasawa §0.11, step 6 (on main), gives the length-d resolution of ℤ_p by finitely generated free Λ(U)-modules. The solid reading: `ℤ_{p,■}[U]` = lim ℤ_p[U/U_n], and a complex of compact Hausdorff groups that is exact on underlying groups is exact as condensed groups.
- **2a/F03.** README:969 shared a 16-word run with ALRS line 10105–10106. A run script finds none in the new wording.
- **F04 (both reviews).** 2.8 defined only `ArcStk_{ℚ_p}`, while ABLB line 2067 is the ℤ_p variant. The new sources are ABLB Definition 4.1.5 (ABLB line 1976), ABLB Example 4.1.13 (ABLB line 2086–2095) and ABLB line 4981.
- **2a/F05.** Radii of rational discs over ℚ_p lie in p^ℚ, and 1/2 ∈ p^ℚ only for p = 2. ALRS Example 2.7.2 (ALRS line 1370–1374) argues for any †-rational subspace.
- **2b/F03.** A script comparing each layer's *Needs:* lines with its Dependencies paragraph reproduced exactly the eleven misses. After the edit it finds none, external or internal.
- **2b/F04.** Gest Definition 2.7 (Gest line 563–565) requires the morphisms of Pr^L_κ to preserve κ-compact objects.

## Checks run

**Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout, exited with code 0 and printed no messages. The file is unchanged. It has no declaration, so the `#check @name` comparison had no input; this was confirmed rather than run.

**Dependency check.** Output:

    depcheck: 259 roadmaps, 2486 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The new edges (NoncommutativeAndEquivariantIwasawa §0.11, and the Dependencies additions) all point to roadmaps on main or to suppliers this roadmap already names.

**Citations.** `roadmaps resolve` reports one lead only: MotivesAndAlgebraicCyclesPartII Layer 0, a board package, settled in round 1. It finds no Lean name missing.

**Wording.** All added text was compared with ALRS, ABLB, Gest and RJRC22 for runs of nine or more shared words. One 9-word technical run ("hypersheaves of anima on the arc-site of separable") was reworded. The remaining hits are in unchanged text that was printed only because its line was edited.

**Ownership.** `roadmaps grep` for arc-stacks, ArcStk and Marc( finds no other owner on main or at the open heads. The Bhatt–Mathew arc-topology of ArcTopologyAndDescent and PrismaticCohomology is on schemes, a different object. Marc(A) and the Banach arc-site stay with MotivesAndAlgebraicCyclesPartII Layer 0, which 2.8 already compares with. NoncommutativeAndEquivariantIwasawa §0.11 was read on main.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 6.1 interval ring `B_{[r,s]}` | S = Spa(C♭); r = 0 vs r > 0 | r = 0: maps onto C♭ by p ↦ 0, so p is no unit. r > 0: \|[ϖ]\| ≤ \|p\|^r with [ϖ] ≠ 0 gives \|p\| ≠ 0, so p is a unit | defined with r > 0; negative Check added |
| 6.1 radius window | κ ∈ [r, s] ⇔ \|p\|^s ≤ \|[ϖ]\| ≤ \|p\|^r | log\|[ϖ]\| ≥ s·log\|p\| ⇔ κ ≤ s (log\|p\| < 0); likewise κ ≥ r | agrees with ABLB line 2610 |
| 6.1 normalization | untilt C, ϖ = p♭; Frobenius | \|[p♭]\| = \|p\|, so κ = 1; φ^*[ϖ] = [ϖ]^p, so κ∘φ = p·κ | ok |
| 6.1 reciprocal-convention Check | κ′ = 1/κ | κ′∘φ = p⁻¹κ′; κ′ → 0 as [ϖ] → 0 | discriminates |
| 6.1 S = ∅ | empty S | union of GSpec(0) is empty | ok |
| Conventions radius | as 6.1 | values in (0, ∞); untilt at 1, translates at p^n | ok |
| 7.4 Check | K = 𝔽_p((π^{1/p^∞})), ϖ = π | (κ₁, κ₂) surjects onto (0, ∞)², since M(A ⊗̂ B) ↠ M(A) × M(B) (ABLB line 2038); diagonal has κ₁ = κ₂ | ok |
| 2.8 Marc and slices | Marc(𝔽_p), Marc(ℤ_p), Marc(ℚ_p) | final object; all untilts; p a unit; Marc(𝔽_p) ×_{Marc(ℤ_p)} Marc(ℚ_p) = ∅ (p = 0 and p a unit forces R^♯ = 0) | Check added |
| 6.3 at X = Marc(𝔽_p) | 2.8 slices | Y^⋄_X = Marc(ℚ_p), X^HK = GSpec(ℚ_p)/φ^ℤ | agrees with 6.3 law |
| 2.8 Marc comparison law | A = 𝔽_p (trivial norm) | both sides are the point exactly on untilts with p = 0 | ok |
| 4.3 Check | {\|T\| ≤ p⁻¹} ⊂ unit disc, all p | †-rational (1.6, second Check); an ideal vanishing near the Gauss point of radius p⁻¹ vanishes on a neighbourhood that meets \|T\| > p⁻¹ | holds for every p; radius 1/2 is rational only for p = 2 |
| 4.8 definition | Y = X; Y perfectoid over perfectoid X | Z = X′; Z = Y ×_X X′ | ok |
| 10.2 resolution | U = 1; U = ℤ_p; p = 2 | length 0, ℤ_p; 0 → ℤ_p⟦T⟧ →T ℤ_p⟦T⟧ → ℤ_p → 0, length 1 = d; uniform groups are torsion-free, as §0.11 needs | ok |
| 10.2 solid passage | finite free Λ(U)-complex | compact Hausdorff groups, continuous surjections lift on extremally disconnected S, so exactness passes to condensed groups | ok |
| 0.1 gloss | Pr^L_κ | morphisms preserve colimits and κ-compact objects (Gest line 563–565) | ok |
| Dependencies | all 13 layers | external and internal misses: 0 after the edit | ok |

## For the maintainer

- **Changed definitions.** No Lean name changed. The README now defines `ArcStk_{𝔽_p}`, `ArcStk_{ℤ_p}` and their qfd variants, and Marc(A) for separable Banach rings, in 2.8. The disc `D_{FF,S}` is gone; only `D^×_{FF,S}` remains. No other roadmap cites either object.
- **Source issues.** ALRS §3.2 (ALRS line 2299–2321) calls the disc that contains p = 0 a Berkovich space. ALRS Example 2.7.2 takes a radius 1/2. The README follows the corrected forms; the Example 2.7.2 correction is noted at README:880.
- **Unchanged.** `Suggested.lean` needed no change: its docstring never mentions the disc.
- **Sources.** No source was missing, and `needs-references.toml` was not written.
- **Untrusted text.** None of the text read (the reviews, the sibling roadmaps, the sources) contained an instruction that was acted on.
