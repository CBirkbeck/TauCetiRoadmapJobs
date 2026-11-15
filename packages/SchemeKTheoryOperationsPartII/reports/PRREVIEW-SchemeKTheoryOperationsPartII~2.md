# Review of SchemeKTheoryOperationsPartII (pull request #1741 at 8c24078)

**Verdict:** needs changes

Incremental re-review of the 10 lines changed since `5c00dc6`, plus the pull request's title and description read against this head. Two P3 findings, none blocking.

## R01 (P3) — the description says the Lean states theorems with `sorry`; it declares nothing

**Location:** pull request description, "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "Validation: the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** a reader concludes that `Suggested.lean` states headline theorems, each with `sorry`.

**Witness:** `TauCetiRoadmap/SchemeKTheoryOperationsPartII/Suggested.lean` at 8c24078 is a module docstring and an empty namespace: 0 declarations, 0 `sorry`. `lake env lean` on it prints nothing (exit 0). The docstring lists thirteen headlines as not statable.

**Repair:** replace the first sentence by "`Suggested.lean` declares nothing: no headline theorem is statable at the pins, because neither Mathlib nor Tau Ceti has a formal-scheme carrier; its module docstring names the thirteen headline results and the carrier each lacks; every target is in the README." Replace the validation clause by "the targeted Lake build succeeds with no warning (the file has no declaration and no `sorry`)".

## R02 (P3) — STACKS manifest still records one chapter, the README cites four

**Location:** `packages/SchemeKTheoryOperationsPartII/sources.toml`, STACKS entry (`url = "https://stacks.math.columbia.edu/download/algebra.pdf"`, one `sha256`), against `TauCetiRoadmap/SchemeKTheoryOperationsPartII/README.md` line 813 (References, STACKS).

**Claim:** every `STACKS line N` locator resolves against a text the manifest records.

**Witness:** the entry is unchanged since `5c00dc6`: one URL, one hash. The README's seven locators into *More on Algebra* (062F, 07NV, 07NX, 07NY), *Cohomology of Schemes* (02KH) and *Varieties* (0AYR, 0AYX) have no recorded text.

**Repair:** as in the previous review: keep the single key `STACKS` and record in that entry the three further chapter downloads (`more-algebra.pdf`, `coherent.pdf`, `varieties.pdf`: URL, fetched sha256, licence class). The README needs no change. The manifest is the board package's file, not a file of this pull request's folder.

## Previous findings

- R01 — repaired: line 55 now reads "What AdicSpacesPartIII must provide (gap:proper-formal-coherent-direct-images): for an adic proper finite-type morphism p …"; §4.7 `*Needs:*` (line 783) and Layer 4 Dependencies (line 797) carry the same slug.
- R02 — not repaired: the STACKS entry of `packages/SchemeKTheoryOperationsPartII/sources.toml` still has the single `algebra.pdf` URL and hash. Written again as R02.
- R03 — repaired: §4.2 reads "read on a noetherian open neighbourhood U of W (via K₀(Coh_W(U)) ≅ K′₀(W), §1.2, independent of U by restriction compatibility)"; §4.7 reads "If the formal schemes X and X′ are compatibly over Spf A".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 extension of the degree to formally supported classes (changed) | X = ⊔ₙ Spf ℤ_p (locally noetherian, not quasi-compact), W = Spec 𝔽_p in component 0, F = ℤ/p²; U = component 0, U′ = components 0, 1 | On U: [F] = 2[𝔽_p], degree 2. On U′: same filtration, 2[𝔽_p], degree 2. Whole X is not noetherian, so §1.2 does not apply there | holds; U exists since W is quasi-compact | none |
| §4.2 restriction compatibility | U ⊆ U′ noetherian opens containing W, F killed by I_Wⁿ | Supp F ⊆ W ⊆ U, so Coh_W(U′) → Coh_W(U) is an equivalence (inverse: extension by zero); filtration by I_WⁱF restricts termwise | holds | none |
| §4.7 support-degree identity, reworded hypothesis (changed) | p = id; p : Spf ℤ_p⟦s⟧ → Spf ℤ_p⟦t⟧, t ↦ s², Y′ = V(p, s), W = V(p, t) | id: both sides equal. Second: p_*𝔽_p = 𝔽_p, degree 1 = 1 | holds; X, X′ are the objects over Spf A | none |
| Gap sentence, line 55 (changed) | EGA-III1 lines 4471–4473 (coherence), 4488–4494 (limit comparison an isomorphism; Mittag–Leffler for a noetherian target) | README: p adic, finite type, proper; locally noetherian; coherent Rᵠp_*F; inverse-limit comparison; Mittag–Leffler on noetherian target opens. Source: the same three assertions under (3.4.1) properness | agrees; one theorem with its corollary | none |

