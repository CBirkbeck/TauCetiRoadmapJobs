<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/110#issuecomment-6309558502 -->
Review (claude) of abe0eb1

Verdict: needs_changes

1. **F01** (P2) `local-period-fundamental-sequences` is cited as a contract but is not a declared gap

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 128: "**`local-period-fundamental-sequences`.** On the completed étale semistable charts with horizontal boundary of CN §2.2.2, require the Artin–Schreier exact sequences of CN Lemma 2.23(i) for v>0; …". Cited as `contract local-period-fundamental-sequences` in the `*Needs:*` lines of 4.2 (line 445) and 4.4 (line 479) and in the Layer 4 Dependencies (line 509).

   **Claim.** The README declares 32 supplier contracts; `design/plan.json` declares 31 gaps. The slug `local-period-fundamental-sequences` does not occur in `design/plan.json`. The README's `period-rings` paragraph (line 102) stops at "…the modified period map with lattice L_EN(r) for r≥0 (EN §2.2, p. 7, EN line 299–308)", whereas the plan's `period-rings` `needs` sentence continues with the CN Lemma 2.23(i)–(iii) and Lemma 2.37 chart statements (542 of 1102 characters agree, then the texts diverge).

   **Witness.** A string comparison of every `needs` sentence in `design/plan.json` against the README: 30 of 31 occur verbatim; `period-rings` does not. The slug set of the README's contract paragraphs minus the plan's gap slugs is exactly `{local-period-fundamental-sequences}`. The split follows the routing note F01 (P3) of `reports/REV-DESIGN-CohomologyComparisonsPartII~5.md`, which asked for a new gap "homed with the other CN chart contracts"; the package applied it to the README only.

   **Why it matters.** The intake announces gaps from `design/plan.json`. As the package stands, PadicPeriodRings would be announced the chart-level CN lemmas the README no longer asks of it, and PadicHodgeTheory would never be told of the contract that 4.2 and 4.4 consume. An acceptance's `conditional_gaps` can list only declared slugs, so the README would cite a dependency on no declared contract.

   **Exact repair.** Make the two files agree, in whichever direction the fix lane may edit. Preferred, since it is what the accepted design review asked for: add to `design/plan.json` `gaps` an entry with slug `local-period-fundamental-sequences`, supplier `PadicHodgeTheory`, section "accepted sections unavailable; CN Lemma 2.23, pp. 23–24, CN line 973–980; Lemma 2.37, pp. 28–29, CN line 1234–1239", and `needs` equal to the README's two sentences at line 128 from "On the completed étale semistable charts" to "…level s"; replace the plan's `period-rings` `needs` by the README's sentence at line 102; and give 4.2 and 4.4 in the plan the prerequisite `gap:local-period-fundamental-sequences`. If `design/plan.json` is frozen for this lane, instead restore the README's `period-rings` paragraph to the plan's full `needs` sentence, delete the line-128 paragraph, and replace `contract local-period-fundamental-sequences` by `contract period-rings` in lines 445, 479 and 509 (the latter already lists `period-rings`). In either case give the line-128 paragraph the sibling sentence form "Consume PadicHodgeTheory §§1.1–1.5,2.1–2.4, local semistable chart extension." so every contract names its consumption the same way.

2. **F02** (P3) stray character in the Lean module docstring

   **Location.** `packages/CohomologyComparisonsPartII/Suggested.lean` line 3: `/-!+# CohomologyComparisonsPartII: representative target signatures`.

   **Claim.** The module docstring must read "<Name>: representative target signatures"; the `+` after `/-!` is a typo that the rendered docstring will display as "+# CohomologyComparisonsPartII…".

   **Witness.** `sed -n 3p` of the file shows `/-!+#`; the sibling form on main is `/-! # <Name>: representative target signatures`.

   **Exact repair.** Replace `/-!+# ` by `/-! # `.

3. **F03** (P3) unbalanced parenthesis in the Koszul sign

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 322: "Provide `RigidSyntomic.cup`: products carry the Koszul sign (−1)^(ij."

   **Claim.** The exponent's closing parenthesis is missing and the sentence ends inside a code-like expression.

   **Witness.** The line as quoted.

   **Exact repair.** "…carry the Koszul sign (−1)^(ij)."

