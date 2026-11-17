# Review of LogPluricanonicalForms (pull request #2122 at 127e224)

**Verdict:** accepted

No finding. This is an incremental re-review of the 135 lines changed since `3d4fd65`.

## Previous findings

- R01 — repaired: `negLogKodaira_of_general_fiber` concludes `∃ U : Y.Opens, U ≤ V ∧ (U : Set Y).Nonempty ∧ …`; `VeryGeneral` and the former §4.2 are deleted; §4.2 route "splits on `NegLogKodaira X hE`"; *Needs:* "§§2.2 and 4.1".
- R02 — repaired: §1.1 "`IsStrictNormalCrossings D` holds if and only if `X`, its structure morphism and `D` form an `AdicSpacesPartIV.SmoothPair.AlgebraicSmoothPair ℂ`"; contract "### From TauCetiRoadmap.AdicSpacesPartIV"; Scope and *Needs:* cite R4.7.
- R03 — repaired: §1.1 "apply Lemma 41.21.3, Tag 0CBP, to the coordinate hyperplanes of `𝔸ⁿ` … Morphisms Lemma 29.37.15, Tag 02GU, pp. 80–81"; both added to Conventions and References.
- R04 — repaired: §4.1 Check "`E = C × {0, 1, ∞}`, `ω_X(E) ≅ pr₂*𝒪(1)`. Pull back a section of `H⁰(ℙ¹, 𝒪(1))` vanishing at `2`".
- R05 — repaired: Conventions "defined for every smooth complex scheme; the rational comparison of §2.1 assumes `X` integral".
- R06 — repaired: Scope "is stated without a Kodaira-dimension function".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Headline `negLogKodaira_of_general_fiber` (§4.2) | `X` negative; `ℙ¹×Y→Y`, `E=⊤`; elliptic product, `E=C×{0,∞}`; `Y` a point; `V=∅` | `X` negative: `U=V`, nonempty by `hV`. Ruled: `h⁰(pr₁*𝒪(−2m)⊗pr₂*ω_Yᵐ)=0`. Elliptic: `s=(dz/z)∧η≠0`, `U=ℙ¹∖{0,∞}`, fibers have `η≠0`, premise false. Point: `F≅X`. `V=∅` excluded by `hV` | True |
| Open form ⇒ very-general form (§4.2, last route sentence) | `Z j := Uᶜ` at the pins | Scratch proof without `sorry`: `Uᶜ` closed, `≠ univ` since `U` nonempty; `range y ⊆ V ∖ ⋃ Uᶜ ⊆ U` | True |
| §4.2 route | one section versus one per degree | One nonzero `s` in one `m>0` gives `U_s` by §4.1; a negative fiber over `U_s` has `s|_F=0`, contradiction. No countable choice used | True; matches *Needs:* |
| §1.1 comparison with `AlgebraicSmoothPair ℂ` | `D=⊤`; `D=0`; `V(xy)⊂𝔸²`; `V(x²)⊂𝔸¹`; nodal cubic; non-closed point | `⊤`: empty `SNCData`, product `=⊤`; chart `r=0`. `0`: stratum `=X`, `dim=dim+1` fails; chart generator a nonzerodivisor. `V(xy)`: identity chart `n=r=2`. `(x²)`: not radical, no chart; not a product of distinct regular components. Nodal: irreducible at node, no two coordinate branches. Generic point lies in a closed point's chart | True in both directions |
| §1.1 locators | Tag 0CBP; Tag 02GU | stacks-0CBP lines 1201–1216: Lemma 21.3 of Étale Morphisms, pp. 26–27, smooth pullback of strict normal crossings. stacks-02GU lines 3626–3668: Lemma 37.15 of Morphisms, pp. 80–81, criteria (4) and (6) | Locators exact |
| §4.1 Check (`E = C×{0,1,∞}`) | degree of `ω_X(E)`; `σ` with `σ(2)=0` | `ω_X=pr₂*𝒪(−2)`, three fibers add `3`: `pr₂*𝒪(1)`. Fiber over `2` misses `E`: `E_F=⊤`, restriction `σ(2)·η=0`; over `y∉{0,1,2,∞}`: `σ(y)·η≠0` | True; `U` depends on `s` |
| Conventions versus Lean (former R05) | `#check @` on the 4 declarations | `logCanonical`, `pluriformSections`, `NegLogKodaira`: only `[Smooth (X ↘ Spec ℂ)]`. Headline: integral, smooth, proper `X`, `Y`; `f.IsOver`; `Smooth (f ∣_ V)`; `F` binders present | Agree; no lost binder |
| Padding probe | `simp`, `rfl`, `infer_instance`, `exact ⟨V, le_rfl, hV, by simp⟩`, `aesop` on the headline | All five fail (unsolved goals, or no instance) | No padding |

