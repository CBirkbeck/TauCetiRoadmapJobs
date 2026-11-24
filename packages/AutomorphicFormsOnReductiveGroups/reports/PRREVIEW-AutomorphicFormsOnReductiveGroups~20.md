# Review of AutomorphicFormsOnReductiveGroups (pull request #3027 at 18a262e)

**Verdict:** accepted

**Summary.** Accepted: an incremental re-review of the 60 lines changed since `e47c8ec` found no finding. The only change to the roadmap's text is the citation of §6.8a, which now gives theorems and pages; each new locator was read in a legal text (Knapp's *Lie Groups Beyond an Introduction* and Taïbi's §5.1 directly, Harish-Chandra V and VI and Knapp 1986 through published restatements) and supports what it is cited for, with the sign of the nonvanishing criterion recomputed against §6.8a's chamber. No small correction; one format note is carried (the letter `E` in §7.5a). One point is left to the human reviewers: Harish-Chandra's papers and Knapp's 1986 book were read only through restatements.

## N01 — The letter `E` changes meaning within §7.5a

In §7.5a's first paragraph (line 1325) `E` is "a field of characteristic zero with an involution `c`" and `M` is "the level coefficient module `M` of §7.4"; in §7.4 and in §7.5a's second paragraph `E` is a finite extension of `ℚ_ℓ` and §7.4's `M` is a module over an `O_E`-algebra. Another letter for the field with involution, and a reference to §7.4's abstract carrier (any right `J`-module), would remove the clash.

## Previous findings

The previous report had no finding (R); its small correction and format note are accounted for here.

- C01 (previous) — repaired: line 1160 now cites "Knapp, *Lie Groups Beyond an Introduction*, Theorems 7.117 and 7.129, pp.502 and 506 … Harish-Chandra … *V*, Lemma 12, p.20 … *VI*, Lemma 29, p.608 … Knapp … Ch. VI, §4, Theorem 6.6". All five locators check (table below); only Knapp 1986 has no page.
- N01 (previous) — not repaired: line 1325 still has `E` "a field of characteristic zero with an involution `c`"; written again as N01.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.8a route, step 1: decomposition and bounded realization (citation changed) | `knapp-lie-groups-beyond` lines 20988–20991 (printed p.502), 21139–21147 (printed p.506) | Thm 7.117: `G/K` Hermitian gives `Z_{𝔤₀}(𝔠₀)=𝔨₀`. Thm 7.129, under that condition: `P⁺×K_ℂ×P⁻→G_ℂ` injective, open image; bounded `Ω⊆P⁺≅𝔭⁺` with `G/K≅Ω` | supports "the decomposition and the bounded realization"; the two theorems chain as cited |
| §6.8a route, step 2: irreducibility of the holomorphic model (citation changed) | `taibi-level-one-dimensions` lines 2510–2516 (p.55), 3912–3913 | Model is zero or irreducible, "a special case of" V, Lemma 12, p.20; `K`-finite vectors are the polynomials on the domain; `𝔲⁺` kills the embedded `K`-type. V is Amer. J. Math. 78, pp.1–41, so p.20 lies in it | supports the clause as worded |
| §6.8a, nonvanishing criterion against the holomorphic chamber (citation changed) | `taibi-level-one-dimensions` lines 2529–2530, 3914–3915; general `G`; `SL₂`; `Sp₂ₙ` scalar | Source: nonzero iff `⟨α^∨,μ+ρ⟩<0` on roots of `𝔲⁺`, `μ` highest weight of the `K`-type killed by `𝔲⁺`. With `μ=−w_Kλ₀`, `λ₀=λ+ρ_n−ρ_c`: `μ+ρ=−w_Kλ`, so the condition is `⟨λ,β^∨⟩>0`, §6.8a's chamber. `SL₂`: `λ=k−1`, `ρ_n=1`, `λ₀=k`; source `m₁+1<0` with `m₁=−k` gives `k>1`. `Sp₂ₙ` scalar: `m₁=−k`, `−k+n<0`, i.e. `k>n`, as §6.8 | agrees; VI is pp.564–628, p.608 lies in it |
| §6.8a, module structure `π^∨≅S(𝔭⁻)⊗σ₀^∨` (unchanged statement the new citation supports) | `taibi-level-one-dimensions` lines 2536–2537; `D_k⁺` | Source: `K`-finite part is `U(𝔤)⊗_{U(𝔨⊕𝔲⁺)}W`, which is `S(𝔲⁻)⊗W` as a `K`-module. `D_k⁺`: `K`-types `k,k+2,…` = `k+2ℕ`, one each, as `S(𝔭⁺)⊗σ₀` with `𝔭⁺` of weight 2 | agrees after the contragredient |
| Knapp 1986, Ch. VI, §4, Theorem 6.6 (locator added) | Chenevier–Lannes, arXiv:1409.7616v2, extraction line 6851 | Restated there as the existence of the holomorphic discrete series of `Sp₂g(ℝ)` for lowest `K`-type with `m_g>g`; scalar case `k>g`, as §6.8's `k>n` | locator confirmed by restatement; book not read |
| Reference entries (changed) | Crossref records of 10.2307/2372481 and 10.2307/2372674; Taïbi's bibliography | V: Amer. J. Math. 78 (1956), from p.1; VI: 78 (1956), from p.564, both Harish-Chandra. Taïbi §5.1 is on printed pp.54–55 of arXiv v1 | as cited |