4. **F04** (P3) one Check name breaks the namespace convention

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 770: "- `ClassicalSyntomic_logRigidComparison_verticalLog`: For Y=Spec(Z_p), D empty and r=1, …".

   **Claim.** Every other Check in the file is written `Namespace.target_qualifier`; this one uses an underscore after `ClassicalSyntomic`, so a scanner keyed on the namespace prefix will miss it.

   **Witness.** The three sibling Checks of 7.4 at lines 767–769 are `ClassicalSyntomic.logRigidComparison_point`, `_gM`, `_noGoodCompactificationClaim`.

   **Exact repair.** Rename to `ClassicalSyntomic.logRigidComparison_verticalLog`.

5. **F05** (P3) a bare library numeral in a lattice example; elaboration not certified

   **Location.** `packages/CohomologyComparisonsPartII/Suggested.lean` lines 86–93, the `p = 2` lattice example, last conjunct `(2 : ZMod 2) = 0`, closed by `norm_num [enLattice, cnLattice]`.

   **Claim.** The conjunct is a fact about a library numeral, not about `enLattice` or `cnLattice`, so it tests nothing of the roadmap; and it is the one conjunct whose closing by `norm_num` is doubtful (`ZMod 2` is not syntactically `Fin 2`, so the `Fin.isValue` simproc does not fire, and `norm_num` has no `ZMod` extension). The elaboration command was not available to this review, so neither this nor any other proof script is certified; see "Not verifiable".

   **Witness.** Mathlib's `ZMod` is a `def` by cases on `n`; the literal `(2 : ZMod 2)` is `OfNat.ofNat 2` at type `ZMod 2`, and the simp lemma `ZMod.natCast_self` matches `Nat.cast`, not `OfNat`.

   **Exact repair.** Drop the conjunct, or replace it by a statement on the roadmap's own carriers, for instance that the inclusion coordinate `(4 : Padic 2)⁻¹ = 2 * (8 : Padic 2)⁻¹` already present in the same example is the factorial `Nat.factorial (2 / (2 - 1))` cast to `Padic 2`. Then elaborate the file where a build exists and confirm `sorry` is the only warning.

6. **F06** (P3) an unused hypothesis in a scalar identity

   **Location.** `packages/CohomologyComparisonsPartII/Suggested.lean` lines 128–135, `semistable_baseConvention_differentials (p r e : ℕ) (he : e ≠ 0) …`; README line 538: "…with the nonzero integer e explicitly bound."

   **Claim.** Both conjuncts are identities that hold for every `e`, including `e = 0`, since both sides are then `0` or agree termwise; `he` is never needed. The README's `baseConvention_zeroIndex` Check correctly says `e = 0` is excluded because the degree-one and degree-two scalings are not invertible, but that concerns the equivalence `semistableFiber_baseConvention`, not these two differential identities.

   **Witness.** Expand `semistableD1 p r phi ((-(e:ℚ)⁻¹) • N) (a, b, (-(e:ℚ)⁻¹) • c)`: it equals `(-(e:ℚ)⁻¹) • (N a - (c - p^(1-r) • phi c))` by linearity alone.

   **Exact repair.** Either delete `he` from the theorem and move the sentence "with the nonzero integer e explicitly bound" to the equivalence target, or keep `he` and say in the docstring that it is carried for uniformity with the equivalence, not used.

