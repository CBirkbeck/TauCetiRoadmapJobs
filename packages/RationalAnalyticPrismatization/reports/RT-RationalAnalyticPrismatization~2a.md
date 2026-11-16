<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6913013884 -->
Red team round 2 pass a (claude) of 05a6825

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The unpunctured Fargues–Fontaine disc is not a Gelfand stack

   **Location.** `packages/RationalAnalyticPrismatization/README.md:1094`: "define the relative Fargues–Fontaine disc `D_{FF,S}` = Spa(A_inf(A)) ∖ V([ϖ]) as the Berkovich space ⋃_s `GSpec(B^†_{[0,s]}(S))`"; also README:25, README:1110, README:1112 and README:1262.

   **Claim.** `B^†_{[0,s]}(S)` is a Gelfand ring, `D_{FF,S}` a Berkovich space with `κ_ϖ^{-1}(0)` = {|p| = 0} and `D^⋄_{FF,S}` = S × Marc(ℤ_p); README:1262 forms `D_{FF,K}` `×_{GSpec(ℚ_p)}` `D_{FF,K}`.

   **Witness.** S = Spa(C_p♭): the point p = 0, [ϖ] ≠ 0 of Spa(A_inf) has |p|^s = 0 ≤ |[ϖ]|, so `B_{[0,s]}` surjects onto C_p♭ and p is no unit. README:17: rings are ℚ_p-algebras; README:429: points have |p| = `p^{-1}`.

   **Repair.** The disc with the locus p = 0 is used nowhere after 6.1 (ALRS uses it only at ALRS line 2299–2321). State the punctured disc directly:

   - README:1094, first sentence: "For an affinoid perfectoid space S = Spa(A) of characteristic p, qfd and separable, with pseudo-uniformizer ϖ, define the relative punctured Fargues–Fontaine disc `D^×_{FF,S}` = Spa(A_inf(A)) ∖ V(p[ϖ]) as the Berkovich space ⋃ `GSpec(B^†_{[r,s]}(S))` over the intervals [r, s] ⊂ (0, ∞) with rational endpoints, where A_inf(A) = W(A°) and `B^†_{[r,s]}` is the overconvergent rational localization of {|p|^s ≤ |[ϖ]| ≤ |p|^r}; there [ϖ] is a unit and a power of p divides a power of [ϖ], so p is invertible and `B^†_{[r,s]}(S)` is a Gelfand ring over ℚ_p (ALRS §3.2, p. 44, ALRS line 2295). The disc Spa(A_inf(A)) ∖ V([ϖ]) of the source, which contains the locus p = 0, is only a classical adic space (RelativeFarguesFontaine §1.2): its rings surject onto A, of characteristic p, so they are not ℚ_p-algebras."
   - README:1094, second sentence: "Construct its Frobenius φ_S and the radius map κ_ϖ: `D^×_{FF,S}` → (0, ∞)^Betti with κ_ϖ(x) = log|[ϖ]|_x / log|p|_x, so that κ_ϖ ∘ φ = p·κ_ϖ; on the adic disc κ_ϖ tends to 0 towards the locus p = 0, which the Gelfand stack does not contain;". In the third sentence delete "`D^⋄_{FF,S}` = S × Marc(ℤ_p) and".
   - README:25: replace "and `κ^{-1}(0)` = {|p| = 0}" by "and κ tends to 0 towards the locus p = 0 of the adic disc, which `D^×_{FF,S}` does not contain".
   - README:1110: "… would send Frobenius to multiplication by `p^{-1}` and would tend to 0 towards [ϖ] = 0 instead of p = 0, contradicting κ ∘ φ = p·κ."
   - README:1112: "For S = ∅ the disc is empty."
   - README:1262: delete from "; the unpunctured product" to the end of the Check.

   Tested on the witness: at p = 0 one has |[ϖ]| ≤ |p|^r = 0 false for r > 0, so the point is excluded; at the untilt C_p, |[p♭]| = |p| and κ = 1 ∈ [r, s] for r ≤ 1 ≤ s. Tau Ceti's 𝒴 = D(p) ∩ D([ϖ]) (README:52, Y.lean:116) is the punctured locus, so the law at README:1104 is unchanged.

2. **F02** (P3) The Lazard–Serre resolution has an owner on main that no *Needs:* line names

   **Location.** README:1668: "which holds for p-adic Lie groups by the Lazard–Serre resolution (RJRC22 Theorem 5.7, p. 45, RJRC22 line 2227)"; used again at README:1670, README:1717, README:1753 and README:1802. *Needs:* lines README:1672, README:1719, README:1804.

   **Claim.** The resolution of ℤ_p by finite free modules over the Iwasawa algebra of a uniform group is an input of 10.2, 10.4, 10.5 and 10.8, supplied by a citation of RJRC22 only.

   **Witness.** NoncommutativeAndEquivariantIwasawa §0.11 (on main, README line 485 and step 6, line 498): every finitely generated O[[G]]-module has a finite resolution by finitely generated projectives, and for uniform U the trivial module ℤ_p has one by finitely generated free Λ(U)-modules of length d.

   **Repair.** README:1668, after "RJRC22 line 2227)": insert "; its algebraic form, a resolution of the trivial module ℤ_p of length d by finitely generated free Λ(U)-modules for a uniform group U of dimension d, is NoncommutativeAndEquivariantIwasawa §0.11, and it is a resolution of solid `ℤ_{p,■}[U]`-modules because `ℤ_{p,■}[U]`(∗) = Λ(U) and maps of finite free modules are maps of solid modules". Add "NoncommutativeAndEquivariantIwasawa §0.11" to the *Needs:* lines of 10.2, 10.4 and 10.8, to the contract at README:186 with "finite global dimension and the finite free resolution of the trivial module for uniform groups (§0.11)", to its "Sections consumed", and to the Layer 10 Dependencies (README:1898). Tested: U trivial gives ℤ_p free of length 0; U = ℤ_p gives 0 → ℤ_p⟦T⟧ → ℤ_p⟦T⟧ → ℤ_p → 0, length 1 = d; §0.11 excludes groups with elements of order p, and uniform groups have none.

