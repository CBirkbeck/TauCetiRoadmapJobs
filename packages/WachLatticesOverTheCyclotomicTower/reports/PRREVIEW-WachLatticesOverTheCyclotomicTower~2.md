# Review of WachLatticesOverTheCyclotomicTower (pull request #2899 at b863ff6)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/WachLatticesOverTheCyclotomicTower/`
**Verdict:** accepted

**Summary.** Accepted, with no findings: every statement of 6.4–6.11, including the heights, Sen weights, comparison exponents, `ψ` modulo `p`, the counting theorem, the position arithmetic, the cokernel exponents and the carries, holds when its Checks and proof routes are recomputed. There are seven small corrections and one format note, none blocking. The corrections concern a recurrence in one 6.4 Check that needs constant units, two attributions to Berger 2004 (the `Fil⁰` form of 6.4 (6)–(7), and the γ-descent of 6.10 (2)), missing locators into the formal proof, two loosely stated Checks in 6.8 and 6.9, and two slips in the pull-request description. The human reviewers must decide on scope: 6.6–6.11 rest only on a formal proof announced on 20 November 2026, which no refereed source states.

## C01 — The recurrence for `g_i` in the Check on `σ^{−1}`-semilinearity of 6.4 holds only when the units `u_i` are constants

In the Check "the localisation is `σ^{−1}`-semilinear" of 6.4 (line 144), a reader who tests `g_i = φ(g_{i−1})·(q/γ(q))^{k_i}` with a non-constant unit finds it false. For example, after replacing `e` by `(1+π)e` the unit `u` becomes `u(1+π)^{p−1}`. Comparing `φγ(e_{i−1}e) = φ(g_{i−1})u_iq^{k_i}e_ie` with `γφ(e_{i−1}e) = γ(u_i)γ(q)^{k_i}g_ie_ie` gives the extra factor `u_i/γ(u_i)`.

At `π = ζ_p − 1` this factor is `1`, because `γ(π)` takes the value `ζ_p^{1+p} − 1 = ζ_p − 1` there. So the conclusion `g_i(ζ_p − 1) = χ(γ)^{−k_i}` stands. Either say that the `u_i` are taken in `O_E^×`, or keep the factor `u_i/γ(u_i)` and note that it is `1` at `ζ_p − 1`.

## C02 — Berger 2004 does not state 6.4 (6)–(7) in their `Fil⁰` form, and "the description of `N(V)` through its localisations" names no statement

6.4 (6)–(7) (lines 53–69) assert that `ι_s(e_iN(V))` generates exactly the `Fil⁰` lattice `Σ_j t^{−j}(E⊗F_s)[[t]] ⊗ Fil^jD_dR(V)`, together with the membership criterion. The Sources line (lines 111–113) points to "the description of `N(V)` through its localisations" in Berger-Wach-2004 §§II–III, but no statement there has that form. What the author's manuscript does contain:
- `D_cris(V) ⊂ B^+_{rig,F} ⊗ N(V)` (Proposition II.2.1, p. 14);
- the elementary divisors `(t/π)^{r_j}` (Proposition II.3.1 with Proposition III.2.1, pp. 15–17);
- the `Γ_n`-action on `N(V)/φ^{n−1}(q)N(V)` identified with the Sen module (Proposition III.2.2, p. 18).

These fix the elementary divisors of the localised lattice, not that the lattice is `Fil⁰`. The statements are true, but a reader following the locator will not find them. Cite these three propositions as the inputs, together with Theorem III.4.4 for the filtration. If a source states the `Fil⁰` description directly, cite it as well.

## C03 — The γ-descent of 6.10 (2) and its exponent are Berger's (2004, Proposition IV.1.3 and the constant `α(r)`), and 6.10 does not cite him