The rows for untouched statements stand as in the previous review, of `5c00dc6`.

- Gate at 8c24078: every check 0, build OK. Dependency check (the brief's command, `--movable`): `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Merge order: GeneralAlgebraicKTheory 19, SchemeKTheoryOperations 38, this roadmap 39.
- Elaboration: `lake env lean` on `Suggested.lean`, no output, exit 0. No declaration, so no `#check` comparison and no one-tactic probe applies; no headline became statable (the file and the pins are unchanged since `5c00dc6`).
- Outside-folder diff of `origin/main...HEAD`: empty. Files changed since `5c00dc6`: `README.md` only.
- Source locators read at the text for the changed passages: 3 (EGA-III1 lines 4444–4460 and 4471–4507; ZHANG21 lines 4576–4583). The seeded sample's targets fall outside the changed passages except through §4.2, cited by 4.4 and 4.6, whose statements read unchanged.
- Declared gap `gap:proper-formal-coherent-direct-images`: same slug in `design/plan.json` and at README lines 55, 783, 797; stated in the AdicSpacesPartIII subsection in the required form; the needs sentence matches the plan's. AdicSpacesPartIII on main still covers only completions of proper scheme morphisms (its line 3070), so the gap is not already supplied. No other README, on main or open, states EGA III (3.4.2). The review is conditional on this gap.
- Citations in the changed passages resolved: §1.2 (stated for noetherian X, K′₀(Y) ≅ K₀(Coh_Y(X))), §4.1, AdicSpacesPartIII §F0.6 on main. `roadmaps resolve` leads: none. Overlaps: no other open pull request changes this roadmap, no cited id dropped.
- Pull request text, remaining sentences checked against the head: adds a new roadmap (not on main; 54 headings added, 0 removed); suppliers still open are GeneralAlgebraicKTheory and SchemeKTheoryOperations, as its dependency list says; "arbitrary noetherian adic rings" (§§0.1, 1.5, 2.4), "infinite residue extensions" (§4.4(c)), "multiplicativity stays affine" (§2.4; ZHANG21 lines 4557–4560), `TauCeti.cartanMap`, `TauCeti.ExactK0` (README lines 13, 43), the consumer GrossZagierAndArithmeticHeightsPartII (Downstream consumers): all agree with the head.
- Remark: the description does not mention the declared supplier gap on AdicSpacesPartIII §F0.6, which §4.7 needs and main does not yet state.

Overlap check: read SchemeKTheoryOperations, AdicSpacesPartIII, SchemeAndStackFoundations; nothing shared (the changed passages add no object; ownership stands as in the previous review).

Source independence: 3 changed passages compared with 2 sources (EGA-III1, ZHANG21), none shared (changed passages only); largest share ZHANG21, 34 of 95 line locators; contents not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- none.

## Source issues

- **Gap** in ZHANG21 at Appendix B.1, printed page 972: the source says that for a regular noetherian formal scheme of pure dimension the strict supported group is isomorphic to the coherent group of the support; it should be stated with the resolution property (or with a locally perfect model), which the global locally-free complex model needs; affects a stated result.
- **Gap** in LIZHANG22 at §1.8, printed page 9: the source says a morphism of formal schemes is proper when its map of reduced schemes is proper, and then forms the direct image of coherent classes by higher direct images; it should require EGA properness (adic, finite type, proper reduction), since the reduced condition alone does not make higher direct images coherent (Spf k⟦t⟧ → Spec k); affects a stated result.

## For the human reviewers

- **Not tested.** The previous review, of `5c00dc6`, recorded no comparison of the layers with the contents of ZHANG21 (34 of 95 locators), and this incremental round does not make one. The description says "The route follows Zhang's Appendix B".
- **Licence.** ZHANG21 is read from `archive.ymsc.tsinghua.edu.cn` (README line 809), a copy of the Annals article that the manifest records as `institutional`, `certified`; whether that host's copy is a licensed one is a human's to confirm.