3. **F03** (P2) The definition added in 4.8 follows the source's sentence

   **Location.** README:969: "Call a map Y → X of arc-stacks weakly representable in arc-diamonds if for some arc-cover X′ → X by a perfectoid space the base change Y ×_X X′ admits a quasi-pro-étale surjection from a perfectoid space".

   **Claim.** The definition is in the roadmap's own words.

   **Witness.** ALRS line 10105–10106: sixteen consecutive tokens shared (from "the base change" to "from a"), the longest run in the README outside formulas; the clauses come in the source's order.

   **Repair.** "Call a map Y → X of arc-stacks weakly representable in arc-diamonds if X has an arc-cover by a perfectoid space X′ over which Y is covered by a perfectoid space, in the sense that some perfectoid space maps to Y ×_X X′ by a surjective quasi-pro-étale map (ALRS Lemma A.3.4, ALRS line 10104)." Tested: Y = X is covered by X′ itself through the identity; a perfectoid Y over perfectoid X takes X′ = X and the identity of Y.

4. **F04** (P3) Arc-stacks over 𝔽_p and over ℤ_p are used and never defined

   **Location.** README:664: "Define the ∞-category `ArcStk_{ℚ_p}` … and its qfd variant on separable qfd perfectoid spaces (ABLB Definition 4.1.8 …; ABLB Definition 4.1.11(3), p. 39, ABLB line 2067)"; uses at README:1116 ("`D^×_{FF,−}`: ArcStk → GelfStk", "For an arc-stack X over 𝔽_p"), README:1134 ("qfd arc-stacks over ℤ_p", "Marc(𝔽_p)^HK") and README:1247.

   **Claim.** 2.8 defines the arc-stacks that Layers 6–8 use.

   **Witness.** 2.8 defines only arc-stacks over Marc(ℚ_p). Marc(𝔽_p) is not one: README:664 defines Marc(A) for Banach ℚ_p-algebras A. ABLB line 2067–2069 defines `ArcStk^qfd_{ℤ_p}` on perfectoid spaces over ℤ_p, not the ℚ_p variant it is cited for.

   **Repair.** In README:664, after the first sentence insert: "Write `ArcStk_{𝔽_p}` for the hypersheaves of anima on the arc-site of separable perfectoid spaces of characteristic p, with final object Marc(𝔽_p), and `ArcStk_{ℤ_p}` = `ArcStk_{𝔽_p}`/Marc(ℤ_p), where Marc(ℤ_p) classifies untilts and Marc(ℚ_p) ⊂ Marc(ℤ_p) those in which p is invertible; the qfd variants are the hypersheaves on separable qfd perfectoid spaces, and `ArcStk^qfd_{ℤ_p}` = `ArcStk^qfd_{𝔽_p}`/Marc(ℤ_p) (ABLB line 2020–2022; ABLB Definition 4.1.11(3), ABLB line 2067; ABLB line 2093–2095). From Layer 6 on, ArcStk and “arc-stack over 𝔽_p” mean `ArcStk_{𝔽_p}`, and “arc-stack over ℤ_p” means `ArcStk_{ℤ_p}`." Replace "and its qfd variant on separable qfd perfectoid spaces (… ABLB Definition 4.1.11(3), p. 39, ABLB line 2067)" by "and its qfd variant `ArcStk^qfd_{ℚ_p}`, the slice of `ArcStk^qfd_{ℤ_p}` over Marc(ℚ_p)". Tested: in 6.3, X = Marc(𝔽_p) is the final object of `ArcStk_{𝔽_p}` and Y^⋄_X = Marc(ℚ_p); G_m over Marc(ℤ_p) (ABLB line 5284) is an object of `ArcStk_{ℤ_p}`.

5. **F05** (P3) A disc of radius 1/2 is a rational subspace only for p = 2

   **Location.** README:879: "the inclusion of a disc of radius 1/2 into a disc of radius 1 becomes Zariski closed after base change to a strictly totally disconnected cover".

   **Claim.** The Check is stated for every prime p (README:17 fixes |p| = `p^{-1}`).

   **Witness.** Radii of rational discs {|T^n| ≤ |c|} lie in p^ℚ, and 1/2 ∈ p^ℚ only for p = 2 (log_3 2 is irrational). The example is taken from ALRS line 1371, which calls this disc a †-rational subspace.

   **Repair.** "the inclusion of the †-rational disc {|T| ≤ `p^{-1}`} into the disc of radius 1 becomes Zariski closed …" (rest unchanged). Tested: {|T| ≤ |p|} is the localization of the second Check of 1.6, for every p.

