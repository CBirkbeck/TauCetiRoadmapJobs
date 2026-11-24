# Review of PhiGammaModulesAndIwasawaCohomology (pull request #3027 at 0b5086d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 141 changed lines since `aecb53a`. New §§6.4–6.6 were checked at every locator against Berger's *Limites de représentations cristallines* (with its errata) and Wach 1996, and every Check was recomputed, including the `[F:ℚ_p] = 2` elementary-divisor example and the `p = 2` case of §6.5; no statement is false or unsupported, so there is no finding. Accepted, with three small corrections and two format notes, none blocking: §6.0's filtered comparison now depends on the later §6.4 without its Needs line saying so, §6.4's Needs line omits the step that puts `D_cris(V)` inside the Robba realization (which Tau Ceti states only in a later roadmap), and the description does not name this roadmap. The humans have nothing to decide beyond noting that their decision on the family's published theorems was applied.

## C01 — The new text makes §6.0's filtered comparison depend on the later §6.4, but §6.0's Needs line does not say so, and §6.4 names only its part (1)

Someone who builds Layer 6 in order would prove §6.0 completely first, and only then learn that its filtered comparison has to wait for §6.4. What the new text says:

- §6.4's Needs line (lines 2635–2636) says the filtered comparison of §6.0 "is deduced from (1)".
- The Dependencies paragraph (line 2743) says the source deduces it from §6.4.

That matches the source, which uses both parts of §6.4:

- Berger's Théorème III.4.4 takes its map from Proposition II.2.1, which is §6.4 (1).
- It takes its filtration comparison from Théorème III.3.1 (Berger-Wach-2004 line 786).
- The proof of Théorème III.3.1 starts from the elementary divisors `(t/π)^{r_j}`, which are §6.4 (2) (Berger-Wach-2004 lines 696–706).

§6.0's own Needs line (lines 2425–2426) still lists only §§1.0–1.3 and PadicPeriodRings.

There is also a loop at the level of sections, though not at the level of statements:

- §6.4 needs §6.2.
- §6.2's Needs lines (from line 2500) pass through §6.1.
- §6.1's Needs lines (lines 2460 and 2471) pass through §6.0's filtered reduction.

No statement depends on itself, because §6.4 takes only the definition of `N_Wach,rig^+(V)` from §6.2. A possible repair:

- Add "§6.4 (1)–(2), for the filtered comparison" to §6.0's Needs line.
- In §6.4, change "deduced from (1)" to "deduced from (1) and (2)".
- Narrow §6.4's citation to "§6.2 (the definition of `N_Wach,rig^+(V)`, for `F = ℚ_p`, `p` odd)".

## C02 — §6.4's Needs line does not name the step that places `D_cris(V)` inside the Robba realization, which Tau Ceti states only in a later roadmap

Berger's proof of Proposition II.2.1 starts from [Ber02, théorème 3.6] (Berger-Wach-2004 lines 466–469 and 481). [Ber02] is this roadmap's Berger-diffeq. The proof uses two inputs from that paper:

- For positive crystalline `V`, `D_cris(V) ⊂ D_rig^†(V)`.
- Frobenius regularisation over `B̃_rig^†` (Proposition I.4.1).

Statement (2) also assumes that `B_rig,F^+` admits elementary divisors, which Berger cites as [Ber02, §4.2] (line 296). §6.4's Needs line (lines 2635–2637) lists only §6.0, §6.2 and PadicPeriodRings §§4.1–4.3, and none of the possible owners can supply the first step:

- **PadicPeriodRings §4** has no Robba rings.
- **NoncommutativeAndEquivariantIwasawa §F.6, stage 3** (its README line 3963) supplies `N_dR(V)` and the monodromy theorem, but not this inclusion.
- **PadicLocalLanglandsForGL2Qp §0.2** (its README line 91) proves `D_cris(V) = (D_rig(V)[1/t])^Γ`. That roadmap comes after this one in the merge order and cites it, so it cannot be cited here.

