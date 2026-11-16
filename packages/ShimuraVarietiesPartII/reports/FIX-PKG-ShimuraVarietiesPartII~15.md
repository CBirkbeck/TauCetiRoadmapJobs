# FIX-PKG-ShimuraVarietiesPartII~15

Findings settled: the two findings of the round 14 review (REV-PKG-ShimuraVarietiesPartII~14), F01 (P2) and F02 (P3). Both are correct and both are applied. Files changed: `packages/ShimuraVarietiesPartII/README.md`, `packages/ShimuraVarietiesPartII/sources.toml` (two `locator` strings) and the top-level `gaps` list of `packages/ShimuraVarietiesPartII/design/plan.json` (one entry removed). `Suggested.lean` and `metadata.toml` are unchanged. Nothing was done about the review's section for the human reviewers.

## REV-PKG-ShimuraVarietiesPartII~14/F01 (P2) — applied

Old: the contract gap:finite-field-bertini on AlgebraicModuliForArithmeticGeometry Layer 1 (positive dimension only), plus Poonen's Bertini in §6.3. New: the gap is deleted from the README and the plan. A contract "From TauCetiRoadmap.LefschetzPencilsAndVanishingCyclesPartII" (§2.4) is added, with a sentence in Scope. §6.3 (Construction, sketch, *Needs:*), the Layer 6 Examples and the Layer 6 Dependencies now cite §2.4.

**Verification.**
- LefschetzPencilsAndVanishingCyclesPartII is on main, as `TauCetiRoadmap/LefschetzPencilsAndVanishingCyclesPartII/README.md`. Its §2.4 (line 579–616) states `exists_same_field_curve`. The input is a scheme Y over any field k, a rational point y with an open neighbourhood V smooth over k, and an open U with U∩V dense in V. The output is an affine, smooth, geometrically integral curve C of relative dimension one, a point c∈C(k), and a k-morphism g with g(c)=y and g⁻¹(U) nonempty and dense. Its Lean statement (`Suggested.lean` line 109–116) has exactly these hypotheses and conclusions.
- Step 3 of §2.4 handles a zero-dimensional chart: it returns A¹ with the constant map. The residue fields at c and at y are both k (line 618–624). The downstream paragraph (line 683–693) names KZ Corollary 5.2.7 and Proposition 5.3.5 as the consumers.
- LefschetzPencilsAndVanishingCyclesPartII is entry 4 of `merge-order/ORDER.txt`; this roadmap is entry 363. A roadmap on main can be consumed.
- KZ line 2341–2351 (proof of Corollary 5.2.7, pp.52–53) applies the curve step to a smooth scheme Y over F_q. Y has a rational point ỹ and a dense open Y_λ′, and only the composite C′→S is used. KZ line 2411–2418 (proof of 5.3.5, p.54) uses the same step on the smooth top KR stratum, with the μ-ordinary locus as the open. §2.4 covers both uses, with V=Y.
- The deleted gap required positive dimension. A zero-dimensional presentation, for example Spec F_q, would therefore not have been covered.

**Ownership.** `roadmaps grep 'finite-field-bertini|exists_same_field_curve'` finds only LefschetzPencilsAndVanishingCyclesPartII on main. No board package README uses the slug. The lift of a rational point to a smooth atlas is not in that roadmap: its "Not in this roadmap" paragraph (line 104–121) and line 691–693 exclude it. So gap:rational-stack-presentation stays as declared.

**Edits beyond the proposed text (pattern).**
- In §6.3 the top-stratum step also used the curve step, as in KZ's proof of 5.3.5. It now applies §2.4 to a rational-point smooth presentation of the smooth top KR stratum, with the dense inverse image of the ordinary open.
- The proof sketch now says why the inverse image of the higher stratum is dense: the presentation and the base change of the local-model map are smooth, hence open, and the inverse image of a dense set under an open map is dense.
- The Layer 6 Example now says that at neat level the component through x is Spec F_q.

No other occurrence of "Bertini" or "Poonen" remains in the README.

**plan.json.** The `finite-field-bertini` entry is removed from the top-level `gaps` list (23 → 22). A JSON comparison with the previous file shows that only the key `gaps` differs. The slug is still named in two places outside the editable list: the prerequisites of node `SV2.6/same-field-curves`, and the coverage entry of stage `SV2.6`. The brief does not allow edits there. Earlier rounds left removed slugs in the same places.

## REV-PKG-ShimuraVarietiesPartII~14/F02 (P3) — applied

Old → new in `sources.toml`:
- KZ `locator`: "…; Definition 2.2.4; Remark 2.2.5; Propositions …" → "…; Definition 2.2.4; Remark 2.2.5; Lemma 2.2.8; Propositions …".
- KPZ `locator`: "…; Definition 3.1.4; …" → "…; Definitions 3.1.4, 3.4.4; …".

Nothing else in the manifest changed.

**Verification.**
- KZ Lemma 2.2.8 is at KZ line 457 (p.10, before the page-11 marker at line 459). It compares the existence of μ-ordinary classes, and the classes themselves, under a map that is an isogeny on derived groups. README §5.5 (line 1158) cites it for the ordinary classes.
- KPZ Definition 3.4.4 is at KPZ line 1234–1237 (p.28). It defines a good integral Hodge embedding by asking that the map of local models to the Grassmannian be a closed immersion. The supplier contracts cite it (README line 86 and 94).