The rows of the previous review for the untouched statements (§1.2, §2.1, §2.2, §3.1, §3.2, §4.1 statement) stand as in the previous review, of `3d4fd65`.

- Gate (own run on this head): every check 0, `OK`. Dependency check: `depcheck: 243 roadmaps, 2549 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration: `lake env lean` on a scratch copy with `#check @` for the 4 declarations: `sorry` on the headline is the only warning of the original text.
- Source locators checked against the text (4): stacks-0CBP lines 1201–1216; stacks-02GU lines 3626–3668; openai-reverse-log-kodaira lines 64–76 (§1) and 220–224 (§2.2, p. 5).
- Declarations opened: Tau Ceti `SmoothPair.AlgebraicChart` (`TauCeti/AlgebraicGeometry/SmoothPair/AlgebraicChart.lean:45`, fields `le : r ≤ n`, `etale`, `ideal_eq`); AdicSpacesPartIV `SmoothPair.AlgebraicSmoothPair` (`TauCetiRoadmap/AdicSpacesPartIV/Suggested.lean:140`, on main); SchemeAndStackFoundations `IsStrictNormalCrossings` (`Suggested.lean:1007`, on main).
- Cross-roadmap citations resolved on main (4): SchemeAndStackFoundations §4.17; AdicSpacesPartIV R4.7 (README line 948, definition at 1253); AlgebraicVectorBundles §§3.2–3.3; PadicMeasuresIwasawaAlgebras §5.1. The one lead of the citation tool (`SmoothPair.AlgebraicSmoothPair` "found nowhere") resolves in AdicSpacesPartIV.
- Pull request text against this head: three definitions and `negLogKodaira_of_general_fiber`, the open-set form with the very-general consequence, and the four roadmap suppliers including AdicSpacesPartIV R4.7 are all as the head has them; no sentence contradicted, no change left unstated.
- Remarks, no change asked: (i) Tag 02GU's criteria assume the local map flat; for the coordinate map this is flatness of a local map of regular local rings of equal dimension with `m_s·𝒪_{X,x} = m_x`, a standard step the route does not name. (ii) Scope lines 33–34 still exclude "existence of complex points outside arbitrary countable unions"; true, and now relevant only to the very-general corollary.
- Overlap check: read AlgebraicVectorBundles (the only roadmap of the three closest-roadmap lists); shared object: the determinant of an extension, owner AlgebraicVectorBundles §3.2, cited here. `overlaps.md` lists no other overlap; the chart-cover structure is owned by AdicSpacesPartIV R4.7 and cited.
- Source independence: changed passages only; 7 passages compared with 2 sources (Stacks Project, openai-reverse-log-kodaira), none shared; largest share Stacks Project, 18 of 28 locators; contents not compared again (no layer added, removed or reordered).
- Research link: The headline is the `κ(F, K_F + E_F) = −∞` case of Theorem 1.1 of OpenAI, *The reverse logarithmic Kodaira inequality and additivity* (preprint, 2026), the upper bound complementary to logarithmic subadditivity; logarithmic forms as in Esnault–Viehweg (1992). Rests on the README Summary and openai-reverse-log-kodaira lines 58–76 and 220–224.

## Not verifiable

- The pull request's statements about its own validation run (a "preservation/interface/axiom probe", "368 merged/candidate roadmaps"): not reproducible from the head; this review's own gate and probe results are above.
- The `openai/math` family 033 Lean files: not opened; no target depends on them.

## Source issues

- none

## For the human reviewers

- **Scope.** The source of the headline (README References, line 394) is a 2026 preprint with author "OpenAI", read from a GitHub repository; no refereed publication of it was found. The other sources (Esnault–Viehweg 1992, Stacks Project) are standard.
- **Licence.** README lines 411–412 say "adapted code retains its original attribution and Apache 2.0 notices" for `openai/math` family 033; `Suggested.lean` carries no such notice, and those Lean files were not compared with it.
- **Authorship.** The pull request description states that an AI coding agent revised the prose and interfaces and prepared the review response at the author's instruction.
