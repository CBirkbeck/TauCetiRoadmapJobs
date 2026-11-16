# FIX-RT-RationalAnalyticPrismatization~1

Repair of the findings of the red-team reviews `RT-RationalAnalyticPrismatization~1a` (eight findings) and `RT-RationalAnalyticPrismatization~1b` (ten findings). Files changed: `packages/RationalAnalyticPrismatization/README.md`, `packages/RationalAnalyticPrismatization/Suggested.lean` (module docstring only) and `packages/RationalAnalyticPrismatization/design/plan.json` (top-level `gaps` list only: the `nuclear-modules` entry narrowed; all 21 entries kept, none added, nothing else changed). `metadata.toml` and `sources.toml` are unchanged: every new locator is in a source the manifest already records (ALRS, ABLB, Gest, FS, RJRC22). No section, layer or target was renumbered or removed. Overlapping findings are settled once, in the first section that names them. Further places where the same defect was repaired are listed after the findings.

## RT-RationalAnalyticPrismatization~1a/F01, RT-RationalAnalyticPrismatization~1b/F04 (P2) — applied

Both witnesses hold (10.6/10.12(1); 12.3(3), ALRS line 8881). In the Suggested.lean docstring:

- "0-proper with fully faithful pullback" → "0-proper with pullback fully faithful on modules over `O^la_X = h_* O`".
- "`f^{Div¹,!} O ≅ O{d}[2d]`" for every rigid smooth f → the base change to `FF_{X^⋄}` has dualizing complex `O{d}[2d]`, and `f^{Div¹,!}O ≅ O{d}[2d]` when X is smooth partially proper over ℚ_p.

10.12 gets the closed-disc Check.

## RT-RationalAnalyticPrismatization~1a/F02 (P2) — applied

The witness holds: AnalyticStacks §4.3 states the Hom criterion (its opening) and part (1) (ABLB Lemmas A.0.7–A.0.8, ABLB line 6789, line 6795); closure and "ω₁-compact = basic" (ABLB Lemma A.0.6, ABLB line 6781) are RefinedTraceMethods §4.3, as README:73 says. In `plan.json`, `nuclear-modules`: `needs` → the reviewer's sentence; `section` "§4.3(1)–(2)" → "§4.3 (opening and (1))"; `detail` moves Lemma A.0.6 to RefinedTraceMethods §4.3.

## RT-RationalAnalyticPrismatization~1a/F03 (P2) — applied

FarguesFontaineDiamonds F2 has no properness statement. In the 12.2 route, "(FS Proposition II.1.21; FarguesFontaineDiamonds §F2)" → "(ALRS line 8759–8761), by the properness of Div¹ → ∗ (FS Proposition II.1.21, FS line 2133; VectorBundlesAndIsocrystals Layer 5, “Effective divisors and projective sections”, the case d = 1)". The 12.2 *Needs:* line and the Layer 12 Dependencies change likewise, and the VectorBundlesAndIsocrystals contract names this properness.

## RT-RationalAnalyticPrismatization~1a/F04 (P3) — applied

(a) §R07.P7.2 has no formula log ρ(γ)/log χ_p(γ). The 11.2 Check now reads "the labelled Sen operator of §R07.P7.2, in which χ_p has weight +1, so that both give 1 on C_p(1)". (b) PadicHodgeTheory §5.1 imports the theorem, so "PadicHodgeTheory §5.1" → "for Galois representations, de Rham implies potentially semistable, NoncommutativeAndEquivariantIwasawa §F.6" (on main).

## RT-RationalAnalyticPrismatization~1a/F05 (P3) — applied

The witness holds: ℚ_p is not finitely generated over ℤ_p. In the 10.2 route, "ℚ_p has a finite free resolution over `ℤ_{p,■}[Π_0]`" → "ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module, the hypothesis (for uniform Π_0, Lazard–Serre with p inverted, RJRC22 Theorem 5.7; for Π_0 trivial, perfect over ℚ_p although it has no finite free ℤ_p-resolution)".

## RT-RationalAnalyticPrismatization~1a/F06 (P3) — applied

By 8.2 (ALRS line 2969–2972), `X^{Div¹~}` = lim_φ X^Δ. In the Conventions and in 8.2, "Div¹~ = `(Q_p^Δ)^{Div¹~}`" → "Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ". These are the only two occurrences.

