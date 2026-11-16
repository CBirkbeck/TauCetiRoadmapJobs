# FIX-DESIGN-RationalAnalyticPrismatization~13

Findings of `REV-DESIGN-RationalAnalyticPrismatization~12` (three, all P3). Files changed:
`packages/RationalAnalyticPrismatization/design/README.md`, `packages/RationalAnalyticPrismatization/design/plan.json`.
`sources.toml` is unchanged: every new locator is to ALRS, already recorded and certified, and its
`locator` (§§2–6) and `cited_for` (Design: Layers 1–12) cover them. No `needs-references.toml` was written.

## F01 (P3) — applied differently

8.2: the unnamed relative objects → defined: Y^{Div¹~/𝒳} = Y^{Div¹~} ×_{D^{Div¹~}} 𝒳, Y^{Div¹/𝒳} = Y^{Div¹~/𝒳}/φ^ℤ for perfect prisms, written Y^{Div¹/FF_D} for perfectoid D (ALRS line 3024, 3052); two laws (Y^{Div¹} ×_{D^{Div¹}} 𝒳/φ^ℤ; Y^{HT/D} = Y^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D); three Checks. 11.4 Check: "since D^{Div¹} = FF_D" → base change of an identity.

**Why differently.** The reviewer tested the repair with "D^{Div¹} = FF_D for perfectoid D (8.3)", and the 11.4 Check said the same thing. That identity is false. ALRS line 3114–3115 says that Y^{Div¹} and FF_Y are not isomorphic for perfectoid Y, and the roadmap's own 8.3 Check (and the Layer 8 Examples) say so too. So the 11.4 Check contradicted 8.3. The value FF_D still holds, for a different reason: D^{Div¹/FF_D} = D^{Div¹} ×_{D^{Div¹}} FF_D is the base change of an identity. The new 8.2 Check states this and contrasts it with D^{Div¹} ≠ FF_D. The proposed law Y^{HT/D} = Y^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D was verified, not copied. D → 𝒳 → D^{Div¹~} lands in the Hodge–Tate locus. Over that locus the projection Y^{Div¹~} → Y^Δ is an isomorphism: a Hodge–Tate divisor D_0 has the unique compatible system D_n = φ^n(D_0), because φ maps the copy {n} × T isomorphically onto {n+1} × T. This law is the Hodge–Tate case of ALRS Definition 4.5.1(2) (ALRS line 3611).

**Same pattern, also repaired.**
- 9.2: X^{HK/𝒳} was used but never defined. It is now defined as the relative de Rham stack (X^{Div¹/𝒳})^{dR/(𝒳/φ^ℤ)} (ALRS line 350). The two squares are now named exactly as in ALRS Proposition 4.4.4. Added two laws: X^{HK/𝒳} = X^HK ×_{D^HK} 𝒳/φ^ℤ, using X^{Div¹,dR} = X^HK (ALRS line 308); and †-formal étaleness over 𝒳/φ^ℤ. Added one Check that computes all six corners for X = D. *Needs* gains §8.6, §7.1 and §3.1.
- 9.4: "their relative versions over a perfect prism" is now written out as X^{†-HT/D^†} = X^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D^† and X^{HT^/D^∧} = X^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D^∧ (ALRS line 3611). Added the Check for X = D. *Needs* gains §8.2 and §3.1.
- 11.4: *Needs* gains §8.2.
- 12.3 proof route: the abbreviation "Y^{Div¹/FF}" → "Y^{Div¹/FF_{X^⋄}}", the name defined in its statement.
- 8.2: *Needs* gains §7.1, and its hypotheses entry in `plan.json` names the perfect prism.

The other uses of X^{Div¹/FF_D} (11.5 proof route, 11.9) and X^{HT/D} (11.10) now point to the 8.2 definitions and need no text change.

## F02 (P3) — applied

`proetale-v-comparison` Supply sentence (README and `plan.json` `detail`): ℚ̂_p comparison "after inverting p for qcqs X" → "for every such X … obtained for qcqs X by inverting p and in general by descent along the affinoid opens of X, both sides being hypersheaves on the analytic site of X".

**Verified.** 11.7 takes X partially proper, for example the open disc, which is not quasi-compact. The old Supply sentence stopped at qcqs X, while its `needs` sentence covered every X. The reviewer's text says "sheaves". I wrote "hypersheaves", because the extension uses the basis of affinoid opens and X need not be quasi-separated. Each side is RΓ of a sheaf of abelian groups, restricted to opens, so each satisfies hyperdescent. A natural map of hypersheaves that is an equivalence on a basis is an equivalence. The `needs` sentence and the supplier (DiamondsAndVStacks §D6.5, which exists on main) are unchanged. No other qcqs restriction occurs in the README.

## F03 (P3) — applied

`plan.json`: test `proper_identity` of 12.4 → `properDuality_identity`; test `HT_perfectoid` of 9.1 → `HTgerbe_perfectoid`. The README has no names for Checks and is unchanged for this finding. After the change, the duplicate-name script over all target, API and test names returns nothing, including the nine names added for F01.

## Checks run

**Dependency gate** (command of the brief), output:

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2264 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Structure (scripted over `plan.json` and the README).**
- 88 targets.
- 620 plan statements, API bullets and tests (611 before, plus 9 new). All occur verbatim in the README.
- No repeated name.
- Every target whose statement says "define" or "call" has an API list. 9.2 now has one.
- All 21 gap `needs` and `detail` sentences occur verbatim in the README.
- `prerequisites` equal the *Needs:* lines for every target except 2.7, which lists the same four items in a different order. That predates this round and was not touched.