Round 2. Both files were read in full (`packages/RationalAnalyticPrismatization/README.md`, 2236 lines; `packages/RationalAnalyticPrismatization/Suggested.lean`, 75 lines). Five new findings: two P2 (S01, S03) and three P3 (S02, S04, S05). No P1. The first section checks the eighteen findings of round 1.

## Round 1 findings at this head

| Round 1 id | Status | Witness at this head |
|---|---|---|
| 1a/F01, 1b/F04 (Lean docstring overstates two headlines) | repaired | `Suggested.lean:46–48`: "0-proper with pullback fully faithful on modules over `O^la_X = h_* O`"; `Suggested.lean:55–57`: "its base change to `FF_{X^⋄}` has dualizing complex `O{d}[2d]`, and `f^{Div¹,!} O ≅ O{d}[2d]` when `X` is a smooth partially proper rigid space". Agrees with README 10.12(1), 12.3(2)–(3) and ALRS line 8878–8882. |
| 1a/F02 (gap `nuclear-modules` too wide) | repaired | `design/plan.json`, `nuclear-modules`: section "§4.3 (opening and (1))", needs "… characterized by the Hom criterion, and, for nuclear A, nuclearity tested on the underlying ℚ_p-module and on homotopy groups, with closure under countable limits". ABLB line 6781–6797 has the split as README:73 states it. |
| 1a/F03 (properness of Div¹ cited to FarguesFontaineDiamonds §F2) | repaired | README:2113: "by the properness of Div¹ → ∗ (FS Proposition II.1.21, FS line 2133; VectorBundlesAndIsocrystals Layer 5, “Effective divisors and projective sections”, the case d = 1)"; *Needs:* README:2115 and Dependencies README:2205 follow. The heading exists at the supplier's head with FS II.1.21. |
| 1a/F04 (two sections cited for statements they do not make) | repaired | README:1939: "the labelled Sen operator of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2, in which χ_p has weight +1"; README:13: "NoncommutativeAndEquivariantIwasawa §F.6" (`deRham_iff_potentiallySemistable` is there, main README line 4064). |
| 1a/F05 (ℚ_p not perfect over the integral Iwasawa algebra) | repaired | README:1670: "ℚ_p is a perfect `ℚ_{p,■}[Π_0]`-module, the hypothesis (… for Π_0 trivial, ℚ_p is perfect over ℚ_p although it has no finite free resolution over ℤ_p)". See S02 for the owner of the resolution. |
| 1a/F06 (Div¹~ written as a double prismatization) | repaired | README:23 and README:1343: "Div¹~ = `GSpec(ℚ_p)^{Div¹~}` = lim_φ Q_p^Δ". |
| 1a/F07, 1b/F05 (P¹ glued along a non-cover) | repaired | README:963: discs {|T| ≤ p} and {|1/T| ≤ p}, "the open subsets {|T| < p} and {|T| > `p^{−1}`} that they contain cover P¹, the Gauss point included". Recomputed: `ℚ_p⟨pT⟩_{≤1}` has |pT| ≤ 1, that is |T| ≤ p; the overlap is {|1| ≤ |pT|}, a rational locus since 1 generates the unit ideal. |
| 1a/F08, 1b/F10 (`plan.json` gaps with supplier `none`; eighteen gaps not in contract form) | settled as not actionable | The repair report's reason holds: targets 1.1–12.2 of `plan.json` name every slug, and only the `gaps` list may change. `plan.json` still has `gestalten-affine-proper` and `gestalten-transmutation` with supplier `none`; README Layer 0 states their content. Not raised again; see the human reviewers' section. |
| 1b/F01 (StRing as a colimit of ∞-categories) | repaired | README:213: "formed in 1Pr … equivalently the limit of ∞-categories along the right adjoints D ↦ End_D(1). It is not the union of the CAlg(nPr)". Gest line 1713–1714 and 1751–1752 agree. |
| 1b/F02 (0-affineness of [X]_D needs the slice Künneth formula) | repaired | README:304: "if moreover the restriction of D to the slice `C_{/X}` satisfies the Künneth formula … The slice condition is also necessary"; law README:316 is an "if and only if"; README:548 names AnalyticStacks §2.3(7). Gest line 3028–3030 is an "if and only if". |
| 1b/F03 (direction of GelfStk → GelfStk^qfd) | repaired | README:536: "has as inverse image the left exact colimit-preserving functor GelfStk^qfd → GelfStk sending GSpec(A) … to GSpec(A), and as direct image the restriction". ABLB line 2269–2271 agrees. |
| 1b/F06 (sections missing from "Sections consumed") | repaired | README:90 lists §E0.8, §E5:presentability.1, §E5:presentability.2; README:86 lists §2.1; README:603 has "AnalyticStacks §2.1, §4.1". All four headings exist where cited. |
| 1b/F07 (PrismaticCohomologyPartII §3.9 cited for §3.8 and §3.11) | repaired | README:1593: "§§3.8–3.9, built for transversal prisms as a limit … (§3.8)"; README:1607: "§3.11". Headings 3.8, 3.9, 3.11 exist at the supplier's head with these contents. |
| 1b/F08 (factor p between e and e_A) | repaired | README:1630: "log_Δ(q^p) = p·log_Δ(q) = p(q − 1)e, so the two formulas agree exactly when the integral generator e_A corresponds to p·e". |
| 1b/F09 (undefined terms) | repaired, with a new defect | "bounded solid ℚ_p-algebra (1.1)" at README:476; smoothoid defined at README:1542; pro-Berkovich-étale defined at README:2087; "weakly representable in arc-diamonds" defined at README:969, in wording that follows the source (S03). |