## RT-RationalAnalyticPrismatization~1a/F07, RT-RationalAnalyticPrismatization~1b/F05 (P3) — applied

Neighbourhoods of the Gauss point meet |T| < 1 and |T| > 1. The 4.7 Check now glues P¹ from `GSpec(ℚ_p⟨pT⟩_{≤1})` = {|T| ≤ p} and {|1/T| ≤ p} along the †-rational annulus p⁻¹ ≤ |T| ≤ p; the open sets {|T| < p} and {|T| > p⁻¹} cover P¹. The closed unit discs become a non-example. These open sets are not the discs' interiors, which are larger.

## RT-RationalAnalyticPrismatization~1a/F08, RT-RationalAnalyticPrismatization~1b/F10 (P3) — not actionable in this package: the plan's targets name all 20 slugs, and only the `gaps` list may be edited

Both witnesses hold: 0.2–0.5 state the two `supplier: none` gaps here, and AnalyticStacks' head states the 18 others (its Downstream consumers note maps each slug to a section). But targets 1.1–12.2 of `plan.json` list every slug as a `gap:` prerequisite. Removing an entry that a target names breaks the plan, and the targets are outside the editable `gaps` list. All 21 entries therefore stay.

Option B of 1b/F10 is not taken. A "What AnalyticStacks must provide" line would declare as owed an item that AnalyticStacks already states. The README already cites each such section under its AnalyticStacks contract. There is no supplier to name in a contract line for `supplier: none`.

Retiring the 20 entries means editing the targets' prerequisites at the design stage.

## RT-RationalAnalyticPrismatization~1b/F01 (P2) — applied

The witness holds (Gest line 960, line 1713–1714). In 0.1, StRing is the colimit "formed in 1Pr, that is, in κ-presentable ∞-categories and colimit-preserving functors, equivalently the limit of ∞-categories along the right adjoints". The text adds that StRing is not the union (third Check of 0.2). The Proposition 6.2 clause is made equally precise (Gest line 1751–1752).

## RT-RationalAnalyticPrismatization~1b/F02 (P2) — applied

Gest Proposition 9.3 for C_{/X} (Gest line 3020, line 3041) characterizes `K_{D,X} ≅ Mod_{D(X)}(1Pr)`. 0.5 now:

- assumes the slice Künneth formula and concludes `K_{D,X} ≅ Mod_{D(X)}(1Pr)`;
- says the condition is necessary;
- gives the slice argument in its route;
- states its law as an "if and only if".

The affinoid Check and the 2.2 route name AnalyticStacks §2.3(7) as the slice hypothesis.

## RT-RationalAnalyticPrismatization~1b/F03 (P2) — applied

ABLB line 2269–2271 and ALRS line 661–670 give the inverse image as GelfStk^qfd → GelfStk. The 2.1 law "the restriction GelfStk → GelfStk^qfd is the inverse image" → the inverse image sends GSpec(A) to GSpec(A), the direct image is restriction to separable qfd rings, and the inverse image is not claimed fully faithful.

## RT-RationalAnalyticPrismatization~1b/F06 (P3) — applied

The EnhancedDerivedSheaves contract (sentence and "Sections consumed") gains §E0.8, §E5:presentability.1 and §E5:presentability.2, all on main. AnalyticStacks §2.1 (CondAni) is added to:

- the Betti bullet;
- "Sections consumed";
- the 2.5 *Needs:* line;
- the Layer 2 Dependencies.

A script comparison of all *Needs:* lines with the "Sections consumed" lists finds no other miss.

## RT-RationalAnalyticPrismatization~1b/F07 (P3) — applied

PrismaticCohomologyPartII §3.8 has the divided limit, and §3.11 has e_A with φ(e_A) = `[p]_q^{-1}`e_A. Changes:

- the 9.8 route: "§3.9" → "§§3.8–3.9";
- the 9.8 Check: "[p]_q·φ(e) = e of §3.9" → "φ(e_A) = `[p]_q^{-1}e_A` … §3.11";
- the comparison-partner line, the Scope line and the Layer 9 Dependencies add §3.8 and §3.11.

## RT-RationalAnalyticPrismatization~1b/F08 (P3) — applied