7. **F07** (P3) the period-map construction domain in 4.2 is narrower than its source

   **Location.** `packages/CohomologyComparisonsPartII/README.md` line 439: "Let X be fine saturated log-smooth over V with the canonical log structure … For every r≥0 construct the modified-lattice divided map …"; line 84: "The canonical-vertical-log domain of 4.2 and 4.5 does not supply this horizontal-log map."

   **Claim.** EN §2.2 constructs `α_r` and `α̃_r` for every log-scheme log-syntomic over `W(k)` (EN line 278–308), the same domain as the declared `nearby-cycle-inputs` contract (line 120). The README constructs them only over canonical-log `V`, and then asks CohomologyComparisons, through `rigid-syntomic-etale-period`, for the rational horizontal-log period on pairs `(Y,M)/W(k)`, whose finite-level version is EN's own `α̃_r` on that wider domain. This is a narrowing below the source for the construction (the comparison theorems of 4.3–4.5 rightly keep log-smooth over canonical-log `V`). It is not blocking because the design was accepted with this routing and the gap's commutation square with Besser's period is genuinely outside this roadmap.

   **Witness.** EN line 278: "Let X be a log-scheme, log-syntomic over Spec(W(k))"; EN line 303–305: for any `r≥0`, `α̃_r : S_n(r) → i*_sé j_sé* j′_* GZ/p^n(r)′`.

   **Exact repair.** State the construction of `α_n,r` and `α̃_n,r` in 4.2 on EN's domain (log-syntomic `X/W(k)`, with `U = X_tr ∩ X[1/p]` as in `nearby-cycle-inputs`), keep the exact and bounded conclusions of 4.3–4.5 on their present domains, and reduce `rigid-syntomic-etale-period` to the rational period and its commutation with Besser's map, which 7.4 actually consumes. Alternatively add one sentence to line 84 saying why the horizontal-log finite-level map is not constructed here.

One P2 finding (a supplier contract cited in the README that is not a declared gap in `design/plan.json`) and six P3 notes. The mathematics of all 33 targets, the 113 Checks and the nine Lean declarations was checked and found sound; no false statement, vacuous statement, unowned prerequisite, upward citation or duplication was found.

## Verified sound

**Principles.** Read the whole README (816 lines), `Suggested.lean` (164 lines), `metadata.toml`, `sources.toml` (24 records) and `design/plan.json`. The roadmap is a Part II of CohomologyComparisons: the Scope paragraph names what the base owns (§§1.11, 3.7, 4.2–4.5, 4.8, 6.3, 2.14) and what is imported; nothing of the base, of CrystallineCohomology, PadicPeriodRings, PadicHodgeTheory or PadicDifferentialEquationsAndRigidCohomology is re-planned. No good-prime or route-specific restriction: Layers 2–5 keep all primes, all weights `r ≥ 0` and ramified `V`; the AM Frobenius-lift hypothesis is confined to Layers 1, 6 and 7, with its ramified obstruction (π² = p) recorded as a Check and verified: a ring endomorphism of `V` fixing `p` preserves the valuation of `π`, so `v(F(π) − π^p) = 1 < e` when `e > 1`. No computational algorithm (7.1 is an existence-and-uniqueness statement). No source passage is copied; statements are paraphrased with locators. `Suggested.lean` has one `import Mathlib`, no `set_option`, no `lemma`, no `#eval`/`#print`/`#synth`, no sorry'd data, four `sorry` sites all in theorems, six proved examples (two per kept definition, each about the roadmap's own definitions except the conjunct of R05). No LaTeX delimiters, process words, pull-request numbers or machine paths in any package file (grepped).

**Declared gaps.** All 31 slugs of `design/plan.json` appear in the README with their supplier and section; 30 `needs` sentences are verbatim identical, one differs (R01). Each `needs` sentence read: precise hypotheses, one supplier each, none `none`; none asks for an object at the pins or on main (Mathlib supplies only the cone, the isocrystal class, abelian Ext, the `BDeRham` carriers and the ℤ_p-action; Tau Ceti only exact structures, conflation-exact functors, monoidal and opposite structures, abelian Ext and cone contractibility, all cited as contracts). Supplier sections cited for the gaps exist at the commits the author read (CohomologyComparisons `67130cb`: 1.11, 2.14, 3.7, 4.2–4.5, 4.8, 6.3; CrystallineCohomology `2c8b22a`: CR.3.2, CR.5:log-algebra.1–5, CR.5.1–CR.5.4, CR.6.1–CR.6.2, CR.6.4–CR.6.5; PadicPeriodRings `e37c9fb`: 3, 4.1–4.3; PadicHodgeTheory `13bf65f`: 1.1–1.5, 2.1–2.4; PadicDifferentialEquationsAndRigidCohomology `c01dad4`: all 38 cited RD labels). Those texts are not on main, so these are declared-gap contracts, not supplier facts.

