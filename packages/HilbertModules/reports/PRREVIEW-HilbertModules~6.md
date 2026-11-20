# Review of HilbertModules (pull request #2625 at 14016f0)

**Verdict:** accepted

**Summary.** Accepted. The previous review raised one finding and four smaller points, and this head repairs all five. The §5.11 Check and the torus sentence of the Layer 5 Examples now hold in the empty and zero cases. The Kaad–Lesch and Dixmier–Douady locators now point at statements that say what the README attributes to them. §7.2 names CStarAlgebras §2.6 for the pure state it uses, and Downstream consumers lists all fifteen roadmaps on main that use this one. The changed passages introduce no new problem, and there are no small corrections or format notes. The questions for the human reviewers are unchanged: the licences of two hosts, and the largest source, which could not be read.

## Previous findings

- R01 — repaired: §5.11 now says "has the cohomology of a point for every cover with a nonempty index set (every cover of a nonempty space)". The Layer 5 Examples now say `M_k` and `Γ_(a,b)` "exhaust the nonzero finitely generated projective `C(T²)`-modules".
- C01 — repaired: §7.2 now cites "(Kaad–Lesch, §3, Theorem 3.1)". §5.3 cites Proposition 3 for dense evaluations, §9 for polarization and Proposition 4 for reconstruction. The References give the erratum's Theorem 2.1, and give Pierrot's Theorem 1.18 as the erratum's Conjecture 1.1.
- C02 — repaired: the *Needs:* line of §7.2 reads "CStarAlgebras C2.2 and §2.6 (pure-state separation from closed left ideals)". The route names the pure state, and the Layer 7 Dependencies and the CStarAlgebras contract name §2.6.
- C03 — repaired: UnboundedOperators, OperatorAlgebraDynamics, QuantumGroups, NoncompactQuantumSymmetry and FactorRigidity are added, each with what it consumes, which makes fifteen entries.
- N01 — repaired: "§2.6, whose heading carries the label C2.AnnHull". CStarAlgebras' own note says that its target k.n is cited as Ck.n (its README, lines 1839–1841), so the old form "C2.6" could also be resolved. Both forms are correct.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §5.11 Check, value ℤ on ∅ (R01) | X = ∅, empty cover; X = ∅, I = {∗}, U = ∅; X = {a,b}, ({a},{b}) | complex 0, excluded by the clause; ℤ →0 ℤ →1 ℤ →0 …, H⁰ = ℤ, Hⁿ = 0 for n > 0; ordered simplex on 2 vertices, H⁰ = ℤ | true as repaired |
| Layer 5 Examples, torus modules (R01) | 0; Γ_(a,1); Γ_(a,b) | rank 0, now excluded; Γ_(a,1) ≃ M_a (§5.7, line 907), rank 1; rank b ≥ 1, Chern number −a | true as repaired |
| §5.3, field from dense evaluations (DD Prop. 3, sample) | X = [0,1], E(z) = ℂ, Λ = ℂ[z]; Λ = span{z} | evaluations are ℂ, closure C[0,1]; at 0 the evaluations are {0}, closure {f(0) = 0}, which violates (CCii) | hypothesis needed; DD line 130–143 |
| §5.3, reconstruction (DD Prop. 4) | X = ℝ; Γ = C(ℝ) and C_c(ℝ), norm \|f\| | C(ℝ) locally uniformly complete, gives the trivial field; in C_c, bumps equal to 1 on [−n,n] are Cauchy with limit 1 ∉ C_c | true; X LCH gives regular, locally paracompact (DD line 285) |
| §5.3, polarization (DD §9) | x, y sections | the identity at DD line 743 gives (x(z)\|y(z)) from four continuous norms | true |
| §7.2, pure state of K_A(E) (C02) | A = E = C[0,1], L = {f(0) = 0}, x = 1 | K_A(E) ≅ C[0,1], K_A(L,E) = L; only δ₀ has left kernel ⊇ L; δ₀(θ_(1,1)) = 1; ι_δ₀(L) = 0 ∌ 1 | true; erratum lines 1609–1644 |
| CStarAlgebras §2.6 contract (C02) | M₂, J = {a : ae₂ = 0}; J = A; A = 0 | only ω_e₂ has left kernel ⊇ J, and that kernel is J; ω_e₂(E₂₂) = 1 > 0; no such states, empty meet = A | agrees with CStarAlgebras lines 564–566 |
| §7.2 state separation, KL Thm 3.1 (C01) | A = 0, L = ∅; A = C[0,1] with Lebesgue state | A = 0 has no state, so "nonempty" is needed; KL §3.1: ι_ω(L) dense for faithful ω, δ₀ separates | true; KL line 377 |
| §7.3 local–global, pure states (headline, C01) | A = ℂ; A commutative | A = ℂ: states are pure, T^ω = T, always regular (KL line 613); commutative: KL Thm 5.8 | KL Thm 4.2 (616), Thm 5.6 (730), erratum Thm 2.1 (1581), Conj. 1.1 (1546) |
| Downstream consumers (C03) | 22 READMEs on main mention HilbertModules | 15 consumers listed; 4 suppliers; CompactQuantumMetricSpaces cites only the child; Subfactors disclaims; SeibergWittenTheory uses it only through OperatorKTheory K4 | complete |