log_Δ is additive (PrismaticCohomologyPartIII §6.10). The 9.9 Check now adds that log_Δ(q^p) = p(q − 1)e, so e_A corresponds to p·e, and that q itself is not in the integral domain (q^p − 1 = (q − 1)[p]_q). The 9.8 Check adds that φ(x) = `[p]_q^{-1}`x fixes a generator only up to ℚ_p^×.

## RT-RationalAnalyticPrismatization~1b/F09 (P3) — applied

- "bounded affinoid" (1.7, 4.2) → "bounded solid ℚ_p-algebra (1.1)" (ABLB line 609, line 1828).
- "weakly representable in arc-diamonds" is defined in 4.8 (ALRS line 10104–10106).
- "smoothoid" is defined in 9.5 (AdicEtaleGeometry §A2.4, added to *Needs:*; ALRS line 3667).
- "pro-Berkovich-étale" is defined in 12.1 (ALRS line 8652). Its Check uses 4.2: open immersions are rigid étale, hence Berkovich-étale.

## Other places repaired (same pattern)

- **1a/F01 and 1b/F04, headlines stated without their hypotheses.**
  - In the Suggested.lean docstring:
    - §11.7 is now "for X as in the previous item".
    - Hodge–Tate names X = GSpec(K), X rigid smooth over a perfectoid space, and X smooth rigid over K.
    - Torsors are for smooth rigid X over ℚ_p.
    - Poincaré duality is for smooth proper maps of smooth partially proper rigid spaces over ℚ_p.
    - The projective bundle formula is for every Gelfand stack X and d ≥ 1.
    - Riemann–Hilbert is for smooth rigid X over ℚ_p.
  - In the README, the Summary's duality clause carries the hypotheses of 12.2–12.4.
  - In 10.12:
    - a new Check: G trivial, X the closed unit disc, End(1) = ℚ_p on `|X|^Betti` against ℚ_p⟨T⟩ on X;
    - the first Check now says "(1) is 2.7".
- **1b/F03, the direction of a geometric morphism.** The 2.8 Check "not the inverse image of a geometric morphism into GelfStk" now names GelfStk → `ArcStk_{ℚ_p}` and, on the slice, the morphism from the slice to `ArcStk_{ℚ_p}` (ABLB line 2737–2742). 3.2 and 7.3 already use the correct direction.
- **1a/F04 and 1b/F07, citations of sections that do not make the statement.** All other PrismaticCohomologyPartII citations in the README were reread at its head; they hold.

## Checks run