**Sources, seeded sample (15 targets, all read at the cited lines).**

| Target | Text and lines | Result |
| --- | --- | --- |
| 1.1 | AM Definition 2.1, Remark 2.2, AM line 117–169 | `F_V(x) ≡ x^p mod pV`, `σ(x) ≡ x^p mod pB`, coherent `B_K`/`B†_K` modules, `c`, finite descending filtration with locally free graded pieces, Griffiths transversality, horizontal `Φ`, morphisms as compatible pairs: all as stated. Fibre-product description is Remark 2.2(1). AM line 138 writes "isomorphism of B†_K-algebra"; the README's module reading (References) is the correct one. |
| 1.2 | AM Remark 2.2(2), Definition 2.3, (2.1), AM line 164–217 | `B(n) = (B_K, B†_K, c, p^{-n}σ, d, Fil^{-n} = B_K, Fil^{-n+1} = 0)`; pullback Frobenius through the isocrystal equivalence; σ-independence. Agree. |
| 1.4 | AM Definition 2.4, (2.2), (2.6), AM line 224–259 | `S(M)^i = Ω^i ⊗ Fil^{-i} M_dR ⊕ Ω^{i-1}_{B†} ⊗ M_rig`, `d(ω,ξ) = (dω, (1−Φ)ω − dξ)`: the Lean `fiberCoordinatesDifferential` has exactly these signs; exactness on exact sequences at AM line 260–264. |
| 1.6 | AM Lemma 2.5, (2.10), (2.22), AM line 283–297, 795–815 | `Fil⁰H_dR = 0` gives the unique lift and `u(M) = (∇e, (1−Φ)e)`; the two projections `δ`, `R_σ`; cocycle conditions `(1−φ_{n+1})ω = dξ`, `dω = 0`. AM line 288 misprints `Fil⁰M_rig`; the README's `F⁰M_dR` is right. |
| 2.2 | BesserI Definition 6.1, Proposition 6.3 and its cone description, BesserI line 704–745 | `RΓ_syn(X,n)` as iterated cone of `RΓ_rig(X_k/K0) ⊕ Fil^n RΓ_dR → RΓ_rig(K0) ⊕ RΓ_rig(K)`; `X` smooth (separated finite type) over `V`; `k` perfect. Agree; displays are garbled (see Not verifiable). |
| 2.3 | BesserI Propositions 6.2–6.3, Definition 6.5, Remark 8.7(3), BesserI line 719–760, 1068–1080 | Finite Čech descent, long exact sequence, cup product on cones, and the `K = K0` single-fibre description. Agree. |
| 3.4 | EN §2.1.1, EN line 198–218; NN §3.2 (32)–(33), NN line 1299–1338 | Local PD presentations with `J^⟨r−•⟩`/`J^[r−•]`, independence of immersion and lifts, étale-local gluing; NN's `holim_n`, derived reduction, and the rational fibre of `(1−φ_r, γ_r^{-1})` into `RΓ_cr ⊕ RΓ_dR/F^r` via Corollary 2.4. Agree, including the arithmetic-pair domain of the NN assertions. |
| 4.3 | EN Proposition 2.1 and Theorem 2.2, EN line 186–192, 318–323; TsujiNearby Theorem 5.1 (line 944–945), Lemma 3.2 (line 679–685), proof of Theorem 5.1 (line 1074–1143) | fs log-smooth over `O_K^×`, `0 ≤ r ≤ p−2`, `S_n(r) ≃ τ_{≤r} i*Rj_* Z/p^n(r)`, no cohomology above `r`. Tsuji's reductions (tame descent, toric/`N^d` charts, stalk induction by codimension via Lemmas 3.2 and 5.2) are the proof obligations the README lists. The inverse-Cartier Check computed: `C^{-1}(t dlog t) = [t^{p−1}dt] ≠ 0`, `[dt] = 0`. |
| 4.4 | CN Theorem 1.1, §2.2.1, §5.1.2, CN line 53–57, 70–84, 413–423, 2587–2605 | `F = W(k)[1/p] = K0`, charts with `1 ≤ h ≤ e`, `0 ≤ i ≤ r`, `p^{Nr+c_p}` with `c_p` depending on `d` at `p = 2` under enough roots, `p^{N(e,p,r)}` independent of `X` and `n` in general; enough roots is `δ_K + [K:F_{i(K)}] < e/(2p)` with `δ_K = e·v_p(d_{K/F_{i(K)}})`. Agree. |
| 5.2 | NN §3.2 diagram and Proposition 3.8, NN line 1341–1391; HK (3.5) line 770, Theorem 5.1 line 1321–1342 | Square `(1−φ_r, ι)`, `N`, `(N,0)`, `1−φ_{r−1}`; log-smooth over `V^×` and Cartier type; `Nφ = pφN`; `ρ_{πu} = ρ_π exp(log(u)N)`. The degree-zero differentials `D0`, `D1` were re-derived from the fibre convention `d(a,b) = (da, f(a) − db)` and match the Lean definitions; `D1∘D0 = 0` is exactly `Nφ = pφN`. The transport `N_b = −N_c/e` was checked against CohomologyComparisons §4.5 at `67130cb` ("ρ_{πu} = ρ_π ∘ exp(−e log_K(u) N_norm)"): `exp(−e log(u)(−N_c/e)) = exp(log(u)N_c)`. |
| 6.2 | AM Definition 2.1, Remark 2.13(2), Assumption 2.20, Remark 2.21, AM line 131–142, 497–508, 627–645 | Assumption 2.20 is rigid coherence plus bijective `c`; it says nothing about algebraic finiteness, so the README's independent algebraic hypotheses are correctly separate. The `D(pt−1)` Check verified: `(1−pt)^{-1} = Σ p^j t^j` converges on radius `< p`, so `c_0` is bijective while `Q_p[t,(pt−1)^{-1}]` is not finite over `Q_p[t]`. |
| 6.5 | AM Lemma 2.19 and Remark 2.21(3), AM line 609–620, 637–645 | The proof embeds `X` in affine space; the README's affine domain is the proved statement, and the elliptic-curve Check (`H¹(E^an, O) = K`) shows the printed wording is false for proper `X`. |
| 7.1 | AM Lemma 3.8, AM line 1229–1288 | `V = Spec C` smooth affine over `W`, compatible `σ_n`, unique `W`-point with `σ_n ∘ a_n = a_n ∘ F_W` at every level, by the constancy of `φ` on fibres of reduction. Agree; the Teichmüller and `σ(t) = t^p + p` Checks recomputed (`α ≡ p mod p²`). |
| 7.3 | AM (2.1), Lemma 2.5, proof of Theorem 3.7, AM line 206–217, 283–297, 1352–1364 | Specialization at `P_a` reduces to `(Spec W, W^×, F_W)`; pullback of the unique filtered lift; the Frobenius equation enters the second component. Agree. |
| 7.4 | AM Lemma 3.10, (3.10)–(3.12), AM line 1302–1334; BesserI Remark 8.7(3), line 1073 | `Y` projective smooth over `W`, `D` relative NCD, `M` from `D`, `U = Y − D`; `c` induced by the log-crystalline/rigid and log-de Rham/de Rham comparisons; compatible with cup products and the two period maps. Agree. The vertical-log Check recomputed: `C_st` point complex at `r = 1` has `H¹ = Q_p²` against `Q_p`. |