6.10 has no Sources line, and the References credit 6.10 to [FormalProof] only (line 707). Berger-Wach-2004 Proposition IV.1.3 (author's manuscript, p. 24) proves, for the same purpose, that `π^{r−i}∏_{j<i}(χ(γ)^{r−j} − 1)N₁ ⊂ N₂` by the same induction. Its constant `α(r) = inf_γ Σ_{j≤r} v_p(χ(γ)^j − 1)` (p. 23) equals `cost(0, r)` for a topological generator: both are `⌊r/(p−1)⌋ + v_p(⌊r/(p−1)⌋!)`. Berger's bound `α(r) ≤ rp/(p−1)²` is the README's `cost(0, s) ≤ s·p/(p − 1)²`.

A result that appears in a source should carry its locator. Add "Berger-Wach-2004, Proposition IV.1.3 and the definition of `α(r)`, pp. 23–24" to 6.10 (2).

## C04 — 6.6–6.11 cite the formal proof with no file or declaration names, and 6.10 and 6.11 carry no Sources line

The Sources lines of 6.6, 6.7, 6.8 and 6.9 (lines 237, 318–319, 358–359, 476) say only "[FormalProof]", and 6.10 and 6.11 have no Sources line. The References entry (line 707) attributes all of 6.4–6.11 to a whole repository. A reader cannot find the formal statement behind any target, or check that it has the generality stated here: general `E`, unramified `F` of degree `n`. Give at each section the files or declaration names of the formal proof that state it, and add a Sources line to 6.10 and 6.11.

## C05 — The rank-zero Check of 6.8 says `d = 0`, but the hypotheses of 6.8 leave `d` free

In 6.8 the integers `d_i ≥ 0` are data. In rank zero every hypothesis holds for every choice of `d_i` (the high-type condition reads `d_i + 0 ≥ 0`), so the Check "Rank zero: `d = 0` and there is nothing to count" (line 368) states something the hypotheses do not force. As read, it holds for every `d` and tests nothing.

Would "Rank zero: the only Herr pair is `0`, so the bound holds for every `d`" say what is meant?

## C06 — The Check "a failure outside the hypothesis" of 6.9 needs `ρ̄ = χ̄_1`, which it does not state

The Check (lines 492–496) asserts that `T̄` is trivial having fixed only `HT(ρ) = {p}`. A crystalline character with that weight can differ from `χ_1χ_cyc^{−(p−1)}` by any unramified character, and then `T̄` is a nontrivial unramified character. The sum `χ_1 ⊕ χ_1χ_cyc^{−(p−1)}μ` used in the Check is full only when `ρ̄ = χ̄_1`. Add "take `ρ = χ_1χ_cyc^{−(p−1)}`".

With that choice, every value the Check claims holds:
- (P1)–(P4) hold and (P5) fails at `y = 0`;
- the admissible classes fill `H¹(G_{ℚ_p}, 𝔽_p)`, which has dimension `2`;
- `d = 0`.

## C07 — The pull-request description names polynomial rings where the roadmap has power series, and reports a `sorry` warning the file cannot produce

The description says that `V` "has a Wach lattice `N(T)` over `O_E⊗W(k_F)[π]`" and speaks of "a family … of `k[X]`-lattices". The README has `O_E⊗W(k_F)[[π]]` and `k[[X]]` (line 3). It also says the targeted build "succeeds with `sorry` as the only warning". `Suggested.lean` declares nothing, and elaborating it gives no message at all. Write `[[π]]` and `[[X]]`, and "succeeds with no warnings".

## N01 — Two citations name a whole paper or section range where a theorem number exists

The two places:
- Wach 1996 for 6.4 (8) (line 113): the criterion is the Théorème on p. 380, with Remark a) on p. 381; Berger-Wach-2004 restates it as Proposition II.1.4 (manuscript p. 13).
- Herr 1998 "§§2–4" for `γ − 1` on `ψ`-zero parts modulo `p` (line 318): this is Théorème 3.8 on p. 584.

## Questions for the author