An implementer of §6.4 (1) therefore has no named owner for its first step. Two repairs would work:

- State the step inside §6.4, citing Berger-diffeq Théorème 3.6.
- Derive it from this roadmap's own §1.4. Extension to the extended Robba ring is fully faithful on morphisms of arbitrary finite projective `(φ,Γ)`-modules. Applied to the inclusion of `R⊗_F D_cris(V)` into `t^{−k}D_rig(V)` after extension, it gives the step, with §§1.0b and 1.3 as inputs.

The elementary-divisor theory of `B_rig,F^+` would be named in the same Needs line.

## C03 — The description does not say that this roadmap gains three sections

The description says "49 existing roadmaps receive 196 sections" and names the largest recipients, but it never names PhiGammaModulesAndIwasawaCohomology. A reader of the description therefore does not learn three things:

- This roadmap on `main` gains §§6.4–6.6, 138 added lines.
- It gains a new source, Wach-1996, and new clauses in its overview and scope.
- WachLatticesOverTheCyclotomicTower now cites these sections as "Corollary of".

One sentence would do, for example: "PhiGammaModulesAndIwasawaCohomology gains §§6.4–6.6 (Berger's comparison of a Wach module with `D_cris` over the open disc, the action of `Γ_F` modulo `φ^{s−1}(q)`, and Wach's crystallinity criterion), which WachLatticesOverTheCyclotomicTower 6.4, 6.5 and (8) cite."

## N01 — The overview's new clause adds a list of section numbers (lines 54–55)

The rest of the overview guides by layer. "Layer 6 also compares Wach modules with `D_cris` over the open disc and proves Wach's crystallinity criterion" would keep it free of section numbers.

## N02 — Untouched text: in the References, line 3450, the key Berger-Wach-2004 names Wach, although Berger wrote the paper alone

Now that Wach-1996 is cited beside it, a reader may take the two papers for co-authored work. If the author wishes, a key such as Berger-2004 would avoid this; the key is used throughout the README.