Also read: AM Settings 2.14, 2.16, Propositions 2.15, 2.17, 2.18, Lemma 3.9, Lemma 4.2 (line 510–604, 1289–1301, 1483–1492) for 6.3, 6.4, 6.6, 7.2; EN §2.1 (line 150–196) for 3.1–3.3; EN §2.2–2.2.3 (line 276–364) for 4.2, 4.5 and the nearby-cycle gaps; CN §2.4.3 Lemma 2.23 and §2.6.2 Lemma 2.37 (line 968–980, 1234–1239) for 4.1 and the fundamental-sequence contract; HK (3.3) (line 730–739) for the non-Cartier Check; TsujiNearby Theorems A3–A4 (line 1211–1245) and Lemmas 4.3–4.4 (line 805–883). No author-flagged unverified locator exists; the sample's theorem numbers, pages and hypotheses all agree with the texts.

**Adversarial pass.**

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: `F_V` | `π² = p` at `p = 2, 3`; general `e > 1`; `e = 1` | Valuation argument forces `e = 1`, so the AM relative setting is `V = W(k)`; classical layers need no `F_V`. Not vacuous. | none |
| Conventions: fibre signs, Tate twists | `[Q —2→ Q]`; `O(1) ⊗ O(−1)`; `dlog t` | `d(a) = (0, 2a)`, connecting image `(0,b)`; `Φ = p^{-a-b}σ`; `φ(dlog t) = p dlog t` gives `H¹(G_m) = O(−1)`. | none |
| 1.1 `FilFMIC` | zero, unit, `Φe = te` on `G_m`, `S = Spec(K)` with `B† = 0` | `∇Φe = dt ⊗ e ≠ 0`; `(πT−1)` is a unit in `V[T]†`, so rigid realization is not faithful. | none |
| 1.3 exact structure | split; `Ext¹(O,0)`; identity `B → A` with `F⁰A = K`, `F⁰B = 0` | Morphism, not isomorphism; conflations need every `F^j`; tensor with locally split filtrations preserves conflations. | none |
| 1.4 `S_σ`, `fiberCoordinatesDifferential` | point `O(0)`, `O(1)`, `0`; `(1,0)`, `(0,1)` with `d_A = 0`, `d_B = id`, `f = 2` | `[Q_p —0→ Q_p]`; `Q_p` in degree 1; `(0,2)`, `(0,−1)`, `(0,0)`. Lean examples state exactly these. | none |
| 1.5, 1.6 evaluation | `Φe = e − h` over `Z_p`; `H = O(1)`, `Φe = e + ah`; `H = O(0)` | `u_1 = (0,h) ≠ 0`; `R = −ah`; without `F⁰H = 0` lifts vary by `ch`. | none |
| 2.2, 2.3 rigid syntomic fibre | `V = Z_p`, `r = 0`, `r > 0`; empty special fibre; `K = K0` | `H⁰ = Q_p` diagonal, `H¹ = Q_p`; `H⁰ = 0`, `H¹ = Q_p`; `F^rRΓ_dR`; elimination gives `Fib((1−φ_r)∘sp_r)`. | none |
| 3.1–3.4 log-syntomic | `r = 0`; `p = 2, r = 1`; `py = 0 mod p`; `ω∘τ = p^r`; tail tower `⊕_{j≥n}F_p` | Equality range `r ≤ p−1` versus exact range `r ≤ p−2`; `(p^r, id)` is a chain map `S′ → S`; `lim = 0`, `lim¹ = ∏/⊕` via the six-term sequence. | none |
| 4.1 lattices, `enLattice`, `cnLattice` | `r = 0`; `p = 2, r = 2`; `r = p−1` both endpoints | `L_EN = (1/8)Z_2(2) ⊃ L_CN = (1/4)Z_2(2)`, index 2; endpoint lattices differ by `p`; `(p^a)^{-1} = a!·(p^a a!)^{-1}` with `a! ∈ Z_p`, so `cnLattice_le_enLattice` and `modifiedLattice_generator` are true; `enLattice p 0 = cnLattice p 0 = span{1}`. | R05 (one conjunct) |
| 4.3, 4.4 period comparisons | `p = 2` (`r = 0` only), `p = 3` (`r = 0, 1`); `t dlog t`; `xy = π^h`, `h > 1`; `q > r` | Ranges and the Cartier witness as stated; charts and constants match CN; nothing asserted above `r`. | none |
| 5.1 HK adapter | `D = K0`, `N = 0`; `φ = diag(1,p)`, `Ne1 = e0`; `k[t]/t^m`, `p ∤ m`, `m > 1` | `Nφe1 = pe0 = pφNe1`; `e1 ↦ e1 + log(u)e0`; HK (3.3) gives non-bijective `φ`. | none |
| 5.2 `semistableD0`, `semistableD1`, `semistable_d_squared`, base adapter | `φ = diag(1,2)`, `N = (snd, 0)`, `p = 2`, `r = 0, 1`, `e = 2`; `D = E = 0`; `e = 0` | `D0(0,1) = ((0,−1),(0,1),(1,0))` at `r = 0` and `((0,0),(0,1),(1,0))` at `r = 1`; `D1` of both is `0`; `D1∘D0 = (p^{1−r}φN − p^{−r}Nφ)x = 0` iff `Nφ = pφN`; `[Fact p.Prime]` is needed (at `p = 0`, `r = 1` the identity fails); the `−1/e` adapter commutes with both differentials for every `e` (R06). | R06 |
| 6.1–6.4 relative data | `id_S`; empty; `P¹_S`; `D(pt−1)`; colliding sections `x = 0`, `x = t`; genus-`g` constant curve | `H²(P¹) = O(−1)` with `Φ = pσ`; algebraic non-finiteness with rigid coherence; `x² = 0` fibre fails relative NCD; ranks `1, 2g, 1`. | none |
| 6.5 | `A¹`, `G_m`, elliptic curve | `H¹ = 0`, `K dlog t`, `H¹(E^an,O) = K`. | none |
| 6.6 residue sequence | `{0,∞}`; `t² + t + 1` over `Z_2`; `D = ∅` | `Res(dlog t) = (1,−1)`; `H⁰(D) = Q_2(ζ_3)` with `σ` the conjugation, trace-zero line `Φ = −1`, twist gives `−2`; `D = ∅` is excluded by affineness (and would make the sequence false). | none |
| 6.7 | `n = 0`; `G_m`, `n = 1`; split | `F⁰(H^n(n+1)) = F^{n+1}H^n`; residue target twist `n`; projections vanish on split. | none |
| 7.1–7.5 | `σ(t) = t^p` at `0`, `[a]`; `t = p`; `σ(t) = t^p + p`; `M = 0`; `t^p − t` over `F_p`; vertical log at `r = 1`; curve `n = 1, r = 2` | Teichmüller lifts; `p^p ≠ p`; `α ≡ p mod p²`; Nullstellensatz needs algebraically closed `k`; `H¹ = Q_p²` versus `Q_p`; `F²Ω• = 0` on a curve gives the connecting isomorphism. | none |
| 31 gap contracts | `r = 0`; `p = 2`; ramified `V`; horizontal versus vertical log | Each names one supplier and precise hypotheses; none asks for what exists at the pins or on main. Declaration mismatch for one slug. | R01 |