No other repair introduced an error: the new Checks of 10.12, 9.8, 9.9, 4.7, 2.8 and 12.1 were recomputed (rows below).

## Verified sound

**Counts.** Declarations read: 0 (`Suggested.lean` is a module docstring and an empty namespace). Targets read: 93 of 93. Checks read: 373 of 373, every target has at least three; about 100 recomputed, the rows below. Line locators: 595 (ALRS 384, ABLB 79, Gest 76, RCSolid 17, HM 11, others 28); 590 lie in the fifteen cached texts tested by script and all are in range; of 429 tied to a theorem label, 408 have the label within three lines and the other 21 point inside the cited item (five of these read: ALRS line 420, 697, 2983–2993, 7888–7896, 8471); about 45 passages read by me in this pass, among them every locator the repair added. Sibling citations: 60 section ids read at the supplier (36 headings of AnalyticStacks with the items of its §4.4; VectorBundlesAndIsocrystals Layer 5; PrismaticCohomologyPartII §§3.8, 3.9, 3.11, 4.12, 4.13; NoncommutativeAndEquivariantIwasawa §§0.1, 0.2, 0.6, 0.7, 0.11, 0.13, F.6; AdicEtaleGeometry §§A1.12, A2.4; EnhancedDerivedSheaves §E0.8, §E5:presentability.1, .2, .4; DiamondsAndVStacks §§D6.4, D6.5; MotivesAndAlgebraicCyclesPartII §§0.1–0.7 in the board package); every other cross-roadmap citation resolves by `roadmaps resolve`, whose only lead is that board package. Library declarations: 23 of 23 exist at the pins at the cited file and line (10 in Mathlib 1b1ccf4, 13 in Tau Ceti 2fd255d).

**Dependency check.** Output:

    depcheck: 258 roadmaps, 2470 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The edge that S02 adds (NoncommutativeAndEquivariantIwasawa, on main) is already present.

**Suggested.lean.** `module`, `import Mathlib`, one module docstring, an empty namespace; no declaration, `sorry`, `set_option`, `lemma`, `#check` or `#eval`. The `#check @name` comparison has no input and no Lean was run. The seven headlines of the docstring are the seven end theorems of the README Summary (11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6), each now with the hypotheses of its README target. None is statable at the pins: each names Gelfand stacks, and neither pinned library has analytic rings, six-functor formalisms, Gelfand rings or prismatization (grep of Tau Ceti for these names returns only the Gelfand invariants of Lie theory). No padding.

**Policy.** The pull request changes only `packages/RationalAnalyticPrismatization/`. No pull-request numbers or process words in the README or the docstring; every target has a locator.

**Ownership.** `roadmaps grep` for Gelfand stacks, Gestalten, twistor stack, analytic de Rham stack, geometric Sen, Tate–Sen and the pro-étale–v comparison: no roadmap on main or at an open head states these objects (AnalyticStacks excludes Gestalten at its README line 22; PadicPeriodRings uses the Tate–Sen axioms for its own tower). This roadmap is their owner. `gap:proetale-v-comparison` is declared in `plan.json` and at README:160 with the same wording; nothing provides it (AdicCoefficientsAndComparisons compares v- and étale cohomology with torsion coefficients only). Ownership against the open pull requests was checked through the tool's heads.

