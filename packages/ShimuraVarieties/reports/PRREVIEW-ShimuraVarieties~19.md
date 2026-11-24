# Review of ShimuraVarieties (pull request #3027 at 6f088b9)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 6 changed lines since `b8f3652`. The only change is the *Needs:* line of §7.3, which now names §7.5 (the marked conjugated datum). That dependency is correct: the `A₁` comparison §7.3 proves is Milne 1983's Theorem 1.1 for the rank-one datum, and its target is the twist that §7.5 constructs. It also creates no cycle, because §7.5 depends only on §§P.1, P.3, 6.3, 7.0a, 7.0b, 7.1 and earlier layers. I checked §7.5 (a seeded target that the changed line cites) against Milne 1983 and Milne–Shih at its locators, and read the description's three sentences about this roadmap against the head; both hold. No finding and one non-blocking format note; nothing is left for a human to decide.

## Previous findings

- The previous review of this folder (at `314489c`) raised no finding, so nothing is carried over.

## N01 — The link line under §7.3 does not link §7.5, which the corrected *Needs:* line now names

The link line after the Checks of §7.3 (line 2139) still lists only §7.2, §P.1 (twice), ReductiveGroups Layer 7 and §6.7. A link to [7.5 Marked conjugated Shimura datum](#75-marked-conjugated-shimura-datum) would bring it into line with the *Needs:* line at line 2128. The line also lacks §§5.10, 5.11 and 6.2, and was already missing them on `main`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.3 *Needs:* now names §7.5 (changed line) | `G′=SL₂/ℚ(√2)`, `T′` norm-one torus of `ℚ(√2,i)`, `α` noncompact at both places | `H′_α=G′`; target of the `A₁` comparison is `{}^{τ,h}H`, the twist of milne-1983a line 101–108 = §7.5 | the dependency is real | — |
| Acyclicity of §7.3 → §7.5 | closure of §7.5's *Needs:* | closure from §7.5 = {P.1, P.3, 6.3–6.6, 7.0a, 7.0b, 7.1}, and 6.3 uses 1.2, 3.5, 4.4; §7.3 is not in it | no cycle | — |
| §7.5 Check, `G=SL₂`, `τ` complex conjugation | `T` norm-one torus of `ℚ(i)`, `h(a+bi)=[[a,−b],[b,a]]` | `τμ_h=μ_h⁻¹`; real class `μ_h(−1)⁻²=diag(−1,1)⁻²=1` in `PGL₂`; inverse cocharacter fixes `−i`, the lower half-plane | Check holds; matches milne-1983a line 518–520 | — |
| §7.5 at `τ=id` | trivial torsor | contracted product `S×^S G=G`, adelic map identity | Check holds | — |
| §7.5 construction against the source | Milne–Shih p.281; milne-1983a Remark 1.4 | `{}^{τ,μ}G` is the contracted product of the Taniyama torsor with `G` (Milne–Shih p.281); `Aut(G,i)=T/Z(G)` (milne-1983a line 93–94) | locators support the statement | — |
| §7.3 roots "noncompact at some real place" | `SL₁(B)` over `ℚ(√2)`, `B` ramified at `σ₂` only | `α` compact at `σ₂`, noncompact at `σ₁`; in the set of roots that are not totally compact (milne-1983a line 469–474) | matches §7.3 and its first Check | — |
| §7.4 (cites §7.3), `Z(G)=∩Z_α` | `SU(2,1)`, compact torus `diag(t₁,t₂,t₃)` | noncompact roots `±(e₁−e₃)`, `±(e₂−e₃)`; `∩Ker = {t₁=t₂=t₃}`, `det=1` ⇒ `μ₃=Z(SL₃)` | consistent with milne-1983a Prop. 4.3 | — |
| Description: "ShimuraVarieties §7.3 (adds its §7.5)" and "changed in these lines only" | folder diff | one hunk, 3+/3−, at the *Needs:* line of §7.3; no heading or declaration changed | true | — |
| Description: "ShimuraVarieties §5.1 (CM types) becomes a supplier" | AdelicHeightsAndSuccessiveMinima, `ℚ(i)`, `Φ={id}`; `ℚ` | its `IsCMType` (`conj τ ∈ Φ ↔ τ ∉ Φ`) and §5.1's partition condition: `{id}` passes both; `ℚ` has none in both | the interface matches §5.1 (README line 1350) | — |

- **Record.** The README at the merge base and at this head have the same 9 layers and the same headings; the change removes no item and changes no statement; `Suggested.lean` is unchanged.
- **Sources.** 7 locators read against the text: milne-1983a Remark 1.4 and 1.5 (lines 93–131), §4 (lines 455–488), Prop. 5.2 (lines 512–534) and the Appendix (lines 753–789), and Milne–Shih Introduction p.281 and its table of contents (§9). Milne–Shih 1982 is cited by the README but not recorded in its sources manifest; I read it from its author's page.
- **Cross-roadmap citations resolved:** AutomorphicBundles cites §§7.1–7.3, 7.5 and 7.8 as its supplier (its README lines 932–995); AdelicHeightsAndSuccessiveMinima cites §5.1.
- **Overlap check:** I read the scopes of ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves and ShimuraData (on main) and ShimuraVarietiesPartII (open). None of them owns the marked conjugated datum or the type-`A₁` subdata: ShimuraVarieties owns them, and AutomorphicBundles cites them. No open pull request changes this roadmap or drops an id it cites.
- **Dependency check:** `depcheck: 2 roadmaps, 20 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Automatic checks:** every one passed on this head, including the targeted build.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 27 warnings, all `declaration uses sorry`. The file has one module import besides `Mathlib` (a Tau Ceti module) and no `set_option`. It is unchanged since the round that compared each declaration with `#check @`.
- **Outside the folder:** every file the pull request changes lies in a folder this review names as the pull request's own.
- Source independence: changed passages only; 1 passage compared (the new *Needs:* line of §7.3) with 2 sources (milne-1983a Remarks 1.4–1.5, Milne–Shih p.281), none shared. The largest share is milne-svi, about 93 of about 200 source mentions. The contents were not compared again, because no layer was added, removed or reordered.
- Research link: Layer 7 is Milne's 1983 proof of Langlands's conjugation conjecture for all Shimura varieties, which gives canonical models in general. It builds on Milne–Shih 1982, Deligne's CM theorem, and the work of Kazhdan and Borovoi (README Layer 7; milne-1983a lines 14–23).

## Not verifiable

- **The rest of this round's seeded sample** (0.1, 1.1, 3.2, 3.8, 4.2, 4.5, 5.5, 6.1, 6.3, 7.0, 7.0c, 7.8, 7.14, 8.20): these fall outside the changed and affected passages, so I did not read them against the sources again. 6.3 enters only as a supplier of §7.5, and 7.8 only as a consumer of §§7.3 and 7.5, whose statements are unchanged.
- **Platonov–Rapinchuk 1979, Clozel 1986 and van den Dries–Miller 1994** (`uncertified`) were not read; none is cited by the changed line.

## Source issues

- none

## For the human reviewers

- none