**Duplication audit (by object).** Grepped the content repository's `TauCetiRoadmap/*/README.md` and `Completed/` and the board packages (including the ColemanIntegrationPartII design and the two open roadmap heads) for syntomic cohomology, Hyodo–Kato data, filtered F-isocrystals, Fontaine–Messing period maps and rigid syntomic cohomology: no roadmap other than this one states any of them (only incidental mentions in AdicSpacesPartIV, PerfectoidSpaces, StableReduction and others). The pinned carriers the README cites were checked in the cached pinned sources at the cited lines: `CochainComplex.mappingCone` and its four maps; `WittVector.Isocrystal`, `IsocrystalHom`, `IsocrystalEquiv`; `HasExt`, `Abelian.Ext` with `[Abelian C]`; `BDeRhamPlus`, `BDeRham` with four binders; `PadicInt.algebra`; `LinearMap.fst`, `snd`, `prod`; `TauCeti.ExactStructure`, `IsConflationExact`, `IsMonoidal`, `op`, `op_conflation_op_iff`; `nonempty_homotopy_id_zero_of_homotopyEquiv`; `IsStandardSyntomicOfRelativeDimension`; `TauCeti.ChainComplex.linearYonedaFunctor`. The nine Lean declarations specialize `Submodule.span` and linear-map operations; none re-implements a library object. The four local removals listed in `reports/PKG-CohomologyComparisonsPartII.md` are correctly routed.