**The adversarial table.** One row per target; "ok" means both sides agree on the values shown.

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Docstring, decompletion | G = 1, X closed disc | End(1) = ℚ_p on the connected \|X\|^Betti, ℚ_p⟨T⟩ on X; statement restricted to O^la-modules | ok |
| Docstring, duality | G_m over a point | O{1}[2]; a point is smooth partially proper | ok |
| Conventions, twists | e on X_cyc | φ(log q/(q−1)) = p·log q/(q^p−1) = p[p]_q⁻¹·log q/(q−1); with φ(e⟨1⟩) = p⁻¹e⟨1⟩, φ(e) = [p]_q⁻¹e | ok |
| Conventions, radius | untilt C; p = 0 | κ = 1; p = 0 is no point of a Gelfand stack | S01 |
| 0.1 | D(k); ⋃A^n | End of unit of Mod_{D(k)}(1Pr) is D(k); unit → D(k) is 1-affine, so by cancellation ⋃A^n is n-affine over the unit for no n | ok |
| 0.2 | ∗ → B²G_m; ∅ | A_1 = B_1 = D(k), relative algebra k the unit, not 0-affine; 0-th terms of ∗ and ∅ both ∗ | ok |
| 0.3 | k[x]; levels | condition needs a 2-category: m + 1 ≥ 2 holds for m ≥ n + 1 ≥ 1; forgetful D(k[x]) → D(k) colimit-preserving | ok |
| 0.4 | k[x] | (∏M_i) ⊗ ⊕k·x^n ≠ ∏(M_i ⊗ ⊕k·x^n), no left adjoint; 0-proper ⇒ 1-étale | ok |
| 0.5 | finite sets; level 2 of a 0-affine [X]_D | Λ × Λ; B_2 = Mod_{D(X)}(Mod_{D(∗)}(1Pr)) = Mod_{D(X)}(1Pr) ⇔ slice Künneth | ok |
| 1.1 | ℚ_p[T] | image of Σp^kT^k would be infinite in ⊕ℚ_pT^k; A^b = ℚ_p | ok |
| 1.2 | ℚ_p⟨T⟩; ℚ_p⟦T⟧[1/T] | {‖f‖ ≤ p^{−k}} = p^kℤ_p⟨T⟩; T ∈ Nil†, 1 ∉ Nil† since T ↦ 1 kills the unit 1 − T | ok |
| 1.3 | overconvergent disc algebra; 0 | A_{≤1}/p = 𝔽_p[T], so A^u = ℚ_p⟨T⟩; A^u = 0 makes 0 a unit | ok |
| 1.4 | ℚ_p⟨T_n⟩ | Gauss points with \|T_n\| = r_n embed [0,1]^ℕ | ok |
| 1.5 | ℚ_p × ℚ_p; trivial norm | 2 points; \|p\| = 1 ≠ p⁻¹ | ok |
| 1.6 | (T, p); (1, p) | U = T/p on \|U\| ≤ 1, colim_{r>1/p}; pU − 1 a unit on \|U\| < p, zero ring | ok |
| 1.7 | ℚ_p[ε] | ℚ_p = B/ε has an infinite minimal resolution; §4.4(1) of AnalyticStacks is the trace-class criterion, (6) the Huber-pair case | ok |
| 1.8 | ℚ_p(μ_{p^∞}) | colimit of Banach fields, †-reduced, A^u = ℚ_p^cyc ≠ A | ok |
| 2.1 | direction | α^*GSpec(A) = GSpec(A), α_* restriction (ABLB line 2270) | ok |
| 2.2 | open disc; affinoids | f_!O in degree 1, f_*O in degree 0; C has finite limits (pushouts, products, ℚ_p) | ok |
| 2.3 | (∏ℤ_p)[1/p]; ⊕ℚ_p[−n] | compact, not perfect, so not nuclear; π_{−n} ≠ 0 for all n | ok |
| 2.4 | ℚ_p → ℚ_p^cyc | closed line in a Banach space over ℚ_p splits, so descendable | ok |
| 2.5 | S profinite | Hom(C^lc(S, ℚ_p), A) = Cont(M(A), S) | ok |
| 2.6 | compactified disc; r = 0 | A^{∘∘} = pℤ_p⟨T⟩, 𝔽_p integrally closed in 𝔽_p[T], so A⁺ = ℤ_p + pℤ_p⟨T⟩; image of K⟨T_i⟩_{≤r} converges on \|T\| < ρ and misses 1/(1 − T/c) | ok |
| 2.7 | ℚ_p[u^{±1}], \|u\| = 2 | no map to a connective ring; ∅ | ok |
| 2.8 | Marc(ℚ_p); Marc(𝔽_p) | hat of the final arc-stack is not GSpec(ℚ_p); Marc(𝔽_p) is not defined by 2.8 | S04 |
| 3.1 | A¹ at nilperfectoid A | A^u = A/Nil†(A), so A¹/G_a^† | ok |
| 3.2 | BG | (BG)^dR = BG^sm, G^sm(A) = Cont(M(A), G) | ok |
| 3.3 | d = 0 | O | ok |
| 3.4 | C(ℤ_p, C_p); ℚ_p[ε] | A ×_{A^u} C(ℤ_p, ℚ_p) = C(ℤ_p, ℚ_p), not C^lc; (X ×_{X^dR} X(ℚ_p)^dR)^dR = X(ℚ_p)^dR | ok |
| 3.5 | Spec R(∗) | S | ok |
| 3.6 | GSpec(ℚ_p) | s ≠ 0: cofib = 0, empty; s = 0: ℚ_p ⊕ ℚ_p[1] | ok |
| 4.1 | 0 → A¹ at C_p[ε] | fibre product C_p·ε against a point | ok |
| 4.2 | overconvergent disc | †-rational localization {\|T\| ≤ 1} of ℚ_p⟨pT⟩, Berkovich-étale over A¹; image not open | ok |
| 4.3 | two discs at 0; radius 1/2 | ℚ_p⟨S⟩ ×_{ℚ_p} ℚ_p⟨T⟩ = ℚ_p⟨S,T⟩/(ST); 1/2 ∈ p^ℚ only for p = 2 | S05 |
| 4.4 | ℚ_p[ε] → ℚ_p; ℚ_p⟨T⟩ → ℚ_p | †-reductions ℚ_p = ℚ_p; ℚ_p⟨T⟩ ≠ ℚ_p | ok |
| 4.5 | ℤ_p ⊗_{ℤ_p[x]} ℤ_p; gr^k | L = A ⊗ (x)/(x²)[1] = A[1]; fib(ℓ^k − ℓ) on gr^k is gr^k/N[−1], N' prime to p a unit of A, so gr^k/p^a, p-complete | ok |
| 4.6 | A = M = ℚ_p; M = ℚ_p[−1] | π_0 an extension of ℚ_p by ℚ_p: ℚ_p[ε]; section ℚ_p → ℚ_p[ε] not surjective | ok |
| 4.7 | P¹ | deg Ω¹ = −2 from d(1/T) = −T⁻²dT; Gauss point in {\|T\| < p} | ok |
| 4.8 | BG_m; weakly representable | L = O[−1], dual of the adjoint line shifted; definition follows ALRS line 10105 | S03 |
| 5.1 | point; ∅; G_a | A¹/G_m; Y(0) a point only when I = R: G_m/G_m; cofib(I → R), I of weight −1 | ok |
| 5.2 | obstruction | Hom(L_{Y/X}, M[1]) → Hom(L_{Y/S}, M[1]) → Hom(f^*L_{X/S}, M[1]) → Hom(L_{Y/X}, M[2]) | ok |
| 5.3 | X = Y = GSpec(K) | K in weight 0 | ok |
| 5.4 | I = R; ℚ_p[θ] at T = 0 | R/Nil†(R): X^dR; partial sums of Σp^{n²}θ^n·1 have unbounded degree | ok |
| 6.1 | untilt C; p = 0 point; ϖ^m | κ = 1; B_{[0,s]} ↠ C_p♭, p not a unit; κ multiplied by m | S01 |
| 6.2 | Marc(ℚ_p) = Marc(ℚ_p^{cyc,♭})/Γ | A_inf(C(T, A)) = C(T, A_inf(A)), so the quotient is by Γ^cont | ok |
| 6.3 | P¹ | O ⊕ O(−1)[−2], ω = O(1)[2], O(−1) ⊗ O(1) = O | ok |
| 6.4 | Marc(ℚ_p) | 1, 2, 0; H²(ℚ_p(1)) = ℚ_p | ok |
| 7.1 | two copies of the disc | ι^⋄ not an isomorphism | ok |
| 7.2 | C_p[ε]; ℚ_p(μ_{p^∞}) | A_{≤1} = O_{C_p} ⊕ C_pε; ℤ_p[μ_{p^∞}] → O_{ℚ_p^cyc} not surjective | ok |
| 7.3 | final object | GSpec(ℚ_p) | ok |
| 7.4 | Marc(𝔽_p); unpunctured product | GSpec(ℚ_p); `D_{FF,K}` has no map to GSpec(ℚ_p) | S01 |
| 7.5 | C_p[ε] | ℚ_p ×_{C_p} C_p[ε] = ℚ_p ⊕ C_pε = ℚ_p^la(A) of 3.4 | ok |
| 7.6 | λ = 1 with D_{−1} and with D_1 | B^{φ=p} ≠ 0; B^{φ=1/p} = 0 | ok |
| 8.1 | [p]_q² | twice an untilt divisor | ok |
| 8.2 | C_p[ε] | Frobenius shifts {n} × T to {n+1} × T, misses n = 0 | ok |
| 8.3 | perfectoid D | D^HT = D, so X^{HT/D} = X^Δ ×_{D^Δ} D = X^HT | ok |
| 8.4 | X_cyc | ∏_{n<N}[p]_{q^{p^n}} = (q^{p^N} − 1)/(q − 1), limit log q/(q − 1) up to p^N | ok |
| 8.5 | lim_φ over (0, p) | κ(x_n) = κ(x_0)/p^n < 1 for n ≥ 1, where φ is an isomorphism: unique preimages | ok |
| 8.6 | point | A¹/G_m ×_{A^{1,dR}/G_m^dR} Q_p^HK | ok |
| 8.7 | non-surjective open immersion | not an arc-cover | ok |
| 9.1 | GSpec(C_p) | T = C_p(−1)[−1], T[1]{1} = O | ok |
| 9.2 | D × BG_a | T = O[1], fibre product over (O{1}[3])^†, loop object B²G_a^†{1} | ok |
| 9.3 | 0 → A¹ | amplitude [−1, 0], not an epimorphism | ok |
| 9.4 | D × BG_m | T = BG_a; BG_m(R ⊕ I[1]) = BG_m(R) × B²I | ok |
| 9.5 | point | L = gr¹B⁺_dR(C_p)[1] = C_p(1)[1] | ok |
| 9.6 | point | Â¹/G_m ×_{BG_m^dR} GSpec(ℚ_p) | ok |
| 9.7 | Q_p^HT | GSpec(ℚ_p(μ_{p^∞}))/ℤ_p^{×,sm} = GSpec(ℚ_p), kernel of la → sm is G_m^† | ok |
| 9.8 | perfected generator | φ(log q ⊗ e⟨1⟩) = p·p⁻¹ = 1; I ⊗ O⟨1⟩ = O(−1) ⊗ O(1), slope 0 | ok |
| 9.9 | q^p | q^p − 1 = (q − 1)[p]_q; log_Δ(q^p) = p(q − 1)e, so e_A ↔ p·e | ok |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p | M_2(ℚ_p) against ℚ_p⁴ | ok |
| 10.2 | Π_0 = 1; ℤ_p | perfect over ℚ_p; 0 → ℤ_p⟦T⟧ → ℤ_p⟦T⟧ → ℤ_p → 0; owner of the resolution not named | S02 |
| 10.3 | ℤ; ℤ_p at r′ ∈ [1/p, 1) | ℚ_{p,■}[ℤ] = ℚ_p[T^{±1}]; G_0(r′)(ℚ_p) = pℤ_p, p discs | ok |
| 10.4 | Legendre; ϖ = p^{1/2}, p²; 1 + p²ℤ_p | v_p(m!) ≥ m/(p−1) − 1 − log_p(m+1); \|p\|_ϖ = 1/4, 2^{−1/2}; v_p(g−1) − 1 ≥ 1 > 1/(p−1) and adds 1 under g ↦ g^p | ok |
| 10.5 | C(ℤ_p, ℚ_p) over C^la | M^la ⊗_{A^la} A = C^la ≠ M | ok |
| 10.6 | ℤ_p on ℤ_p^cont | D(ℚ_p) against D(ℤ_p^sm/ℤ_p^la) = D(BG_a^†) | ok |
| 10.7 | C(G, ℚ_p) | R^la = C^la_G, completion R | ok |
| 10.8 | d = 0 | every module decompletes with M = N_{ϖ^ϵ}, δ = 0 | ok |
| 10.9 | G = 1 | identity | ok |
| 10.10 | Λ = ℚ_p | ϵ·v_p(ϖ) ∈ ℤ, exponents discrete | ok |
| 10.11 | G = 1 | contractible mapping anima | ok |
| 10.12 | G = 1, closed disc | ℚ_p against ℚ_p⟨T⟩ | ok |
| 11.1 | K = ℚ_{p²}; ℚ_{p³} | 2, 4, 0 against 1, 3, 0; (σ ⊗ φ)(x ⊗ b) ↦ (φ(τ(x)b))_τ, invariants ℚ_p³; with σ⁻¹ a 3-cycle composed with φ, invariants ℚ_{p³}; (A/ℤ) ×_{Bℤ} (B/ℤ) = (A × B)/ℤ | ok |
| 11.2 | C_p(n) | n ≠ 0: 0; n = 0: K, K, 0 | ok |
| 11.3 | d = 0 | Div¹ = X_cyc/ℚ_p^{×,la} | ok |
| 11.4 | X = D | FF_D, identity | ok |
| 11.5 | dim 1 | two-term Higgs complex | ok |
| 11.6 | X = GSpec(K) | 11.1 | ok |
| 11.7 | degree n; non-quasi-compact X | n + 1; both sides limits over affinoid perfectoids of RΓ_proét(S, ℚ_p) | ok |
| 11.8 | K = ℚ_{p²}; FE | K ⊗ K = K × K, two copies; FE ⊗ O{−1}: 0 → O → · → Ω¹{−1} → 0, matches L[1] | ok |
| 11.9 | ℤ_p over ℚ_p | Hom(ℚ_p^{×,∧}, ℤ_p) of rank 2, also for p = 2 | ok |
| 11.10 | K(μ_{p^∞}) | GSpec(K ⊗ ℚ_p(μ_{p^∞}))/ℤ_p^{×,la} = GSpec(K(μ_{p^∞}))/Γ^la | ok |
| 12.1 | cusp; open disc | k²[1] ⊕ k[2]; union of {\|T^n\| ≤ \|p\|} | ok |
| 12.2 | mirabolic; ω_{A¹/G_m} | [pℤ_p : ℤ_p] = 1/p; ω_{BG_m} = O[−1], ω_{A¹/G_m → BG_m} = I[1], product I; h^!1 = O⟨1⟩[2] since ω of (A¹/G_m)^dR is O[2] ⊗ O[−2] | ok |
| 12.3 | P¹ | f_!O = O ⊕ O{−1}[−2], not O{1}[2] | ok |
| 12.4 | P¹ | f_*(O{1}[2]) = O{1}[2] ⊕ O = (O ⊕ O{−1}[−2])^∨ | ok |
| 12.5 | d = 1; general X | O{1}[2] ⊕ O; (P^d_X)^Δ = (P^d)^Δ ×_{Q_p^Δ} X^Δ by 8.2, so 12.4 applies | ok |
| 12.6 | point | weight-n part RΓ(Q_p^HT, O{n}): 0 for n ≠ 0, ℚ_p ⊕ ℚ_p[−1] for n = 0; the class log χ_cyc lives on Div^{1,†} (ALRS line 7896) | ok |

