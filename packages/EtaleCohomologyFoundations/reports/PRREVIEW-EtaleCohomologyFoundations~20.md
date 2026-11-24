# Review of EtaleCohomologyFoundations (pull request #3027 at e47c8ec)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 10 lines changed since `4b01d78`: four `*Needs:*` lines (étale topological invariance in §F.0.1, §F.0.A1, §F.0.A0 and §F.6) now cite sections of SchemeAndStackFoundations, AlgebraicCurves and BelyiMaps where they cited whole layers. Each cited section exists on main and contains what the line says of it, and the four lines are word for word those of the README on main, which the branch merged. No finding and no small correction; one format note, carried from the previous review, not blocking. One fact about the sources of §F.2.5a is left for the human reviewers, as before.

## N01 — The list of consumer roadmaps does not name DeligneLusztigTheory, which the bullet below it does

The sentence "The consumer roadmaps include …" (README line 2315) lists ReductiveGroups and FiniteReductiveGroups but not DeligneLusztigTheory, although the bullet at line 2323 gives it as a consumer of §F.2.5a. The list says "include", so nothing is false; adding the name would keep the two in step.

## Previous findings

- N01 (format note; the previous report had no finding and no small correction) — not repaired: line 2315 still omits DeligneLusztigTheory, which line 2323 names as a consumer of §F.2.5a. Written again above as N01.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §F.0.A1, decomposition and inertia (its `*Needs:*` line changed) | `z ↦ z^n` on `𝔸¹`, characteristic 0, `G = μ_n`; point over 0 and over 1 | over 0: one point, `e = n`, `f = 1`, `\|D\| = ef = n`, `\|I\| = e = n`; over 1: `n` points, `D = I = 1` | agrees with the Check and with AlgebraicCurves §8.6 (`\|I\| = e·f_ins`, `f_ins = 1`) | none |
| §F.0.A1, the inseparable control | `A = 𝔽₂(u)[[t]]`, `α² − tα − u = 0` | `e = 1`, `f = f_ins = 2`; §8.6 gives `\|I\| = e·f_ins = 2 = \|C₂\|`, not `e = 1` | separability hypothesis needed, as stated | none |
| §F.0.A0, change of root system (its `*Needs:*` line changed) | `ζ ↦ ζ^u`, `u ∈ ẑ^×`, `a ∈ ẑ` | `e_(ζ^u)(a) = (ζ_n^{ua}) = e_ζ(ua)`; `[u⁻¹]c_ζ(e_ζ(ua)) = u⁻¹·ua = a = c_(ζ^u)(e_(ζ^u)(a))` | both identities hold | none |
| §F.0.1, topological invariance (its `*Needs:*` line changed) | absolute Frobenius of `Spec 𝔽_p[t]`; the non-example `Spec 𝔽_(p²) → Spec 𝔽_p` | Frobenius: integral, bijective, purely inseparable residue maps, so `π₁` iso; the non-example is not universally injective (fibre product has 2 points), `π₁`: `2ẑ ⊂ ẑ` | hypothesis used, not vacuous | none |
| §F.6 `*Needs:*` (changed) | the parenthesis against SchemeAndStackFoundations §§5.1–5.5 | 5.1 Chow groups, 5.2 proper pushforward, 5.3–5.4 Chern classes, 5.5 normal cone and `normalBundle` | matches | none |

The rows for the untouched statements stand as in the previous review, of `4b01d78`.

- Diff since `4b01d78`: four `*Needs:*` lines of `README.md` (5 insertions, 5 deletions); `Suggested.lean` unchanged; no statement, heading or layer changed. Against main the folder's difference is unchanged (101 insertions, 6 deletions, 0 headings removed, 2 added): the four lines equal main's.
- Cross-roadmap citations resolved on main (identical at this head): 12. SchemeAndStackFoundations §0.20 (Japanese and Nagata rings), §0.23, §0.23a, §0.29, §0.30 (normal schemes, codimension-one points, ramification at a point), §2.1 (`Sheaf.H.pullback`, README lines 4097–4101, and the small étale site), §§5.1–5.5; AlgebraicCurves §8.6, §§12A–12C; BelyiMaps §§12.5, 12.6 and Layer 13.
- Source locators checked: 0; the changed lines cite no source. Library declarations opened: 1 (`AlgebraicGeometry.Scheme.Hom.normalization`, Mathlib `AlgebraicGeometry/Normalization.lean`, the normalisation §F.0.A1's route uses, which the narrowed line no longer covers through "Layer 0" and need not).
- Seeded sample: none of its targets lies in the changed lines.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`.
- Elaboration: `lake env lean` of `Suggested.lean` gave six `declaration uses 'sorry'` warnings and nothing else.
- The pull request's text: its sentence on this roadmap (§F.2.5a over every algebraically closed field, §F.10.4a for quasi-projective schemes) matches the head. The four narrowed lines are main's own text and not a change of this pull request against its base, so the description need not state them.
- Overlap check: read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, AdicCoefficientsAndComparisons on main; nothing shared beyond what the previous review recorded (SchemeAndStackFoundations §1.17 owns projective quotients by finite groups; this roadmap owns the compact-support quotient formula and free-action perfectness). No other open pull request changes this roadmap.

Source independence: changed passages only; 4 passages (the four `*Needs:*` lines) compared with 0 sources, since they cite none and state no source's result; the arrangement was not compared, as no layer was added, removed or reordered.

Research link: the roadmap builds the foundations that Deligne's Weil II (1980) rests on, from SGA 4, SGA 4½ and Bhatt–Scholze (2015). §§F.2.5a and F.10.4a are cohomological inputs of Deligne–Lusztig character theory (Deligne–Lusztig 1976), and §F.10.4a is Theorem 3.2 (b) of Illusie–Zheng (2013). This rests on the README's references and illusie-zheng-odds-and-ends lines 796–818.

## Not verifiable

- SGA 4½ [Th. finitude] §§1–2, the locator of §F.3's finiteness, which §F.10.4a uses: settled as uncertified, no text held (untouched by this change).
- The published version of Illusie–Zheng (Int. Math. Res. Not. 2013) is behind a paywall; an earlier review read arXiv v3, the version the README links.

## Source issues

- none

## For the human reviewers

- §F.2.5a's cohomological clause (README lines 1708–1715) is stated over every algebraically closed field. Its one locator, Dudas–Michel's 2015 lecture notes (dudas-michel-2015, an author's page, not refereed), covers only `𝔽̄_q`. The general case rests on the section's own route.