## Verified sound

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §6.4 header: `t = π∏_{s≥1}φ^{s−1}(q)/p` | general `n`; `p = 2, n = 1` | `∏_{s≤n}φ^{s−1}(q) = ((1+π)^{p^n}−1)/π`; divided by `p^n` → `log(1+π)/π`; `q/2 = 1` at `π = 0` | holds (Exemple I.3.3) | none |
| §6.4 header: `B_F^+/φ^{s−1}(q) ≅ F_s` | `p = 3, s = 1` | `q = π²+3π+3`, Eisenstein; at `ζ₃−1` it is `ζ₃²+ζ₃+1 = 0`; quotient `ℚ₃(ζ₃)` | holds (Remarque I.3.1) | none |
| §6.4 (1) | `V = ℚ_p(−1)` | `Γ`-invariants of `B_rig^+·πe₋₁`: `fπ ∈ ℚ_p t`, so invariants `ℚ_p·te₋₁ = D_cris`; `πe₋₁` itself not invariant | holds | none |
| §6.4 (2) | `V = E`; `V = ℚ_p(−1)` | divisors `1`; `t/π` (weight 1) | holds | none |
| §6.4 Check `[F:ℚ_p] = 2`, `(k₀,k₁) = (5,0)` | `E ⊇ F` | `f₀ = ∏_{s odd}g_s⁵`, `f₁ = ∏_{s even}g_s⁵` coprime ⇒ divisors `{1,(t/π)⁵}`, each `[E:F]` times; jumps 5, 0 ⇒ weights `{0,5}` | agrees with (2) | none |
| §6.4 consequence (all crystalline `V`) | `V = ℚ_p(1)` | `N = π⁻¹e₁B^+`, `D_cris = t⁻¹e₁`; ratio `t/π`, a unit of `B_rig^+[1/t]` | holds | none |
| §6.4 Check "weight `a` ⇒ `(π/t)^a`" | `V = ℚ_p(−a)`; row 5 | ratio `(π/t)^a`; unequal embedding weights give non-powers, so "weight `a`" means one weight | holds | none |
| §6.5 | `ℚ_p(−1)`, `s = 1`, `p` odd; `p = 2`, `χ(γ) = −1` | `(ζ_p^{χ(γ)}−1)/(ζ_p−1) = 1` ⇒ `χ(γ)⁻¹` (wrong sign: `χ(γ)`); `−1/(1+π)` at `π = −2` is `1` ⇒ `(−1)^{−r}` | holds for every `p` | none |
| §6.5 route | `γ ∈ Γ_s` | `(t/π)/γ(t/π) = γ(π)/(χ(γ)π) → χ(γ)⁻¹`; `Λ` singular at the point, so only characteristic polynomials agree; semisimplicity supplied separately | sketch sound | none |
| §6.6 Check, `Γ` condition | `N = πO_E[[π]]`, `χ(γ) = 1+p` | `φ^*N = qN` (`h = 1`); `(γ−1)π = pπ+O(π²) ∉ π²O_E[[π]]`; `N ≠ O_E[[π]] = N(O_E)` | Check true | none |
| §6.6 weight bound | general `N` | `φ(x) ∈ q^{h+1}N` ⇒ `φ(x_j) ∈ qA^+` ⇒ `π∣x_j` ⇒ `Fil^{h+1} = 0`; `φ(N) ⊆ N` ⇒ `Fil⁰` everything | jumps in `[0,h]` | none |
| §6.6 positivity step | `T = ℤ_p`, `x = 1/π` | `φ(x)/x = 1/q ∉ A^+`; modulo `p`, `x̄^p ∈ E^+x̄` ⇒ `v(x̄) ≥ 0` | holds | none |
| §6.6 `N = N(T)`, rank one | `T = ℤ_p`, `N = A^+u` | Lemma I.3.2: `u ~ π^{j₀}∏φ^{n−1}(q)^{j_n}`; `Γ` mod `π` ⇒ `j₀ = 0`; `φ`-stable ⇒ decreasing ⇒ all `0` | `N = A^+` | none |
| §6.6 Check `ℤ_p(−1)` | `N = πe₋₁ℤ_p[[π]]` | `φ(n) = qn`, `h = 1`; scalar `(γ(π)/π)χ(γ)⁻¹ ≡ 1` mod `π`; weight 1 ∈ `[0,1]` | holds | none |
| §6.0 filtered comparison | Berger III.4.4 proof | uses II.2.1 (map) and III.3.1 (filtration); III.3.1 uses divisors `(t/π)^{r_j}`; §6.0 Needs omits §6.4 | build order | C01 |
| §6.4 Needs | Berger II.2.1 proof | starts from Ber02 Th. 3.6; absent from §F.6 stage 3; stated in PadicLocalLanglandsForGL2Qp §0.2, merge order 35 after 34 | input unnamed | C02 |
| Headline `wittProjective_of_flat_phi` (unchanged) | `n = 1, R = 𝔽_p`; `p = 2, n = 2, M = ℤ/2` | `W₁ = 𝔽_p`, finitely presented ⇒ free; `W₂(𝔽₂) = ℤ/4`, `ℤ/2` not flat, excluded; three one-tactic probes fail | holds | none |
| Headline Herr Euler characteristic | trivial line, `K = ℚ_p` | `h⁰ = 1`, `h² = h⁰(ℚ_p(1)) = 0`, `χ = −1` ⇒ `h¹ = 2 = [K:ℚ_p]+1` | holds | none |
| Headline Iwasawa cohomology | `T = ℤ_p`, `K = ℚ_p` | `H²_Iw ≅ H⁰(K_∞, ℚ_p/ℤ_p(1))^∨ = ℤ_p(−1) ≠ 0`, so the `ψ` complex needs degree 2 | consistent | none |
| Headline triangulation | `d = 1` | `M = R(δ₁)⊗L₁`; the flag is `M`; no modification, empty bad locus | holds | none |