- The References cite the formal proof at `github.com/leanprover-community/riemann-hypothesis`, while the announcement's footnote points to archives on `alpo.ge`. Are these the same development, and which declarations state 6.6–6.11? The repository could not be opened through the legal-source service, because its host is in no licence class.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 6.4 setting: `π₀`, `X`, `γ(X)` | mod `(p, π^p)`; `π = ζ − 1` | `π^k`-coefficient `binom(p,k+1)`: `0` for `k ≤ p−2`, `1` at `k = p−1`; `π₀(ζ−1) = −p`; `γ(X) − X = −π^{2p−2} + … = −X² + …` | holds | none |
| 6.4 (2) heights, Check `ℤ_p(−a)` | `N = π^a e_{−a}`, `ℚ_p(1)` | `φ(n) = q^a n`; `q̄ = π^{p−1} = X·unit`; index `X^a` over `k[[X]]`, `π^{(p−1)a}` over `k[[π]]`; `ℚ_p(1)`: `qφ(N) = N` | holds | none |
| 6.4 labelling Check | `n = 2`, `(k₀, k₁) = (5, 0)` | `φ(e₀e) = u₁q^{k₁}e₁e` puts the jump `k₁` on component `0`, so `HT₁ = {k₁}` | holds | none |
| 6.4 (6) Check `ℤ_p(−1)` | `d = te_{−1}`, `ι_1(πe_{−1})` | `ι_1 = (ζ_pe^{t/p} − 1)/(t/p) ⊗ d/p` = unit·`t^{−1}d`; image `t^{−1}F_1[[t]] ⊗ D` = `Fil⁰` | holds | C02 locator |
| 6.4 `σ^{−1}` Check | rank one, `e ↦ (1+π)e` | with units: `g_i = φ(g_{i−1})(u_i/γu_i)(q/γq)^{k_i}`; at `ζ_p − 1`: `q/γ(q) = χ(γ)^{−1}`, `u/γu = 1` | conclusion holds | C01 |
| 6.4 (8) `Γ` Check | `N = πO_E[[π]]` | `φ(N) = qN`, `a = 0`, `b = 1`; `(γ−1)π = pπ + … ∉ π²O_E[[π]]` | holds | none |
| 6.4 (5) / 6.10 sharp Check | `c = (p−1)p^{m−1}`, `m = 1, 2` | kernel `ℤ_p`; `N(T₁)` as stated; `C = ℤ_p[[π]]/(p^m, π^c)`; `cost(c−1, c) = 1 + v_p(c) = m` | holds | none |
| 6.5 (1)–(3), Checks | `ℤ_p(−a)`; `U = {0}`, `{0, 0}`, `{0, p}` | `c(1) = −1`, `c(−1) = 1/(1+p)`; `U = {0}`: hypothesis of (3) holds iff `s ≤ p`, `f = ∏_{0<j<s}(Y+j)`; `U = {0, p}`: fails | holds | none |
| 6.6 (1)–(3) | rank one `φe = X^he`; `h = 60`, `p = 41` | lattices `X^{−m}`, `0 ≤ m ≤ ⌊h/(p−1)⌋`; `S = 60/40 = 1.5`, `σ = 1`; `2 ≤ 82 − 60` | holds | none |
| 6.7 (3b) range | `a = 1, 2, 2−p, 1−p` | `m = ⌊(p−1)a/p⌋ = 0, 1, 2−p, 1−p`; levels `X^0, X^1, X^0, X^{−1}` | `[2−p, 1]` exact | none |
| 6.7 (3c), API `ψ` | trivial module | `ψ(X) = 1`, `ψ(X²) = p ≡ 0`, `ψ(X(1−X)) = 1`; `⌈pc/(p−1)⌉` skips exactly `a ≡ 1 (mod p)` | holds | none |
| 6.7 (4) route | `v = 0` against `v ≥ 1` | `φ(N₀) ⊂ X^{1−v}φ^*N₀` needs `v ≥ 1`; final inclusion needs `v + 2 ≤ p(σ+3) − w` | holds | none |
| 6.8 counting | high piece `c = b − φy + x` | `(γ−1)c = φ(g′_{i−1}) − (g_i − (γ−1)x_i)`, and `p(σ_{i−1}+3) − w_i ≥ v_i + 2 + 2p`; rank zero: `d_i` free | holds | C05 |
| 6.9 position consequences | (P1)–(P5) | low: `|u − y| ≤ η + σ + 1 < p`; `t + 2σ + 1 ≤ η + 2σ + 1 < p` | holds | none |
| 6.9 (1c) sign argument | low / high | `pm_{i−1} ≤ s + w ≤ η < p` gives `m ≤ 0`; `pm_{i−1} ≥ −η > −p` gives `m ≥ 0`; `Σm = 0` | holds | none |
| 6.9 Check "one lattice" | `p = 41`, `h = 100`, `η = 26`, `w = 80`, `t = 2`, `U = {66}` | `σ = 2`; `40 < 41`; `h − u = 34` not a residue of `[−6, 33]`; exponent `−40 ∈ [−80, 20]`; Sen `1` | holds | none |
| 6.9 Check "telescoping" | `η = 20`, `w = 85`, `U = {99}` | `|99 − 85| = 14 > 4`; exponent `14 − 82 + 2 = −66 ∈ [−85, 15]`; Sen `16 = v + 1` | holds | none |
| 6.9 Check "failure" | `p = 13`, `U = {p}`, `h = p+1` | `σ = 1`; `1 + 4 + 6 = 11 < 13`; (P5) fails at `y = 0`; `dim H¹ = 2`, `d = 0` | holds if `ρ̄ = χ̄_1` | C06 |
| 6.10 (1) general form | ideals `I_i`, `𝔟_i` | `c_i ≥ pc_{i−1}` around the cycle forces `c_i = 0`, so `π^H ∈ I_i` | holds | none |
| 6.10 (2)–(3) bounds | `cost`, recursion, constant `10` | `v_p(u^k − 1) = 1 + v_p(k)` when `(p−1) | k`; `2G` coefficient `2p/((p−2)(p−1)) ≤ 10/p` at `p = 3` (`18 ≤ 20`) | holds | C03 credit |
| 6.10 (4) | `M = 0`; `M + h ≤ p − 2` | `d¹` onto via `1 − φ` on `π₀N`; `e°_U = 0`; `v_p(R(0)c_Γ) = Σv_p(j) + a + v_p(a!)` | holds | none |
| 6.11 (0)–(5), Check | `T = {a ≡ b mod p} ⊂ ℤ_p ⊕ ℤ_p(1−p)` | `φ = diag(Q^{p−1}·unit, 1)`; carries `−1, +1`; quantities `0, p−1`; `(5)`: `p − 1 = σ₂(U)` | holds | none |
| Headline 1 (6.4–6.5) | as rows above | free rank `dim V`; heights `X^{−a}`, `X^b`; `∇` char. poly. `∏(Y − ū)` | holds | none |
| Headline 2 (6.9 (3)) | 6.8 hypotheses for `N^max` | `v = h − w ≥ t ≥ 1`, `v ≤ η ≤ p − 7`; counts `= d_i`, `= r − d_i` | holds | none |
| Headline 3 (6.10) | sharp example | `π^H` needed; `e_W ≥ cost(0, H) + 3`; `H ≤ p − 2` gives `C = 0` | holds | none |
| Headline 4 (6.11) | example above | `(p − 1)|c| = h` attained | holds | none |