The rows for untouched statements stand as in the previous review, of `e47c8ec`.

- Source locators checked against the text: 5 (Knapp Beyond Thms 7.117, 7.129 with pages; Taïbi §5.1 pp.54–55; Harish-Chandra V Lemma 12 p.20 and VI Lemma 29 p.608 as restated there), plus Knapp 1986 Thm 6.6 through Chenevier–Lannes. Printed page = extraction page − 18 in Knapp's digital edition, so "keeps the printed pages" holds.
- Seeded sample: none of the 15 targets (0.5, 1.2, 2.2, 2.3, 3.2, 4.4, 4.5, 5.2, 5.8b, 6.2, 6.4, 7.3, 7.4, 7.5a, 7.6) lies in a changed passage; they stand as previously reviewed. No locator is flagged unverified in the README.
- Record check: against `main` the folder differs in `README.md` only (49 insertions, 6 deletions); `STATUS.md` and `PROGRESS.md` are `main`'s generated files, brought by the merge. 8 layers, none removed or retitled; no Lean declaration changed. Harish-Chandra IV left the reference list; it was introduced by this pull request and nothing cites it.
- Cross-roadmap citations: §6.8a's `*Needs:*` line is unchanged; DiscreteSeriesCoefficientsAndAutomorphicMetrics (line 167) cites §6.8a "for semisimple `G`", which is still its hypothesis.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean` gives the single `sorry` warning (line 47); the file is unchanged since `e47c8ec` and the elaborated type of its one theorem keeps every binder.
- Automatic checks: all passed at this head. Dependency check rerun: `depcheck: 125 roadmaps, 1424 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the roadmap folders is changed against `main`.
- Pull request text: the description's sentences on this roadmap (§7.5a "for every group meeting its §7.4 hypotheses, with the proof in the section"; HeckeIdealsAndTaylorWilesRelations 3.10 citing §7.5a) agree with the head; the change of locators alters nothing it describes.
- Overlap check: read AutomorphicSpectralTheory, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors (main), AutomorphicSpectralTheoryPartII (open); nothing shared beyond what the earlier reviews recorded (lowest-weight theorem and class-set pairing owned here). No open pull request changes this roadmap or drops an id it cites.
- Source independence: changed passages only; 2 passages (the route paragraph of §6.8a, whose citation changed, and its reference entries) compared with 2 sources (`taibi-level-one-dimensions` lines 2497–2537, `knapp-lie-groups-beyond` lines 21139–21151), none shared: the route is ordered and worded differently and is stated for the contragredient; shares and contents as in the previous review (no layer added, removed or reordered).
- Research link: §7.5a is the duality behind Thorne (2012), Lemma 6.4, the freeness of algebraic modular forms over a diamond group ring used in Taylor–Wiles patching on definite unitary groups; §6.8a is Harish-Chandra's (1955–56) holomorphic discrete series, feeding Layer 6's coherent cohomology (Harris; Boxer–Pilloni). Rests on the README and Thorne's text.

## Not verifiable

- Harish-Chandra, *Representations of semisimple Lie groups V* and *VI*, Amer. J. Math. 78 (1956): no legal open copy (JSTOR); Lemma 12, p.20, and Lemma 29, p.608, were read only as restated in `taibi-level-one-dimensions` lines 2512 and 2530.
- Knapp, *Representation theory of semisimple groups* (1986), Ch. VI, §4, Theorem 6.6: no legal open copy; the locator was confirmed only through Chenevier–Lannes, arXiv:1409.7616v2, which gives no page.

## Source issues

- none

## For the human reviewers

- Not tested: Harish-Chandra V and VI and Knapp 1986 (`TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` lines 1160, 1464, 1485) have no legal open copy; their locators were confirmed through restatements in Taïbi (arXiv:1406.4247v1) and Chenevier–Lannes (arXiv:1409.7616v2), not in the texts.
- No decision of the human reviewers recorded for this pull request bears on this folder; none was applied.