- Source locators checked against the text: 14 in all.
  - Berger-Wach-2004: Exemple I.3.3 (p. 10); Remarque I.3.1 (p. 9); Propositions II.1.1 (p. 11), II.2.1 (p. 14), II.3.1 (p. 15), III.2.1 (p. 17) and III.2.2 (p. 18); Définition III.4.1 and Proposition III.4.2 (p. 21); Théorème III.4.4 and Corollaire III.4.5 (p. 22).
  - Berger's errata: the item on Définition III.4.1.
  - Wach-1996: Théorème, p. 380, and Remarque a), p. 381.
- Library declarations opened at the pin: Mathlib `Polynomial.cyclotomic_prime_pow_eq_geom_sum` (RingTheory/Polynomial/Cyclotomic/Basic.lean:506) and `Module.Flat.projective_of_finitePresentation` (RingTheory/Flat/EquationalCriterion). The pinned Mathlib and Tau Ceti have no Wach or Robba object.
- Cross-roadmap citations resolved:
  - PadicPeriodRings §§1.1–1.5 and 4.1–4.3 on `main`; its "Tate–Sen" label was read against its scope paragraph, line 484.
  - NoncommutativeAndEquivariantIwasawa §F.6 stage 3 (line 3963).
  - PadicLocalLanglandsForGL2Qp §0.2 (line 91).
  - WachLatticesOverTheCyclotomicTower at its head (lines 58–60, 211 and 270).
  - PadicHodgeRegulators at its open head (line 1890).
  - Within this roadmap: §§1.0, 1.3, 1.4 and 6.0–6.2.
- Automatic checks, rerun: every rule 0 except the folder-boundary rule (see below). Dependency check: `depcheck: 132 roadmaps, 1470 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on Suggested.lean gives `sorry` as the only warning. `#check @name` on both declarations matches the signatures and the README. The change leaves Suggested.lean untouched.
- Changes outside the folder: none beyond the folders the brief names as this pull request's own.

Overlap check: I read the scope of the following roadmaps.

- Open: TriangulineVarietyAndItsLocalModel, PadicHodgeRegulators, AInfCohomology, RelativeFarguesFontainePartII and PadicLocalLanglandsForGL2QpPartII.
- On `main`: PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa and PadicLocalLanglandsForGL2Qp.
- Closest by results: WachLatticesOverTheCyclotomicTower.

The objects of §§6.4–6.6 have one owner, this roadmap. WachLatticesOverTheCyclotomicTower cites them as "Corollary of", and PadicHodgeRegulators and PadicHodgeTheory consume Wach modules from §6. Nothing else is shared.

Source independence: changed passages only. 9 passages were compared with 3 sources (Berger-Wach-2004, Berger's errata, Wach-1996); they share nothing beyond formulas and dozen-word statements. The largest share is KPX, 86 of about 180 locator mentions in the body. Contents were not compared, because the change adds, removes or reorders no layer.

Research link: Layers 3–7 are the finiteness, duality and triangulation theorems of Kedlaya–Pottharst–Xiao (2012, arXiv 1203.5718) and Liu (2007, arXiv 0711.4346); Layer 6's Wach modules (Wach 1996, Berger 2004) underlie the Coleman maps and Iwasawa theory for modular forms of Lei–Loeffler–Zerbes (2010, 2011). This rests on the README's References.

## Not verifiable

- LLZ-2011 §2C, a §6.0 locator outside the change. The sources service has no licence class for the publisher's host, so the text was not opened.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review flagged 116 files when it was run without the list of this pull request's other roadmap folders; every one of them lies in a roadmap folder that this same pull request adds or revises and that is reviewed on its own, so none is a change outside the pull request's scope.

## Source issues

- none

## For the human reviewers

- Your decision on published theorems leaving the family's roadmaps was applied. WachLatticesOverTheCyclotomicTower (its README lines 58–60, 211 and 270) cites §§6.4–6.6 here, and these sections state exactly what it cites.
