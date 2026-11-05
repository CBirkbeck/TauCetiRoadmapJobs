# FIX-PKG-AutomorphicCongruences~6

Review resolved: REV-PKG-AutomorphicCongruences~5 (five findings). All edits are in `packages/AutomorphicCongruences/README.md` and `packages/AutomorphicCongruences/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P2) — applied

Verified. Wan-2015 line 3542 fixes f_(κ0) of parallel weight κ0 > 2. Theorem 86 (line 3550), Theorem 3 (lines 112, 116) and Theorem 101 (lines 4411, 4415) all print p > 5. Theorem 8 at line 237 prints "p > 3" and then excludes p = 5 separately, so the extraction does render a strict ">" here. The proof of Theorem 86 rules out only p = 3 (lines 3563–3565), and BCS line 336 (Thm 3.2.1, p. 7) and lines 220–222 (§1.5, p. 5) read the theorem the same way.

Changes:
- **§5.3.** "f_(κ0) … even parallel weight κ0" → "κ0 > 2 (as Wan fixes it)". "κ0 > 2 even" is added to the hypotheses. The source line now gives Wan's printed p > 5 and κ0 > 2, why p = 5 is admitted, and BCS-v2 §1.5 and Thm 3.2.1. The stabilizer argument in the proof sketch now carries its degree computation.
- **§5.3 Checks.** Two new Checks: one on the prime boundary (p = 5 versus p = 3) and one on the weight boundary.
- **§5.10.** "κ0≥2" → "κ0 > 2, trivial nebentypus". Weight two is reached through the family member of weight p + 1, by PadicFamilies §5.8 (and gap:hilbert-hida-odd-degree for odd d). Wan's printed hypotheses and the BCS reading are added to the source line. The wrong Check ("would not reach elliptic curves") is replaced by two Checks: weight 6 at p = 5, and p = 5 admitted with p = 3 excluded. *Needs:* gains §5.3, PadicFamilies §5.8 and the already-declared gap:hilbert-hida-odd-degree.

Same pattern searched in §§5.9, 5.11 and 5.12: §5.12 already has p > 3 and works at weight two through §5.11, which specialises the family. Nothing else changed.

## F02 (P3) — applied

Verified: Wan-2015 Theorem 82(ii) (line 3420) puts L^Σ in I_K = I[[Γ_K]], and the Gorenstein hypothesis is at line 3419. Old: β : Λ_(M,A) → Λ⁻_(M,A). New: β : I[[Γ_M]] → Λ⁻_(M,A), the composite of the weight specialization φ_(κ0) with the map that sends the cyclotomic variable to the central point. It extends to elements whose denominators in I avoid ker φ_(κ0), and L̃^(Σ,−) is defined when L̃^Σ is finite at φ_(κ0). The Gorenstein instance (§5.2, Theorem 82(ii)) is now stated for the integral function. Added a Check computing w(κ0)·β(T) for W·T.

## F03 (P3) — applied

Verified in the cached arXiv v6 text:
- Theorem 10.2.2: line 3096, p. 52.
- Notation 7.7.1: line 2340, p. 39.
- Definition 8.1.1: line 2392, p. 40.
- Proposition 8.1.7: line 2488, p. 42.

The locators now use the arXiv v6 pages instead of the journal ones (p. 94 / 71 / 72 / 75), in both §2.15 and §2.16. Both links now point to arXiv v6. The References bullet and the `sources.toml` `version_note` and `locator` now say the pages are arXiv v6. These are the only page locators to KLZ17.

## F04 (P3) — applied

The reviewer's fetch did not reach this branch: `sources.toml` at this head had no entry for the paper. I fetched it through the sources service as `LZ14` (arXiv:1108.5954v3, certified, cited_for 2.19); the key is new and the paper had no earlier key. LZ14 lines 420–446 contain §3.2, Definition 3.4 (p. 10) and Proposition 3.6 (pp. 10–11). They show the inverse-basis sum and the action y(x^g) = [g]y(x), which matches the README's convention remark.

The two prose mentions in §2.19 now read "LZ14 §3.2, Definition 3.4 and Proposition 3.6, pp. 10–11", and LZ14 has a References bullet.

## F05 (P3) — applied

RankOneConverse has no folder on main, in the open roadmap pull requests (`roadmaps grep` finds nothing) or in the board's packages. So the claim that it consumes §2.22 cannot be checked. I removed:
- the clause in the scope paragraph;
- the clause "is the input that RankOneConverse imports" in §2.22;
- the Downstream-consumers bullet.

Consumers are not suppliers, so nothing else changes.

## Checks

- **Lean elaboration.** `lake env lean packages/AutomorphicCongruences/Suggested.lean`, run from the content checkout: exit 0, no output, 2.7 s. No TauCeti module needed a build.
- **`#check @name` audit.** `Suggested.lean` declares nothing, so there were no names to check. The file was not changed.
- **Dependency check** (`gate --depcheck … --movable`):

  ```text
  depcheck: 56 roadmaps, 664 edges, 0 problem(s)
  ```

  No UPWARD, CYCLE or moved line. The edge count went from 662 to 664 because of the new PadicFamilies §5.8 / gap entries in §5.10, an existing supplier.