- Source locators checked against the text: 13. These are, in Berger-Wach-2004 (the author's manuscript, numbering as cited), Propositions II.1.1, II.1.4, II.2.1, II.3.1, III.2.1, III.2.2, III.4.2, Theorems III.3.1 and III.4.4, and Proposition IV.1.3 with `α(r)`; Wach-1996 Théorème p. 380; Herr-1998 Théorèmes 2.1 and 3.8.
- Library declarations opened at the pin:
  - `Field.absoluteGaloisGroup` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`);
  - `WittVector.fontaineTheta` (`Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`);
  - `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:112`);
  - `BDeRhamPlus` and `BDeRham` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75, 88`);
  - `ContinuousCohomology` (`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:136`);
  - `Module.End.maxGenEigenspace` (`Mathlib/LinearAlgebra/Eigenspace/Basic.lean:557`);
  - `ExteriorAlgebra.exteriorPower` (`Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:79`);
  - `RiemannHypothesis` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:185`);
  - `TauCeti.continuousLocalCyclotomicCharacter` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup/Cyclotomic/Character.lean:54`).
  - No crystalline, Wach or `(φ,Γ)`-module carrier exists in either pinned library.
- Cross-roadmap citations resolved: 17 supplier citations on main and 10 consumer citations at their heads.
  - On main, PhiGammaModulesAndIwasawaCohomology §§0.1, 1.0, 2.2, 2.4, 2.5, 3.1, 3.4, 3.5, 3.6, 5.6a, 6.0–6.3 and 7.2a, and PadicPeriodRings §§4.1–4.3.
  - At their open heads, SelmerLengthBoundsAndLocalLifting §§4.10a, 4.10c–4.10f and 4.10e (0), CongruenceModulesOfThetaLifts §§7.6, 7.10a–7.10c and 7.16, and LengthBoundsInPadicFamilies §1.8e.
