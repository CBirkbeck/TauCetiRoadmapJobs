# Repair report: ProetaleCohomologyOfPAdicCurvesAndTowers design, second repair round

Files edited: `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/README.md`, `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/design/plan.json`, `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`. This is a design-stage package, so there is no `Suggested.lean` and no elaboration or `#check` comparison applies.

## F01 (P2) — applied

Verified: CDN23 line 1494 concludes "pour tout M de niveau ≤ n", and CDN23 line 330 with lines 181–182 defines level `≤ n` as `JL(M)` factoring through `Ǧ/Ǧ_n`. §7.8(e) changed from "every supercuspidal `M` on which `ϖ` acts trivially" to "every supercuspidal `M` of level at most `n` on which `ϖ` acts trivially (CDN23 Remarque 2.15(ii), line 1494)". The Layer 7 preamble now defines `Ǧ_n` and "level at most `n`". New §7.8 Check: `n = 1` with `M` of level `2` gives `Π_M(V) = 0`. plan.json 7.8 statement, hypotheses, locator and tests were updated to match. §7.4 Check (level 0) and the Layer 7 Example (level 1, `n = 1`) are consistent with the definition.

## F02 (P2) — applied

Verified: the CohomologyComparisonsPartII README at its open head has no `Syntomic.` name, and its §§4.1, 4.2, 4.4 and 4.5 carry the titles quoted by the reviewer. In the contract, the four backticked names are replaced by the section titles and their content: `L_EN(r) = (p^a a!)^{−1}ℤ_p(r)`, the period maps, the bound `p^{A(e,p,r)}` for `q ≤ r`, and gluing. The §5.3 Check now cites "CohomologyComparisonsPartII §4.1, its factorial Check" with `a = 2` and `p^a a! = 8`. The gap `formal-syntomic-period-comparison` is unchanged.

## F03 (P2) — applied

Verified: AInfCohomology §AI.3.1 at its head defines the carrier `A_inf,X` and its Frobenius but states no exact sequence for `1 − φ^{−1}`. The exact sequence of sheaves is CDN-DUKE Lemma 2.11(b) (lines 380–394). Changes:

- **Route of §6.7.** It now proves the sheaf sequence as an explicit step. For `i = 0` it is Artin–Schreier, from PrismaticCohomologyPartIII §6.3 modulo `p^n`, passed to the limit. For `i ≥ 1` it uses Lemma 2.11(a), `μ`-adic completeness, and `μ^i·ker(1 − φ^{−1}) = ker(1 − ξ^iφ^{−1})`.
- **Contract.** The §AI.3.1 bullet now supplies the carrier only. A PrismaticCohomologyPartIII §6.3 contract and scope line are added.
- **plan.json.** The 6.7 prerequisites, the suppliers list and the CDN-DUKE locator were updated to match.

## F04 (P2) — applied

Verified: PadicPeriodRings §4.3 at its head states only the fixed fields and `0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰ → 0`. Changes:

- **Contract.** It now cites exactly what §4.3 states.
- **Gap `needs`** (README and plan.json). It now asks for `0 → ℚ_p t → (B_cris^+)^{φ=p} → C → 0`, `(B_cris^+)^{φ=1} = ℚ_p` and `(B_cris^+)^{φ=p^{−1}} = 0` over an arbitrary complete algebraically closed `C`, which is the kernel the §1.3 Check computes.
- **Gap `detail`.** It records what §4.3 lacks.

## F05 (P3) — applied

Verified: with `g·(v, i) = (gv, i + v(det g))`, the class of vertex type plus `i` modulo `2` is invariant, because `type(gv) = type(v) + v(det g)`. So there are two `G`-orbits. `ϖ_D` shifts `i` by `v(Nrd ϖ_D) = 1` and fixes vertices, so there is one `G × Ǧ`-orbit. The §7.2 Check was rewritten accordingly; the stabilizer `GL₂(O_F)ϖ^ℤ` is kept. Two orbits is finitely many, so the theorem of §7.2 is unaffected. plan.json test `orbit` was updated to match.

## F06 (P3) — applied