- **Citation resolver.** `roadmaps resolve`: "Lean names found nowhere: None."
- **Supplier gaps.** No new gap. `design/plan.json` is unchanged; gap:hilbert-hida-odd-degree was already declared.
- **Missing sources.** No `needs-references.toml` was produced: every text needed was readable.
- **Style.** No LaTeX delimiters and no machine paths in the README. The `$` in `sources.toml` titles are the recorded bibliographic titles.

- **Re-run on the committed head.** All five repairs were checked again in the README: §5.3 and §5.10 require κ0 > 2; β is defined on I[[Γ_M]]; KLZ17 uses the arXiv v6 pages; LZ14 is cited and has a References entry; RankOneConverse appears nowhere. The checks gave the same results: elaboration exit 0 with no output (3.6 s); `depcheck: 56 roadmaps, 664 edges, 0 problem(s)`; resolver "Lean names found nowhere: None."

## Adversarial pass (changed statements)

| Statement | Instances | Values | Result / change |
|---|---|---|---|
| §5.3 stabilizer argument | p = 3, 5, 7; F unramified at p | F ∩ ℚ(ζ_p) = ℚ (ℚ(ζ_p) is totally ramified at p), so [F(ζ_p):F] = 2, 4, 6. An order-p element needs degree ≤ 2, so only p = 3 | p = 5 admitted, p = 3 excluded; Check added |
| §5.3 weight | κ0 = 2 versus κ0 = 4, 6 | Wan line 3542 requires κ0 > 2; Hung2017 (uncertified) would be the only source at κ0 = 2 | κ0 > 2 required |
| §5.3 β domain | I = A[[W]], L = W·T; f_(κ0) at W = w | β(L) = w·β(T); at w = 0 it is 0. A map on A[[Γ_M]] alone is undefined on W | β now goes through φ_(κ0) |
| §5.3 rational extension | denominator d ∈ I with φ_(κ0)(d) = 0 versus ≠ 0 | First: undefined. Second: value in Frac(A) ⊗ Λ⁻ | Extension restricted to denominators outside ker φ_(κ0) |
| §5.10 weight-two reach | g of weight 2, p = 5 and p = 7 | Members of weight p + 1 = 6 and 8, both ≡ 2 mod p − 1, even, > 2 | Weight two covered through §5.3 at weight p + 1 |
| §5.10 p = 5 | Theorem 8 exception: projective image PGL₂(𝔽₅) with the cyclotomic character through ℤ/2 | Excluded by the Fujiwara instance among the hypotheses | No extra hypothesis needed |
| §2.15/§2.16 KLZ17 pages | page markers at lines 2316, 2366, 2487, 3074 | Def. 8.1.1 at line 2392 → p. 40; Prop. 8.1.7 at line 2488 → p. 42; Not. 7.7.1 at line 2340 → p. 39; Thm 10.2.2 at line 3096 → p. 52 | Locators replaced |
| §2.19 LZ14 convention | K/F with Gal = ⟨g⟩ | y(x^g) = Σ x^(σg)[σ⁻¹] = [g]Σ x^τ[τ⁻¹], with τ = σg | Matches LZ14 line 428; FW's inverse-action remark stands |

## Notes for the maintainer

- **Ownership.** No new construction was added. β and (NV1)/(NV2) were already owned here, and §5.10's new citation of PadicFamilies is to an existing supplier.
- **Names.** No Lean names changed.
- **HeegnerPointEulerSystems.** It cites §§5.3 and 5.10. §5.3 is now stated only for weight κ0 > 2 and p ≥ 5, and the weight-two application goes through §5.10.
- **RankOneConverse.** If it is accepted and readable, it can be added back as a consumer of §2.22.
- **p = 5 is not printed by Wan.** It rests on the proof of Wan-2015 Theorem 86 and on BCS's reading of it. The BCS §1.5 statement that Wan assumes p > 3 does not match Wan's printed p > 5; the README now gives both locators.