**Citations.** `roadmaps resolve` gives one lead: MotivesAndAlgebraicCyclesPartII Layer 0. It is a board package that is earlier in the merge order, and `packages/MotivesAndAlgebraicCyclesPartII/design/README.md` has "## Layer 0". The worker's earlier lead `Huber.GelfandSpectrum` (README line 327, untouched) is declared in `TauCetiRoadmap/AdicSpacesPartIII/Suggested.lean` on main.

**Ownership.** `roadmaps grep -i --readme-only` for "twistor stack", "relative twistor stack", "relative Hyodo" and "Hyodo–Kato stack" finds no match on main or at any open head. The relative twistor and Hyodo–Kato stacks are part of this roadmap's prismatization, which AnalyticStacks leaves to it. Ownership against open pull requests was checked through this grep only; the open roadmaps were not read one by one.

**Lean.** The design stage has no `Suggested.lean`. There was nothing to elaborate, and no `#check` pass was run.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 8.2 Y^{Div¹~/𝒳}, Y^{Div¹/𝒳} | Y = D; Y = ∅; S = ∅; D = GSpec(C_p) | 𝒳 and 𝒳/φ^ℤ; ∅; ∅ (only prism (∅,∅,∅)); 𝒳 = Y_{(0,∞)} over C♭, 𝒳/φ^ℤ = FF_{C♭} | holds |
| 8.2, perfectness hypothesis | A = C_p[ε]/ε² (nilperfectoid, A^u = C_p); A = C_p | φ maps {n}×T → {n+1}×T and misses the thickened copy 0: not an automorphism, so 𝒳_T/φ^ℤ is undefined; 𝒳_T = D^×_{FF,C_p♭} is perfect | hypothesis needed; Check added |
| 8.2 law: quotient of a fibre product | G = φ^ℤ on Y^{Div¹~} → D^{Div¹~} ← 𝒳; G = ℤ acting trivially on points | (A×_C B)/G vs A/G ×_{C/G} B/G: pulling back along the torsor B → B/G gives A ×_C B on both sides; Bℤ = Bℤ ×_{Bℤ} Bℤ | holds for any group |
| 8.2 law Y^{HT/D} = Y^{Div¹/𝒳} ×_{𝒳/φ^ℤ} D | Y = D; Y = ∅; Y smooth over perfectoid D | 𝒳/φ^ℤ ×_{𝒳/φ^ℤ} D = D = 𝒳 ×_𝒳 D; ∅ = ∅; gives the map X^HT → X^{Div¹/FF_D} used at ALRS line 7996 (11.5 proof route) | holds |
| 8.2 Check, relative vs absolute | perfectoid D | D^{Div¹/FF_D} = FF_D; D^{Div¹} ≠ FF_D (ALRS line 3114) | the relative and absolute stacks differ, as the Check says |
| 11.4 Check (changed) | X = D | D^{Div¹} ×_{D^{Div¹}} FF_D = FF_D; α_{D/D} = id; the old reason D^{Div¹} = FF_D contradicted the 8.3 Check | repaired |
| 9.2 X^{HK/𝒳} = (X^{Div¹/𝒳})^{dR/(𝒳/φ^ℤ)} | X = D; X = ∅ | 𝒳/φ^ℤ ×_{(𝒳/φ^ℤ)^dR} (𝒳/φ^ℤ)^dR = 𝒳/φ^ℤ; ∅ | holds |
| 9.2 law X^{HK/𝒳} = X^HK ×_{D^HK} 𝒳/φ^ℤ | X = D; X = ∅ | D^HK ×_{D^HK} 𝒳/φ^ℤ = 𝒳/φ^ℤ, the same as the definition; ∅. Inputs: X^{Div¹,dR} = X^HK (ALRS line 308); D^HK = (FF^⋄_S)^dR = (𝒳/φ^ℤ)^dR, because ι^⋄ is an isomorphism (7.1) and D^⋄ = S^{♯⋄} | holds |
| 9.2 right square | X = D | top 𝒳/φ^ℤ → D^HK, bottom 𝒳/φ^ℤ → (𝒳/φ^ℤ)^dR, right side the isomorphism D^HK ≅ (𝒳/φ^ℤ)^dR: cartesian | holds |
| 9.2 wrong model: X^{HK/𝒳} := X^HK | X = D | 𝒳/φ^ℤ against (𝒳/φ^ℤ)^dR, which are different stacks | the Check excludes it |
| 9.4 relative versions | X = D; then restrict to D | 𝒳/φ^ℤ ×_{𝒳/φ^ℤ} D^† = D^†, likewise D^∧; then D^{HT/D} = D, matching 9.2 | holds |
| 9.2 law: †-formally étale | X = D | 𝒳/φ^ℤ → 𝒳/φ^ℤ is the identity | holds |
| F02 contract | X = Spa(K); closed disc; open disc ⋃ X_n; X = ∅ | RΓ(Gal_K, ℚ_p) on both sides; Ẑ_p-comparison[1/p]; Rlim_n of the qcqs equivalences on the rational opens X_n; 0 = 0 | holds |

## For the maintainer

- No section, layer or target id changed, so the citations of other roadmaps are unaffected. The only renamed names are two plan test names (F03), which no other roadmap cites. The new plan API names are `TauCeti.Prism.relativeTwistor_fiberProduct`, `TauCeti.Prism.relativeHodgeTate_eq_twistor`, `TauCeti.Prism.relativeHyodoKato_fiberProduct` and `TauCeti.Prism.relativeHyodoKato_formallyEtale`, plus the tests `relTwistor_base`, `relTwistor_notPerfect`, `relTwistor_empty`, `relHK_base` and `formalHT_relativeBase`.
- The `proetale-v-comparison` gap now asks DiamondsAndVStacks for the ℚ̂_p comparison on all rigid spaces, including those that are not quasi-compact, as its `needs` sentence already did.
- Nothing in the review text was treated as an instruction.