### Copyright, licences and scope

**Wording.** A script compared every line of the README with the full texts of ALRS, ABLB, Gest, RCSolid and HM, and the Lean docstring with ALRS (runs of nine or more shared words): 76, 6, 10, 3 and 5 runs. Outside formulas the longest are 16 words (README:969, ALRS line 10105: S03), 14 words (README:304, Gest line 3115, the statement of an equivalence), 13 words (README:829, ALRS line 1289, a chain of implications; README:766, ALRS line 1107, a list of hypotheses). The passages the repair rewrote (0.1, 0.5, 2.1, 4.7, 9.8, 9.9, 10.2, 10.12, 12.1, 12.2) and eight further ones (1.1, 2.6, 6.1, 8.5, 10.3, 11.1, 11.8, the docstring) were read beside the source: only S03 follows it.

**Arrangement.** ALRS has 384 of the 595 line locators. Against its contents (ALRS line 15–70), by number: Layer 0 ↔ Gest; Layer 1 ↔ ABLB §§2–3; Layer 2 ↔ §§2.1–2.3 with ABLB §4; Layer 3 ↔ §§2.3–2.5; Layer 4 ↔ §§2.6–2.7 with Appendix A; Layer 5 ↔ §§2.8–2.9 and 3.1; Layer 6 ↔ §3.2 with ABLB §6 and ALBM §4; Layer 7 ↔ §§3.3–3.7; Layer 8 ↔ §§4.1–4.3 and part of 4.7; Layer 9 ↔ §§4.4–4.10; Layer 10 ↔ §5; Layer 11 ↔ §§6.1–6.4; Layer 12 ↔ §§6.5–6.7. The thirteen layers do not map one to one onto the six chapters: chapters 2, 3, 4 and 6 are each split over two or three layers, Appendix A is merged into Layer 4, §3.1 into Layer 5, and seven layers draw on a second source. The order of Layers 7–12 is forced by *Needs:* lines (8.1 needs 7.1; 9.1 needs 8.6; 11.1 needs 9.7 and 10.12; 12.3 needs 11.4 and 11.6). No finding.