- **§4.6.** "Théorème 0.16(ii)" → "Remarque 0.16(ii)" (CDN-CURVES line 410). plan.json already read "Remarque 0.16(ii)".
- **Scope.** "proper-curve diagram of §4.8" → "§4.7".
- **§2.5.** The splitting is now stated as the source states it (CDN-CURVES lines 3208, 3224–3230): a section `s_{r↦p^r}` of `H¹_ét → H¹_ét/H¹(Γ, ℚ_ℓ(1))`, with `s_{r↦ζ(r)p^r} = s_{r↦p^r} + t_ζN`, `t_ζ = (ζ(ℓ^{−n}))_n`, and the difference landing in `H¹(Γ, ℚ_ℓ(1))`. plan.json 2.5 was updated to match.
- **§6.3.**
  - The locator now records GK05's standing hypothesis `d ≥ 2` (GK05 line 1209).
  - For `d = 1`, the strata are checked directly.
  - For every `d ≥ 1`, it cites CDN-STEIN §5.5 line 2157. CDN-STEIN line 1881 sets `d ≥ 1`.
  - For `d = 1`, it also cites §4.3. I did not cite §6.4 here, because §6.4 depends on §6.3 and that would make a loop.
  - plan.json 6.3 hypotheses now include `d ≥ 1`, and its locator was updated.
- **§6.1 Check.** `r − 2` → `d − 2`.
- **sources.toml.** The GK14 locator now reads Corollaries 4.3, 4.4, 4.5 (GK14 line 1328).
- **Pattern search.** The search found more locators to complete in `sources.toml`:
  - CDN-DUKE: added Theorem 2.9, Lemmas 2.11–2.12 and Corollary 2.13.
  - CDN23: added Remarque 2.15(ii).
  - CDN-STEIN: §§5.2–5.5 → §§5.1–5.5.
  - DAT06: added (4.1.4) and Lemme 4.2.1.

  These are all already cited in the README.

## F07 (P3) — applied

Verified: DAT06 §4.1.3, lines 1962–1967, assumes only that `Γ` is discrete and torsion-free. "cocompact" was deleted from §6.10. The pattern search found that cocompactness stays only where it is used: §7.2's route and §7.8(e), where the quotient must be a proper curve. plan.json 6.10 already carried no cocompactness.

## F08 (P3) — applied

A `*Needs:*` line was added to each of the 38 targets that lacked one, so all 50 `### k.n` targets now have one. Each line lists, item by item, what the statement and its route use: plan.json prerequisites plus the route inputs named in the prose. For example:

- 4.5 needs ClassicalAdicEtaleCohomology §1.4 for the Kummer cocycle.
- 7.8 needs AdicSpacesPartIII §R3.7 for the algebraicity of `X_n`.
- 6.3 needs §4.3 for `d = 1`.

The plan.json prerequisites were extended to the same lists. The Layer 2 and Layer 6 Dependencies paragraphs now also name AdicSpacesPartIII F0, ClassicalAdicEtaleCohomology §4.6, PrismaticCohomologyPartIII §6.3 and §4.3.

## Checks