**Supplier-order audit.** Dependency check output, exit 0:

```text
depcheck: 3 roadmaps, 23 edges, 0 problem(s)
```

No UPWARD or CYCLE line. All eleven suppliers precede the candidate in `merge-order/ORDER.txt` (DerivedModuleAlgebra 6, AdicSpacesPartIV 11, EnhancedDerivedSheaves 14, EtaleCohomologyFoundations 15, PadicPeriodRings 16, CrystallineCohomology 18, PadicDifferentialEquationsAndRigidCohomology 94, PadicHodgeTheory 95, CohomologyComparisons 132; candidate 133) or are on main (GrothendieckEulerForms with Layers 0 and 5 at its lines 178 and 383; RigidAnalyticGeometry). Sections cited on main all exist: RigidAnalyticGeometry 6.1, 6.2, 7.3, 7.4, 8.1, 8.4; AdicSpacesPartIV F1.5, F1.7, F1.8, F1.9, F1.12, F1.16 and the four named F1.7 targets; EnhancedDerivedSheaves 0.1–0.4, E2:towers.1, E5:abstract; EtaleCohomologyFoundations F.0.3, F.1, F.3a, F.4.1–F.4.5; DerivedModuleAlgebra 0.K.1. Every `*Needs:*` line (33 read) names earlier subsections, pinned declarations, those sections or a declared contract; all 53 internal edges point backward. ColemanIntegrationPartII (order line 129) is named only as a parallel consumer of common suppliers, never as a supplier or a dependent; its design §§3.0c, 3.1a, 7.0 exist and define no syntomic object. PadicHodgeRegulators and EllipticRegulators are named only under Downstream consumers.