**Reuse.** No table, figure or list of examples is taken over from a source; `Suggested.lean` has no declaration to compare with a public formalisation.

Source independence: 18 passages compared by hand and every line by script with 5 sources, one shared (S03, 16 words); largest share ALRS, 384 of 595 locators; contents compared with ALRS: independent.

## Not verifiable

- The sign in the radius formula at ALRS line 2317: the extracted text shows a leading minus sign before the quotient of logarithms, which would make κ negative; whether the printed formula has it could not be read from the extraction. README:1094 uses the positive quotient, which the Check at README:1109 and Tau Ceti's `IsRadiusLowerBound` (Window.lean:102) confirm.
- The convention of the modulus in the fifth Check of 12.2: ALRS line 8819–8821 takes the inverse character and a different dictionary to isocrystals and reaches the same slope −1; which convention HM Example 5.3.21 fixes for a left or right action was not settled.
- Proof steps taken from inside source proofs (4.5 at ALRS line 9471–9506, 12.1(3), 10.8–10.10): each cited passage exists and concerns the step; the steps were not all reworked.
- Citations without a cached line (SixFF Proposition 5.16, RC24 Lemma 2.6.13 and Proposition 3.7.5, RJRC Proposition 6.1.5 and Remark 2.1.5, Man26 Lemmas 10.3 and 10.5, AM24 Lemma 3.29, BC16 Théorèmes 3.2 and 3.4, Zav Theorem 5.7.7, FS Propositions II.2.2 and II.2.5): not opened.
- MotivesAndAlgebraicCyclesPartII is a board package, not on main and not an open roadmap pull request; its Layer 0 headings were read in the board checkout and may still move.
- The deep targets (10.9, 11.4, 11.6, 12.2–12.6) beyond the instances of the table rest on ALRS, whose statements match the README at the cited lines.
- The Lean file was not elaborated (no build is allowed in this pass, and it has no declaration).