The rows of the previous review for untouched statements (Layers 1–4, §§5.5–5.9, Layer 6, §§7.1 and 7.5, and the three Layer 2 theorems of `Suggested.lean`) stand as in the previous review, of `9841b24`.

- Source locators checked against the text: Dixmier–Douady Def. 1 (line 63), Prop. 1 (line 103), Prop. 3 (line 130), (MN) (line 262), Prop. 4 (line 285) and §9 (line 740); Kaad–Lesch Thm 3.1 (line 377), Thm 4.2 (line 616), Conj. 5.2 (line 715), Thm 5.6 (line 730), and the erratum's Conj. 1.1 (line 1546), Thm 1.3 (line 1559), Thm 2.1 (line 1581), its proof (lines 1609–1644) and its Pierrot entry (line 1651). That is 15 locators.
- Cross-roadmap citations resolved on main (161e64d): CStarAlgebras §2.6 (lines 557–566) and its labelling note (lines 1839–1841); UnboundedOperators lines 512 and 1313 (H6, and H7's interval example, which is this roadmap's §7.4 at line 1280); OperatorAlgebraDynamics lines 54 and 387; QuantumGroups line 1927; NoncompactQuantumSymmetry line 9293; FactorRigidity line 997.
- Library declarations: the change names no new Mathlib or Tau Ceti declaration, and `Suggested.lean` is unchanged since `9841b24`.
- Automatic checks: every check passed at this head. Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. `git diff --stat origin/main...HEAD` shows no change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings only (lines 56, 69 and 81). The file is unchanged, so the earlier `#check @` comparison and the one-tactic probes still hold.
- The pull request's text agrees with this head: 54 sections, 35 Checks lists with 58 bullets, contracts for Mathlib, Tau Ceti and eleven roadmaps, 15 downstream consumers, and the Kaad–Lesch, Dixmier–Douady, §5.11, Layer 5 and §7.2 sentences.

Overlap check: read CStarAlgebras (main) again, for its §2.6 and its consumer notes; TracesOnCStarAlgebras (open), OperatorAlgebraDynamics and OperatorKTheory (main) stand as read in the previous review; the list by results and headings is empty. The one object this change adds, pure-state separation of closed left ideals, is owned by CStarAlgebras §2.6 and is consumed here. Ownership is otherwise as before.

Source independence: changed passages only. 7 passages were compared with 2 sources: the Prop. 3, Prop. 4 and §9 sentences of §5.3 against Dixmier–Douady; the §7.2 route, the §7.3 locator sentence and the Kaad–Lesch and Pierrot reference entries against Kaad–Lesch and its erratum. Nothing is shared beyond forced statements and hypothesis lists. The largest share is Raeburn–Williams, about 23 of about 48 locators, unchanged. No layer was added, removed or reordered, so the contents were not compared again.

Research link: Layer 7's sum criterion (Kaad–Lesch 2012, Theorem 7.10) is, by that paper's §7 introduction, the regularity input for the Kasparov product of unbounded modules. Layer 5 is the Dixmier–Douady classification (Dixmier–Douady 1963; Raeburn–Williams 1998). This rests on Kaad–Lesch line 1082–1083 and the README's references.

## Not verifiable

- Pierrot 2006, Théorème 1.18 (§7.3): the landing page on jolt.centre-mersenne.org is in no licence class. Its content and its numbering are known only through the Kaad–Lesch erratum (line 1565).
- Raeburn–Williams, Blackadar and Williams: paywalled, as in the previous review. The change touches none of their locators.
- Roe, Proposition 10.2, and Teschl, Theorem 2.27: refused by the sources service, as in the previous review. The change touches neither locator.

## Source issues

- none

## For the human reviewers

- Licence: the README links Roe's notes at bpb-us-e1.wpmucdn.com/sites.psu.edu (line 1662). The sources service could not classify this host as the author's page.
- Licence: the README links Teschl's book at www.mat.univie.ac.at/~gerald (line 1668). The service refused it because the URL does not name the author; a human can confirm that it is Teschl's own page.
- Not tested: Raeburn–Williams has the largest share of locators (about 23 of 48). Neither its text nor its table of contents could be read, so the wording and arrangement comparisons were not made against it.