**Shape and completeness.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, named roadmap sections, contracts), How to read the build, seven layers in build order with 33 prose subsections, each with hypotheses, locator, named API, a proof-dependency paragraph, `*Needs:*` and at least three Checks (counted: minimum 3, maximum 5); every layer ends with Examples and Dependencies; Downstream consumers; References. All nine Lean names occur in the README; the Lean generality equals the README's for the coordinate lattices and the semistable differentials; the Lean sections `Layer 1`, `Layer 4`, `Layer 5` carry the README titles. Sources manifest: 24 records with all bibliographic fields, 23 certified cache texts, one settled uncertified record (BesserII, consumer context only); no local path; no entry changed or added by this review.

## Not verifiable

- **Lean elaboration.** The brief's elaboration command is "not available", so `Suggested.lean` was not compiled and no `#check @name` was run; the warning count is unknown. Binder inspection by hand: every `sorry`'d theorem carries its module, scalar and Frobenius hypotheses in its own signature (no section `variable`s), so nothing silently disappears. Proof scripts were traced by hand; all six examples are mathematically true, and the only step whose automation is doubtful is the `(2 : ZMod 2) = 0` conjunct (R05).
- **BesserI displayed formulas.** The cached extraction loses the displays of Definition 6.1, (6.1)–(6.2) and Remark 8.7(3) (BesserI line 709–714, 728–735, 1074–1078). The fibre coordinates were checked through the prose, the cone description at BesserI line 741–745 and AM (3.11)–(3.12).
- **TsujiNearby proofs.** The proofs of Theorems 4.2 and 5.1 (TsujiNearby line 892–940, 1074–1143) are heavily garbled; theorem statements, hypotheses and the lemma numbers the README cites are readable and agree.
- **Supplier texts not on main.** CohomologyComparisons, CrystallineCohomology, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology and PadicHodgeTheory were read only at the commits the package author cited, which are in the content repository's object store but not on main. Section existence was confirmed there; their contents are declared-gap contracts, not supplier facts.
- **CN Corollary 3.9 exponent.** CN line 1547 prints the bound unreadably; the `local-period-annulus-entry` contract cites it by name, which is correct.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "abe0eb12950e02c9c38010c5769f87a2569184ba", "job": "REV-PKG-CohomologyComparisonsPartII", "model": "fable", "worker": "chris-f"} -->