## Source issues

- **Gap** in ALRS at §3.2, printed page 44: the source says the disc that still contains the locus p = 0 is a Berkovich space glued from spectra of its interval rings; it should treat only the punctured disc that way, those rings not being ℚ_p-algebras; affects nothing.
- **Error** in ALRS at Remark 6.1.5, printed page 145: the source says that for unramified K the twistor stack of GSpec(K) is the plain product of GSpec(K) with Div¹; it should be the Frobenius-twisted product (GSpec(K) × Div¹~)/(σ × φ)^ℤ, since H⁰ must be ℚ_p; affects a stated result.
- **Misprint** in ALRS at Proposition 3.7.4(2), printed page 56: the source puts the classifying stack of the de Rham additive group in the lower left corner of the square; it should be that of the analytic additive group, as its proof says; affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164: the source applies the upper shriek to the structure sheaf of the twistor stack of Y; it should be that of X; affects nothing.
- **Misprint** in ALRS at Example 2.7.2, printed page 26: the source calls a disc of radius one half a †-rational subspace of the unit disc; it should take a radius in the value group, such as 1/p; affects nothing.

## For the human reviewers

- **Scope.** 384 of 595 line locators point into ALRS, a 2026 preprint on an author page; Layer 0 rests on Gest, lecture notes on an author page (76 locators); ABLB and RCSolid are arXiv preprints of 2025–2026. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS, Gest and Sch24 as author-page copies with no stated licence; the README restates their results with locators.
- **Scope.** `design/plan.json` still lists `gestalten-affine-proper` and `gestalten-transmutation` with supplier `none`, while README Layer 0 states their content; the repair report settled this as not actionable in the package.
- **Scope.** The supplier MotivesAndAlgebraicCyclesPartII (README:96) is a board package under review, neither on main nor an open roadmap pull request; it is the entry before this roadmap in the merge order.
- **Scope.** At subsection level Layers 7–12 run in the order of ALRS §§3.3–6.7 (pairs under Arrangement); the *Needs:* chains force that order and the layers do not map one to one onto chapters.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "05a682520296aae63124d226ea9dc722d0f98356", "job": "RT-RationalAnalyticPrismatization~2a", "model": "fable", "worker": "chris-x29"} -->