- **Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean` from the content checkout ran with exit 0 and no output, both before and after the gate repair. The file imports Mathlib only and has no declarations.
- **`#check @name` comparison.** Not run. The file declares nothing, so the scratch file would be empty, and no Lean name changed.
- **Dependency check.** Output after the gate repair: `depcheck: 259 roadmaps, 2477 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The new edges point down or to main: VectorBundlesAndIsocrystals (earlier in the merge order), and NoncommutativeAndEquivariantIwasawa, EnhancedDerivedSheaves and AdicEtaleGeometry (on main).
- **`roadmaps resolve`.** The only lead is the one already known, MotivesAndAlgebraicCyclesPartII Layer 0, which is a board package and not a pull request. No Lean name is unresolved.
- **README scanners** (process residue, LaTeX, pull-request numbers, private paths) report nothing, on both files. No `_{` or `^{` appears outside code spans in the added lines.
- **Gate failure: `plan.json` removed 20 gaps that targets still name.** `plan.json` was restored from the branch head, so all 21 `gaps` entries are back unchanged except `nuclear-modules` (1a/F02). `git diff` of `plan.json` now touches only that entry's `detail`, `needs` and `section`. 1a/F08 and 1b/F10 are re-settled as not actionable in this package.

## Adversarial pass on changed statements

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.1 StRing colimit | ⋃_n A^n over D(k) | has relative algebras at every level, so it lies in the limit; not n-affine over the unit for any n, by left cancellation over D(k) | union reading false | colimit placed in 1Pr |
| 0.5 slice Künneth | affinoids; R = 0; finite sets {1,2}; P¹/k | §2.3(7) holds; zero ring; `∏_i D(Λ)^{Y_i×Z_i}` = D(Y ×_2 Z); D(P¹) ≠ Mod_k | first three 0-affine, P¹ not | hypothesis added |
| 0.5 necessity | 0-affine [X]_D | B_2 = Mod_{(B/A)_1}(A_2) = Mod_{D(X)}(1Pr) ⇒ Prop 9.3 on C_{/X} | iff holds | law now "iff" |
| 2.1 direction | GSpec(A), A qfd | α^*GSpec A = GSpec A; α_* is restriction, a right adjoint | ok | law restated |
| 2.8 X̂ | Marc(ℚ_p) | X̂ ≠ GSpec(ℚ_p), so not left exact into GelfStk | ok | wording |
| 4.7 P¹ | Gauss point ζ, ∞ | |T|_ζ = 1 ∈ (p⁻¹, p); ∞ ∈ {|T| > p⁻¹}; closed unit discs miss ζ's neighbourhoods; deg Ω¹ = −2 | ok | cover replaced |
| 9.8 generator | e′ = c·e, c ∈ ℚ_p^× | φ(e′) = `[p]_q^{-1}`e′ | does not determine c | sentence added |
| 9.9 factor p | p = 2: q² − 1 = (q − 1)[2]_q | log_Δ(q^p) = p(q − 1)e = (q − 1)e_A ⇒ e_A ↔ p·e | ok | Check extended |
| 10.2 route | Π_0 = 1; Π_0 = ℤ_p | ℚ_p perfect over ℚ_p, no finite free ℤ_p-resolution; `0 → ℤ_p[[T]] →T ℤ_p[[T]] → ℤ_p → 0` | ok | route fixed |
| 10.12 new Check | G = 1, X = closed disc | End(1) = C^lc(|X|) = ℚ_p; End(O_X) = ℚ_p⟨T⟩ | h^* not f.f. on all | Check added |
| 11.2 Check | C_p(1), C_p(−1) | Sen operator 1, −1 (§R07.P7.2; PadicHodgeTheory §4.4: r on e_r) | ok | formula dropped |
| 12.1 pro-B-étale | open disc ⊂ closed disc; identity; T = 0 | {|T| ≤ p^{−1/n}} Berkovich-étale; B = A; L = ℚ_p[1] ≠ 0, not †-étale | in, in, out | defined |
| 12.2 properness | Div¹ = Spd ℚ_p/φ^ℤ | FS line 2133: Div¹ → ∗ proper; VBI Layer 5 at d = 1 | ok | citation |
| 1.7 bounded | ℚ_p[ε]; ℚ_p[T] | A^u = ℚ_p, Fredholm ⇒ Fredholm; not bounded, excluded | ok | term |
| 4.8 weakly repr. | Y = X; Y perfectoid over X | identity; quasi-pro-étale surjection by Y | ok | defined |
| 9.5 smoothoid | X = D; X = B^n_D; point in B^1_D | smooth; smooth; closed immersion not smooth | ok | defined |
| Docstring §§11.2, 11.5 | X = GSpec(K); X → D rigid smooth | 11.2; 11.5(1) with U = X | ok | settings named |
| Docstring §12.3 | G_m over a point | O{1}[2]; X = point is smooth partially proper | ok | restated |
| gap `nuclear-modules` (narrowed) | A = ℚ_p with M = `⊕_{n≥0}` ℚ_p[−n]; A = ℚ_p with M = `ℚ_{p,■}[ℕ ∪ {∞}]` | first: a colimit of nuclear objects, nuclear by RefinedTraceMethods §4.3, not by AnalyticStacks §4.3(1); each π_{−n} = ℚ_p is nuclear, and the test of (1) agrees; second: compact, not dualizable, Hom criterion fails at P = M | both consistent with the split | `needs`, `section`, `detail` |

## For the maintainer

- `plan.json` keeps all 21 `gaps` entries, because targets 1.1–12.2 name every slug as a `gap:` prerequisite. Of these, only `proetale-v-comparison` is an open contract line in the README. A human decides whether to drop the other 20 at the design stage, editing the targets' prerequisites:
  - the two `supplier: none` entries are 0.2–0.5 here;
  - the 18 AnalyticStacks entries are stated at its head, and its Downstream consumers note maps each to a section.
- No id that other roadmaps cite changed. No backticked roadmap name was added or removed.
- Ownership: nothing new is stated; the new citations are to owners (VectorBundlesAndIsocrystals Layer 5, PrismaticCohomologyPartII §§3.8, 3.11, NoncommutativeAndEquivariantIwasawa §F.6, AdicEtaleGeometry §A2.4). Ownership against open pull requests was checked through the tool's heads.
- No suspicious instruction was found in the reviews.