- Dependency check, run with the candidate merge order: `depcheck: 171 roadmaps, 1990 edges, 0 problem(s)`. The roadmap is placed after both its suppliers (PadicPeriodRings at line 24, PhiGammaModulesAndIwasawaCohomology at line 34, this roadmap at line 444).
- Automatic checks: every text check passes (no `set_option`, LaTeX, process words, sorry'd data, private paths, import or identifier problems).
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no `#check @name` signature comparison to make. The docstring names the four headlines and the carriers each lacks, and every library name it cites elaborates at the pin.
Overlap check: read SelmerLengthBoundsAndLocalLifting, CongruenceModulesOfThetaLifts, LengthBoundsInPadicFamilies, PadicHodgeRegulators, TriangulineVarietyAndItsLocalModel, PhiGammaModulesAndIwasawaCohomology, PadicHodgeTheory and FiniteFlatGroupsAndIntegralPadicHodgeTheory. Wach modules are owned by PhiGammaModulesAndIwasawaCohomology §6.0 and cited here. The crystallinity criterion 6.4 (8) is owned here; SelmerLengthBoundsAndLocalLifting §4.10e (0) states the finite-level uniqueness with crystallinity assumed. The residual block-character classes 6.9 (4) are owned here; SelmerLengthBoundsAndLocalLifting §4.10a (3)–(4) states the form over finite `O`-modules and cites 6.9. The other roadmaps only consume.

Source independence: 9 passages compared with 4 sources (Berger-Wach-2004, Wach-1996, Herr-1998, Announcement), none shared: 6.4 (1) route, 6.4 filtration, 6.4 (6), 6.4 (8), 6.5 route, 6.7 (3c), 6.10 (2) route, the References and the Suggested.lean docstring. Largest share [FormalProof], 4 of 10 Sources-line citations, and the References attribute 6.4–6.11 to it. Contents compared with Berger-Wach-2004: independent (its Chapters I–V do not map onto 6.4–6.11). [FormalProof]'s text and contents were not readable.

Research link: 6.4–6.5 and 6.10 extend Berger's Wach lattices of crystalline lattices and their behaviour modulo `p^n` (Berger 2004, §§II–IV, read), and 6.7 extends Herr's torsion Herr complexes (Herr 1998, read). 6.6–6.11 follow a formal proof announced by Alpöge on 20 November 2026 (README References; Announcement read), which no refereed source states.

## Not verifiable

- [FormalProof] (the GitHub repository cited in the README): its host is in no licence class for the legal-source service. Its locators for 6.6–6.11 were not checked; the statements were verified instead by recomputing their routes and Checks.
- Cherbonnier–Colmez 1999: the AMS landing page is in no licence class. It is cited only for the classical bijectivity of `γ − 1` on `ψ`-zero parts, in the route of 6.7.
- Fontaine 1990 (Grothendieck Festschrift II): no open copy was found. It is cited only in the References, for étale `(φ,Γ)`-modules.
- Berger-Wach-2004 was read in the author's manuscript, whose theorem numbering matches the README's; the journal pagination was not checked.

Automatic checks set aside as false positives:
- The merge-order check, run against the default order, reports the roadmap as missing; the candidate order lists it after both its suppliers.
- The check that a pull request changes no file outside its roadmap's folder flags the three files of the family index directly in `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/`. This roadmap is nested in that family, so those index files are part of this pull request, and the flag is not a stray change.

## Source issues

- none

## For the human reviewers

- Scope: 6.6–6.11 cite only [FormalProof], a Lean development announced on 20 November 2026 (Announcement, `alpo.ge/remark.pdf`, read). The announcement says that no written proof exists yet. No refereed source stating 6.6–6.9 or 6.11 was found.
- Not tested: [FormalProof], the source with the largest share of locators, could not be read, nor its table of contents, because its GitHub host is in no licence class. Wording and arrangement were therefore not compared against it.
- Licence: the README cites `github.com/leanprover-community/riemann-hypothesis`, while the announcement's footnote names archives on `alpo.ge`. The licence of either, and whether they are the same development, were not determined.