**Pattern.** I extracted every KZ, KPZ, KP, HT and K17 locator in the README by script and compared each with its manifest `locator`. Every hit outside the listed ranges turned out to be one of three things: a section of this README, a section of another roadmap that follows a source key on the same line, or a reference already covered (HT (1.3.4.2) and §1.2.5, KZ §3.1 and §6). The two locators of the finding were the only ones missing.

## Adversarial pass (new and changed statements)

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Contract: LefschetzPencilsAndVanishingCyclesPartII §2.4 as restated | Its Lean statement (line 109–116) | Hypotheses: section y, open V ∋ y with V→Spec k smooth, open U dense on V. Conclusions: affine C, smooth of relative dimension 1, geometrically integral, g≫f=s_C, c a section, c≫g=y, g⁻¹U nonempty and dense | Restatement equal, clause for clause | none |
| Same, degenerate case | Y=V=U=Spec F₂ | m=0, so C=A¹_(F₂), g constant, c=0, g⁻¹U=C. An immersion C→Spec F₂ is impossible | "g need not be an immersion" is needed and stated | none |
| Same, y outside U | Y=A²_(F₂), y=0, U=D(X₀²X₁−X₀X₁²) | Lines (t,0), (0,t), (t,t) give 0, 0, t³−t³=0. The graph T↦(T,T³) gives T⁵−T⁷=T⁵+T⁷≠0, so g⁻¹U=D(T⁵+T⁷), and c=0∉g⁻¹U | "y may lie outside U" holds; no rational line works | none |
| Same, smoothness at y | Cone x²+w²=0 over F₃ (Lefschetz worked example 3) | Two lines conjugate over F₉; every F₃-curve through the vertex is constant | The hypothesis "V smooth" cannot be dropped | none |
| §6.3 density of the higher-stratum inverse image | Y→S̃×_M C→C, both maps smooth | For O⊂Y nonempty open, the image of O is nonempty open in C, so it meets C_λ′ and O meets Y_λ′ | Dense, as stated | stated in the sketch |
| §6.3 smoothness of Y over F_q | Y smooth over S̃×_M C, which is smooth over C; C smooth over F_q (GeometricSatakeAndFusionPartII §5.5: smooth geometrically connected C/F_q, c∈C(F_q)) | Composite of smooth maps is smooth | The §2.4 hypothesis holds with V=Y | none |
| §6.3 top-stratum step | S^μ_K smooth (KZ line 2412); ordinary locus dense (§5.4) and contained in S^μ_K | The presentation is open, so the inverse image of the ordinary locus is dense in Y; §2.4 gives C→Y→S^μ_K with c↦x and a dense ordinary inverse image | holds | rewritten |
| §6.3 conclusion "smooth geometrically connected" | §2.4 output | Geometrically integral, so geometrically irreducible and geometrically connected | holds | stated in the sketch |
| §6.3 Check 1 (degree of the marked point) | §2.4 output | c∈C(k) with k=F_q; residue degree 1 at c and at x | Check unchanged and consistent | none |
| §6.3 Check 2 (constant map fails) | Lower-stratum x | Constant C→{x}: inverse image of the higher stratum is empty. §2.4 with Y_λ′ dense gives a nonempty inverse image | consistent | none |
| Layer 6 Example, torus component | G a torus, neat level, x∈S(F_q) | The model is finite étale; the connected finite étale F_q-component with an F_q-point is Spec F_q; B(T,μ) is one class, so x is ordinary; §2.4 with Y=V=U=Spec F_q gives A¹ with the constant map, c=0 | matches the Example | rewritten |
| F02 locators | KZ line 457; KPZ line 1234 | Lemma 2.2.8 on p.10; Definition 3.4.4 on p.28 | Both now in the manifest | applied |

## Checks run

- **Lean.** `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: no declarations and no `TauCeti.*` import. The `#check @name` comparison therefore had nothing to compare, so no scratch file was needed and nothing changed.
- **Dependency direction** (prescribed command, with `--movable`): exit 0.

  ```text
  depcheck: 262 roadmaps, 2547 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. The one extra edge is the new supplier LefschetzPencilsAndVanishingCyclesPartII, entry 4 of the order.
- **Citations.** `roadmaps resolve packages/ShimuraVarietiesPartII/README.md` against main (e213fdd) and 455 open heads finds no unresolved cross-roadmap citation and no unresolved Lean name, including `exists_same_field_curve`.
- **Gaps.** 22 slugs are used in the README, 22 "What … must provide" contracts are declared, and the `design/plan.json` `gaps` list has 22 entries. The three sets are equal, and each contract names the plan's supplier. `plan.json` is valid JSON, and only its `gaps` key differs from the previous file.
- **Manifest.** `sources.toml` parses as TOML; only the two `locator` strings changed. No source was fetched, and no `needs-references.toml` was written.
- **Residue grep** for LaTeX delimiters, `$`, process words, pull-request numbers and machine paths in the README: no hits.

## For the maintainer

- AlgebraicModuliForArithmeticGeometry is no longer asked for a finite-field Bertini statement. Its remaining obligation from this roadmap is gap:rational-stack-presentation (Layer 4).
- This roadmap now cites LefschetzPencilsAndVanishingCyclesPartII §2.4 on main. That roadmap's downstream paragraph already names this use. No name that other roadmaps cite changed here, and no id of this roadmap was dropped or renumbered.
- `design/plan.json` still names gap:finite-field-bertini in the node `SV2.6/same-field-curves` and in the `SV2.6` coverage entry. These lie outside the editable `gaps` list.
- Ownership against open pull requests was checked with `roadmaps grep` over the 455 open heads and main, and over the board's package READMEs.
