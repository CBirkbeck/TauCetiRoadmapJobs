# Review of ShimuraVarieties (pull request #3027 at 7b5fe43)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 6 changed lines since `b8f3652`. The only change is the *Needs:* line of §7.3, which now names §7.5 (the marked conjugated datum). I checked that the dependency is real (the `A₁` comparison that §7.3 proves is Milne 1983's Theorem 1.1 for the rank-one datum, whose target is the twisted datum of Remark 1.4, which §7.5 constructs), that it closes no cycle (nothing §7.5 needs leads back to §7.3), and that the description's sentences about this roadmap agree with the head. Accepted: no finding, no small correction, two format notes, neither blocking; nothing is left for a human to decide.

## Previous findings

- The previous review of this folder (at `6f088b9`) raised no finding; the folder has not changed since, so nothing is carried over. Its format note is kept below as N01.

## N01 — The link line under §7.3 does not link §7.5, which the corrected *Needs:* line now names

The "This uses" line after the Checks of §7.3 (line 2139) lists §7.2, §P.1 (twice), ReductiveGroups Layer 7 and §6.7 only. A link to [7.5 Marked conjugated Shimura datum](#75-marked-conjugated-shimura-datum) would bring it into line with the *Needs:* line at line 2128. (It also lacks §§5.10, 5.11 and 6.2, as it did on `main`.)

## N02 — §7.3 now names a section that comes after it in the layer

With the corrected line, §7.3 needs §7.5 while §7.5 needs only §§P.1, P.3, 6.3, 7.0a, 7.0b and 7.1, so the order is sound but a reader who builds Layer 7 in the printed order meets the `A₁` comparison before the datum it is stated with. A clause in §7.3 would help, for example "the comparison is stated with the conjugated datum of §7.5, which does not depend on this section". No section needs to move.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §7.3 *Needs:* names §7.5 (changed line) | Theorem 1.1 for `H′_α` of type `A₁`; `G=SL₂`, `T` norm-one torus of `ℚ(i)` | target of the comparison is `M⁰({}^τG,{}^τX⁺)` (milne-1983a lines 81–86), built in Remark 1.4 (lines 93–108) = §7.5's twist | dependency is real | — |
| Acyclicity of §7.3 → §7.5 | closure of §7.5's *Needs:* | {P.1, P.3, 6.3, 7.0a, 7.0b, 7.1} → {6.4, 6.5, 6.6, earlier layers, suppliers}; Layers 0–6 cite no §7.x; §7.3 absent | no cycle | — |
| §7.3, `A₁` comparison "from CM" with §§5.10, 5.11, 6.2, 6.7 | Remark 1.5 | symplectic case from a CM statement; type `A` embedded in a symplectic group; Lemma 1.6 passes to subgroups (milne-1983a lines 114–131) | *Needs:* matches the route | — |
| §7.5 Check, `SL₂`, `τ` complex conjugation | `μ_h(z)=diag(z,1)` in `PGL₂` | `τμ_h=μ_h⁻¹`; `τμ_h(−1)/μ_h(−1)=diag(−1,1)⁻²=1`; class trivial, twist split; `μ_h⁻¹` fixes `−i` | Check holds | — |
| §7.5 Check, `τ=id` | trivial torsor | `S×^S G=G`; `τμ_h/μ_h=1`; adelic map the identity | Check holds | — |
| §7.5 marked torus rigidity | `Aut(G,i)` | `T/Z(G)=T^ad` (milne-1983a lines 93–94), so twisting by `ρ_h:S→T^ad` fixes `T` pointwise | matches "`T` is unchanged" | — |
| §7.3 roots "noncompact at some real place" | `SL₁(B)/ℚ(√2)`, `B` split at one real place only | root compact at one place, noncompact at the other: not totally compact (milne-1983a lines 469–474) | matches §7.3 and its first Check | — |
| §7.4 (cites §7.3), `Z(G)=∩Z_α` | `SU(2,1)`, `T=diag(t₁,t₂,t₃)`, `det=1` | noncompact roots `±(e₁−e₃)`, `±(e₂−e₃)`; common kernel `t₁=t₂=t₃`, i.e. `μ₃=Z(SL₃)` | agrees with Prop. 4.3 (lines 477–483) | — |
| §7.2 (seeded; cited by the changed line) | `T₁` anisotropic at every real place | conjugation acts by `−1` on `X*(T₁)`, so it splits over a CM field; pass to its maximal totally real subfield (milne-1983a lines 553–562, 667–674) | supported; the p.260 locator holds | — |
| §7.8, §7.10 (cite §7.3 and §7.5) | their *Needs:* lines | both already list §7.3 and §7.5 separately; statements unchanged | consistent with the new line | — |
| Description: "ShimuraVarieties §7.3 (adds its §7.5)", "changed in these lines only" | folder diff | one hunk, 3 insertions and 3 deletions, at the *Needs:* line of §7.3; 0 headings, 0 declarations changed | true | — |

- **Record.** The README at the merge base and at this head have the same 9 layers and the same headings; no item is removed and no statement changed; `Suggested.lean` is unchanged.
- **Sources.** 6 locators read against the text, all in milne-1983a: Theorem 1.1 and Remarks 1.4–1.5 with Lemma 1.6 (lines 74–131), §4 conditions and Prop. 4.3, Cor. 4.4 (lines 455–488), the reduction in §5 (lines 552–571) and in §6, p.260 (lines 667–674).
- **Cross-roadmap citations.** The changed line cites ReductiveGroups Layer 7 only, as it did on `main`; that roadmap's heading is present at this head.
- Overlap check: read ShimuraCompactifications, HilbertModularVarietiesAndShimuraCurves, ShimuraData (on main) and ShimuraVarietiesPartII (open); nothing shared: the marked conjugated datum and the type-`A₁` subdata are owned here only. No open pull request changes this roadmap or drops an id it cites.
- **Dependency check:** `depcheck: 129 roadmaps, 1449 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Automatic checks:** all passed on this head, including the targeted build.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 27 warnings, all `declaration uses sorry`, and no error; `import Mathlib` plus one Tau Ceti module; no `set_option`. The file is unchanged since the round that compared each declaration with `#check @`.
- **Outside the folder:** every file the pull request changes lies in a roadmap folder (or family index) that is the pull request's own.
- Source independence: changed passages only; 1 passage compared (the new *Needs:* line of §7.3) with 1 source (milne-1983a, Remarks 1.4–1.5), none shared; largest share milne-svi, about 90 of about 200 locators; contents not compared again, since no layer is added, removed or reordered.
- Research link: Layer 7 is Milne's 1983 proof of Langlands's conjugation conjecture, which yields canonical models for every Shimura datum; it rests on Milne–Shih 1982, Deligne's theorem on CM abelian varieties, and Borovoi's and Kazhdan's methods (README Layer 7; milne-1983a §§1, 4–7).

## Not verifiable

- Milne–Shih 1982 (cited in an untouched sentence of §7.3 and in §7.5) is not in the sources cache and was not read this round; the changed line cites no source.
- The other targets of the seeded sample (1.3, 2.4, 3.4b, 4.9b, 4.10, 5.5, 5.10, 5.13, 7.0, 7.0a, 7.0b, 7.0f, 7.0g, 8.9) lie outside the changed and affected passages and were not read against the sources again; 5.10, 7.0a and 7.0b enter only as suppliers named by unchanged statements.
- Platonov–Rapinchuk 1979 and 1994, Clozel 1986 and van den Dries–Miller 1994 are recorded as uncertified and were not read; the changed line cites none of them.

## Source issues

- none

## For the human reviewers

- none