The dependency check, verbatim:

    candidate: ProetaleCohomologyOfPAdicCurvesAndTowers is not in the merge order yet; checked as if placed after ModpRepresentationsOfGL2OverLocalFields (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 662 edges, 0 problem(s)

There is no UPWARD or CYCLE line. The one new edge is PrismaticCohomologyPartIII, which is earlier in the merge order.

**Citation resolver** (`roadmaps resolve`): the only lead is "PadicLocalLanglandsForGL2QpPartII §4.1". This is a false lead: that roadmap is a board design whose §4.1 is the fundamental diagram of the Drinfeld tower, and it is cited only as a consumer. The four `Syntomic.*` leads from before this round are gone. Lean names found nowhere: none.

`plan.json` parses as JSON and `sources.toml` parses as TOML. The new text contains no LaTeX delimiters, process words or machine paths.

**Ownership:** PrismaticCohomologyPartIII §6.3 was checked against its open head before citing it. Nothing new is owned here: the twisted sheaf sequence is a step of §6.7's route, not a new target. Ownership against open pull requests outside the sibling checkouts given in the brief was not checked.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §7.8(e) with level `≤ n` | `n = 1`, `M` of level 2; `n = 1`, depth-zero `JL(M)` from `θ ≠ θ^q` on `𝔽_{q²}^×` | level 2: `Ǧ_1` trivial on `M_1^ϖ`, so `H¹[JL(M)] = 0` and `Π_M(V) = 0` for all `V`; level 1: `JL(M) = Ind_{F^×O_D^×}^{D^×} θ̃` of dimension 2, trivial on `1 + ϖ_D O_D`, with `ϖ = ϖ_D²` chosen to act trivially | repaired statement holds; (f) has input | Check added |
| Level at `n = 0` | `Ǧ_0 = O_D^×` | `Ǧ` acts on `M_0` through `v(Nrd)`, so `O_D^×` is trivial; a supercuspidal `JL(M)` has dimension `≥ 2` and is not trivial on `O_D^×` | consistent with the §7.4 Check | none |
| §7.2 orbit Check | `g = diag(ϖ, 1)`; `g = ϖ` (central); `ϖ_D` | `diag(ϖ,1)`: `v(det) = 1`, type `+1`, index `+1`, invariant `+2 ≡ 0`; `ϖ`: fixes `v`, index `+2 ≡ 0`; `ϖ_D`: fixes `v`, index `+1` | two `G`-orbits, one `G × Ǧ`-orbit | rewritten |
| §2.5 Picard–Lefschetz | `ζ` trivial; Tate curve | `ζ = 1`: `t_ζ = 0` and the section is unchanged; Tate curve: `N` maps `ℤ_ℓ` (bottom) to `ℤ_ℓ(1)` (top) by `v_p(q)`, and `t_ζN` lands in `H¹(Γ, ℚ_ℓ(1)) = ℚ_ℓ(1)`, the kernel of the projection | consistent | restated |
| §6.7 sheaf sequence | `i = 0`; `i = 1` on `μ^i x` | `i = 0`: `1 − φ^{−1} = −φ^{−1}(1 − φ)`, kernel `Ẑ_p`; `(1 − ξ^iφ^{−1})(μ^i x) = μ^i x − ξ^iφ^{−1}(μ)^iφ^{−1}(x) = μ^i(1 − φ^{−1})x`, since `ξφ^{−1}(μ) = μ` | the kernel is `μ^iẐ_p` | route rewritten |
| §6.3 at `d = 1` | `ℙ¹_k`; double point; `s = 0, 1, 2` | `H⁰`: `φ^f = 1 = q⁰`; `H¹` (log): residues at the `q + 1` points, `φ^f = q`; `H²_rig(ℙ¹)`: `φ^f = q²`; point: `H⁰ = F`, `φ^f = 1` | `φ^f = q^s` in every case | witness added |
| `N = 0` from `φ^f = q^s` | `s = 1`, `q = p^f` | `Nφ^f = qφ^fN`; on `H^s`, `q^sN = q^{s+1}N`, so `(q − 1)q^sN = 0` and `N = 0` | holds for every `d ≥ 1` | none |
| Gap `period-rings-general-C` | `M = C̆`, `M = C̆(−1)`, `r = 1` | `(B_cris^+)^{φ=p}` surjects onto `C` with kernel `ℚ_p t`; `(B_cris^+)^{φ=1} = ℚ_p`; `X^0_st` of slope one is `(B_cris^+)^{φ=p^{−1}} = 0` | exactly the facts §§1.3 and 6.5 use | `needs` rewritten |
| §5.3 factorial Check | `p = 2, r = 2`; `p = 3, r = 4` | `a = 2`, `p^a a! = 8`, giving `(1/8)ℤ_2(2)`; `a = 2`, `3²·2 = 18`, giving `(1/18)ℤ_3(4) = (1/9)ℤ_3(4)` because `2` is a 3-adic unit | agrees with CohomologyComparisonsPartII §4.1 | citation restated |
| §6.10 without "cocompact" | `Γ = 1`; non-cocompact torsion-free `Γ` | `Γ = 1`: `Λ ⊗^L_Λ RΓ_c = RΓ_c`, trivially; general discrete torsion-free `Γ`: free action, Galois covering (DAT06 lines 1963–1965) | the source needs no compactness | deleted |

## For the maintainer

- **Supplier citations.** This roadmap now cites PrismaticCohomologyPartIII §6.3 as a supplier, which is earlier in the merge order. It no longer cites any CohomologyComparisonsPartII declaration names.
- **Names cited by other roadmaps.** No name that another roadmap cites changed.
- **Consumers.**
  - ScholzeFunctorAndModpCohomologyOfTheLubinTateTower's gap is served by §§7.2 and 7.7, which are unchanged; the §7.2 Check correction does not affect it.
  - Consumers of §7.8 should note the level hypothesis now carried by (e).
- **Untrusted text.** No suspicious instructions were found in the review text.
