# Review of NoncompactQuantumSymmetry (pull request #1015 at 1a39856)

**Verdict:** needs changes

Incremental re-review of the 129 lines changed since 777a2fe (the previous review's head). The change adds a SmoothBanachRepresentations supplier for M0's Gårding calculus, a Scope bullet and a Downstream paragraph assigning the scalar Borel circle extensions, the twisted regular family, the `J_k` fibres and the abelian Fourier isomorphism to this roadmap with OperatorAlgebraDynamics as their consumer, the Layer 0 proof route for `C*(N)≅C₀(N̂)`, P.2's coefficient criterion for maps and the theorem that a second-countable locally compact Hausdorff space is Polish (also stated in `Suggested.lean`), and M1's strong-Borel/`E_ω` correspondence. The mathematics of every changed passage recomputes (table below), the gate's text scanners pass, elaboration is clean, and the dependency check reports no problem. One blocking finding: the ownership the new Scope bullet asserts is asserted in the opposite direction, for the same objects, by OperatorAlgebraDynamics at the head of its open revision, and the Downstream paragraph has a later roadmap supplying an earlier one. The remaining findings are P3, including the six P3 findings of the previous review, none of which this head repairs.

## R01 (P2) — The Borel-extension and Fourier objects are claimed by two open roadmaps, each naming the other as its consumer

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:19` ("Scalar Borel circle extensions and the abelian Fourier isomorphism are owned here too … OperatorAlgebraDynamics consumes these Borel and Fourier statements from here rather than restating them"), `:137` ("Own the abelian Fourier isomorphism for every locally compact abelian N"), `:279` (the Borel criterion for maps into `U(H)`), `:305` (`polishSpace_of_locallyCompactSpace`), `:1379` (the strong-Borel/`E_ω` correspondence), `:9010–9016` (the Downstream paragraph), and `Suggested.lean:92`.

**Claim:** this roadmap is the single owner of the Polish unitary group with its coefficient Borel structure and automatic continuity, of `E_ω` with its Mackey topology, the strong-Borel ω-representations and `λ^ω`, of `J_k(E_ω)≅C*(G,ω^k)`, and of `C*(N)≅C₀(N̂)`, and OperatorAlgebraDynamics consumes them from here.

**Witness:** OperatorAlgebraDynamics at the head of its open revision (commit "answers to the overlap cross-check", fourteen minutes before this head) says the opposite for every one of these objects. Its `README.md:33–47` declares the roadmap "the single owner" of `U(H)_s` with its coefficient Borel structure and automatic continuity, of `E_ω` with its Mackey topology, the strong-Borel ω-representations and `λ^ω` (D1.BorelPrefix), of the fibres `J_k(E_ω)≅C*(G,ω^k)` (D1.TwistedBorel) and of `C*(G)≅C₀(Ĝ)` (D4.Harmonic). These are full targets there, not deferrals: `:719` is the coefficient criterion for maps, `:726` automatic continuity (Polish source, separable metrizable target), `:730` "a second-countable locally compact Hausdorff group is Polish", `:748` Mackey's uniqueness theorem for the lcsc topology on `E_ω`, `:767` the strong-Borel correspondence with the same ℤ/2 check as this README's line 1594, `:774` the twisted regular family with the same formula, `:844` `J_k(E_ω)≃C*(G,ω^k)`, `:1642` the Fourier isomorphism with the same Gelfand route and the same injectivity of the regular quotient. Its Downstream consumers (`:2880–2889`) then state that this roadmap's P.2, M1, M2 and Layer 0 consume them from there. Two open roadmaps own the same objects and hand them to each other. OperatorAlgebraDynamics is a roadmap on main and precedes this one, so the Downstream paragraph's "OperatorAlgebraDynamics consumes … from here" also describes a supply from a later roadmap to an earlier one, whichever way the ownership is settled. The target-level acyclicity argument at lines 9014–9016 does not change that: the merge order is a roadmap-level order.

**Repair:** one owner. The rule places the owner earlier in the merge order, which is OperatorAlgebraDynamics. Delete the Scope bullet at line 19 and the paragraph at lines 9010–9016; in Layer 0 replace "Own the abelian Fourier isomorphism … of characters equal to the compact-open topology of N̂" (lines 137–150) by a citation of OperatorAlgebraDynamics D4.Harmonic for `C*(N)≅C₀(N̂)` in the positive-character convention; in P.2 cite D1.BorelPrefix for the Polish strong unitary group, the coefficient Borel structure and the criterion for maps, Pettis's theorem and the Polishness of lcsc spaces, keeping here `UA(H)`, `PU(H)`, `PUA(H)`, the local section, and the connected-group corollary; in M1 cite D1.BorelPrefix for `E_ω`'s Mackey topology, the strong-Borel correspondence and `λ^ω`, keeping the comparison of Borel multipliers with locally continuous extension cocycles; in M2 cite D1.TwistedBorel for the single-weight fibres and keep the all-weight decomposition at line 1610, which OperatorAlgebraDynamics leaves here (`:57–66`). That is the split OperatorAlgebraDynamics' own text describes, and it names that revision in the merge-order paragraph exactly as the description already names SmoothBanachRepresentations' revision. `continuous_of_measurable_hom` and `polishSpace_of_locallyCompactSpace` then leave `Suggested.lean` and the docstring names Pettis as supplied. If instead this roadmap is to keep these objects, the sentence that OperatorAlgebraDynamics consumes them from here must still go (a later roadmap cannot supply an earlier one), and the conflict is settled only when that revision drops its single-owner claim, which this README cannot do.

## R02 (P3) — `polishSpace_of_locallyCompactSpace` is a general-topology lemma, not a headline of this roadmap

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:89–95` and the docstring line 13.

**Claim:** `Suggested.lean` states the roadmap's headline theorems.

**Witness:** the statement is `∀ X [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X] [SecondCountableTopology X], PolishSpace X`: an arbitrary type and no object of this roadmap. It is a supporting lemma of P.2 (the README itself introduces it as the way M1 and M2 apply Pettis's theorem), and it is at the same time a target of OperatorAlgebraDynamics D1.BorelPrefix (`:730`, R01). It is not a one-tactic consequence at the pin (`first | infer_instance | exact?` fails; Mathlib has no `PolishSpace` instance from local compactness and no second-countability instance for `OnePoint`), so it is a genuine target, but of the README, not of the acceptance test.

**Repair:** delete it from `Suggested.lean` and from the docstring's list of stated headlines; the README P.2 keeps the statement and its ℚ Check.

## R03 (P3) — Lake's module-system warning fails the worker's build column

**Location:** `TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean:5` (`import Mathlib`).

**Witness:** the worker's gate at this head reports `build=2 FAIL`, both lines being Lake's "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`". `lake env lean` on the file is clean (seven `sorry` warnings, nothing else), so this is the header, not the content.

**Repair:** line 1 `module`, then `public import Mathlib`, the docstring, then `@[expose] public section` before the namespace; rebuild with the targeted build and confirm `build=0`.

## R04 (P3) — Definitions in Layers M0–M5 still lack Checks lists and per-target Needs lines

**Location:** as in the previous report's R01: `README.md:692` (`IsKFinite`, admissibility), the `(𝔤_ℂ,K)`-module, the system of imprimitivity, the regular orbit space and little-group data, the Pauli–Lubanski operators (`:2109`), `DNC(G,H)` (`:3501`), the kinematical bracket (`:5991`).

**Witness:** the README has seven `**Checks.**` lists, at lines 205, 238, 334, 434, 525, 569 and 594, all in Layer 0 and Layer P; none of the M-layer definitions has one, and the change set adds none.

**Repair:** as in the previous report: attach three Checks to each of these definitions from values already computed in the text, and give each numbered M0 bridge and each M4 block its own `*Needs:*` line.

## R05 (P3) — The docstring does not account for the statable kinematic normal-form theorem

**Location:** `Suggested.lean:41–45` and `README.md:5991–6010`.

**Witness:** the previous report's R02 asked either to state the eleven-case normal-form classification of the ten-dimensional bracket under the rescaling family (statable with two definitions on `(Fin 3 → ℝ) × (Fin 3 → ℝ) × (Fin 3 → ℝ) × ℝ`) or to say in the docstring that it is omitted and why. This head adds a different theorem and leaves the docstring's M5 bullet unchanged.

**Repair:** as before: state it, or add one docstring sentence naming it as omitted.

## R06 (P3) — `inducedHilbertSpace` is a bare alias of a native carrier

**Location:** `Suggested.lean:190–193`.

**Witness:** unchanged since the previous report's R03: the body is exactly `MeasureTheory.Lp K 2 μ`, and the elaborated signature tool again reports four binders as "dropped" only because the alias carries none of the topological hypotheses of the section.

**Repair:** delete the abbreviation and write `MeasureTheory.Lp K 2 d.measure` in `InducedModelData.exists_inducedRepresentation`; replace the backticked name in the README by the native one.

## R07 (P3) — Source-transcription narrative is not timeless

**Location:** `README.md:3450` ("The source transcription o…"), `:3461` ("the provisional minus-denominator factor"), `:8976` ("the faint (1/m)T"), `:8985–8986` ("Preserve faint or overwritten glyphs as source uncertainties … an indeterminate facing scan").

**Witness:** unchanged since the previous report's R04.

**Repair:** keep the mathematics (chart, inverse, pullback metric, the `Q_−` signature comparison, the acceptance table's required-comparison column) and delete the remarks about the legibility of the scan.

## R08 (P3) — Primet locator pages

**Location:** `README.md:5773`: "Primet (1983), §2, printed pp.13,15–16".

**Witness:** unchanged since the previous report's R05: `Primet1983 line 438–446` is the theorem (printed pp.15–16), and the realisation on the two-sheeted hyperboloid is §2.7 at lines 349–363, printed p.12, not p.13.

**Repair:** cite "§2.7, printed p.12, and §4, printed pp.15–16".

## R09 (P3) — Size

**Location:** the folder: 9,038 README lines, 70 more than at the previous review.

**Witness:** unchanged since the previous report's R06; a roadmap that is unwieldy is split into Parts.

**Repair:** as before: move the all-sequence contraction tables and the M6 pair, exchange and tree tables into "NoncompactQuantumSymmetry, Part II", whose introduction says that the base roadmap stops at M5.DeSitterFiber and the M6.MeasuredPair interface.

## Previous findings

- R01 — not repaired: `**Checks.**` lists exist only at lines 205–594 (Layer 0 and Layer P); no M-layer definition gained one (R04 above).
- R02 — partly repaired: a Polish-space theorem was added, but it is the lcsc lemma rather than the `PU(H)` statement, and the kinematic normal-form theorem is still neither stated nor named in the docstring (R05 above).
- R03 — not repaired: `abbrev inducedHilbertSpace … := MeasureTheory.Lp K 2 μ` at `Suggested.lean:191` (R06 above).
- R04 — not repaired: "provisional minus-denominator factor" at line 3461, "faint or overwritten glyphs … indeterminate facing scan" at lines 8985–8986 (R07 above).
- R05 — not repaired: line 5773 still reads "§2, printed pp.13,15–16" (R08 above).
- R06 — not repaired: 9,038 lines, no Part II (R09 above).

## Verified sound

**Gate and build.** The gate's text scanners run on this head from the worktree print every check at 0 and `OK` (`set_option`, `latex`, `prnum`, `sorry-data`, `residue`, `imports`, `statement-hygiene`, `readme-ids-missing`, `round-labels`, `layer-ids`, `target-ids`, `depcheck`, `stray-files`, `outside-folder` among them). The worker's targeted build reports only the two Lake module-system warnings (R03). `lake env lean TauCetiRoadmap/NoncompactQuantumSymmetry/Suggested.lean` at the head: seven `declaration uses sorry` warnings (lines 69, 81, 92, 100, 112, 128, 206), nothing else. `git diff --stat origin/main...HEAD` outside the folder is empty and the worktree is clean; the long list in the change set is the merge of main into the branch. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable` on this README prints `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`: no UPWARD, CYCLE or moved line. SmoothBanachRepresentations is not in `ORDER.txt` (a new roadmap in an open pull request by the same author, head `22e3c68`); its own suppliers (LieGroups, OneParameterSemigroups, AutomorphicFormsOnReductiveGroups, CompactGroups, BanachSpaceTheory, NoncommutativeGeometry, BanachAlgebras) all precede this roadmap, and its README names this roadmap only in a scope deferral (`README.md:11`), with no `*Needs:*` edge, so no cycle. AutomorphicFormsOnReductiveGroups at `753cac0` names this roadmap only as a consumer (`:12`, `:1313`); the upward edges the previous report noted there are gone. Note for the SmoothBanachRepresentations author: its line 11 still says this roadmap "builds the Gårding space … directly", which this head no longer does.

**Signatures.** `#check @name` on the scratch copy for the new declaration: `polishSpace_of_locallyCompactSpace : ∀ (X : Type u_1) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X] [SecondCountableTopology X], PolishSpace X`, matching README line 305. The twelve other elaborated types are unchanged from the previous review; the worker's six "looks dropped" leads are the coercion `↑H` of `[IsClosed (H : Set G)]` (present in every type) and the alias of R06. The one-tactic probe `first | infer_instance | exact?` on the new theorem fails; the six earlier sorried statements were probed in the previous review.

**Pinned declarations opened.** Mathlib `Topology/MetricSpace/Polish.lean:319` (`IsOpen.polishSpace`, as the README's route names); `Topology/Metrizable/Urysohn.lean:128` (`metrizableSpace_of_t3_secondCountable`, an instance of priority 90, the metrizability step of the route); `Topology/Compactification/OnePoint/Basic.lean:525` (`NormalSpace (OnePoint X)` for weakly locally compact R1 spaces; no second-countability instance for `OnePoint`, so the countable-base-at-infinity step is the roadmap's own); no `PolishSpace` instance from `LocallyCompactSpace` or `ProperSpace` anywhere under `Mathlib/`; `MeasureTheory/Measure/Haar/NormedSpace.lean:79` (`AddMonoidHom.continuous_of_measurable`, additive, normed, as the README says).

**Cross-roadmap citations resolved this round.**

| Citation | Where it resolves |
| --- | --- |
| SmoothBanachRepresentations Layers 0–4 | #1145 `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/README.md:76` (Layer 0: strong actions, generators, mixed word domains §0.3), `:120` (Layer 1: tests, local integrated operators §1.3, convolution and modular covariance §1.4), `:185` (Layer 2: smooth-vector Fréchet topology), `:227` (Layer 3: Lie/enveloping action §3.1, conjugation §3.2, integration by parts §3.4), `:286` (Layer 4: density); the differential dictionary at `:36–38` and `:247` is `R_X f(g)=d/dt|₀ f(exp(tX)g)`, `dπ(X)π(f)v=π(−R_X f)v`, identical to README lines 739–741; the relative link `../RepresentationTheory/SmoothBanachRepresentations/README.md` matches that folder |
| VonNeumannAlgebras V11 (positive-character transform, `‖λ(f)‖=sup|f̂|`, character space of `C*_r(N)`) | main `TauCetiRoadmap/VonNeumannAlgebras/README.md:3154`, `:3236–3237` |
| OperatorAlgebraDynamics D1/D3/D5 | main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (as in the previous review); main's D4 (`:254–275`) does not state `C*(G)≅C₀(Ĝ)`, which exists only at the open revision's D4.Harmonic (R01) |
| QuantumFoundations (Downstream paragraph) | #1771 `README.md:22`, `:65` cite P.1–P.6 including the `PUA(H)` corollary; consistent with lines 9018–9019 |

**Ownership by object.** Searched the open heads the brief lists and main for the objects of the changed passages: the lcsc-implies-Polish lemma, the coefficient criterion, Borel circle extensions with the Mackey topology, the twisted regular family, the single-weight fibres and the abelian Fourier isomorphism of the full group C*-algebra. Every hit is OperatorAlgebraDynamics #1137 (R01); VonNeumannAlgebras V11 on main owns the reduced-algebra identification and Plancherel, which Layer 0 cites rather than restates. No `Suggested.lean` in a readable roadmap declares a `TauCetiRoadmap.NoncompactQuantumSymmetry.*` name. Ownership against open pull requests whose files the brief did not give was not checked.

**Computed adversarial table.** Rows 1–86 of the previous report carry forward for every statement the diff leaves untouched. New rows for the changed statements:

| # | Statement | Instance | Values on the two sides | Result |
| --- | --- | --- | --- | --- |
| 87 | `polishSpace_of_locallyCompactSpace` | ℝ; ℕ discrete; ∅ | lcsc Hausdorff; Polish (complete metric, countable base) on each side | Pass |
| 88 | same, hypotheses needed | ℚ; uncountable discrete; Sierpiński space | ℚ: second countable Hausdorff, not locally compact, meagre in itself so not Polish; uncountable discrete: lcsc fails (not second countable), not separable so not Polish; Sierpiński: compact second countable, not T2, not metrizable | Pass (each hypothesis separates) |
| 89 | one-point compactification step | X=ℝ, K_n=[−n,n] | complements of K_n form a countable base at ∞; OnePoint ℝ ≅ S¹ compact metrizable; ℝ open in it | Pass |
| 90 | criterion for Borel maps into `U(H)` | H=ℂ, φ(x)=e^{ix}·Id; φ(x)=f(x)·Id with f non-Borel | coefficient e^{ix} Borel ⇒ φ Borel; coefficient f non-Borel ⇒ φ not Borel | Pass |
| 91 | connected group lands in `PU(H)` | G=ℝ→PUA(H); G=ℤ/2→PUA(ℂ²) by conjugation | ε∘f: ℝ→ℤ/2 continuous, constant 0; ℤ/2 lands outside PU(ℂ²), so connectedness is needed | Pass |
| 92 | `C*(N)≅C₀(N̂)`, generator image | N=ℤ, f=δ₁ | f̂(χ_z)=Σf(n)zⁿ=z; conjugate convention z̄ | Pass (matches README Check) |
| 93 | universal norm = sup|f̂| | N=ℤ/2, f=δ_a; N=ℝ, f=𝟙_[−1,1] | f̂(χ_±)=±1, sup 1 = norm of u_a; f̂(ξ)=2sin ξ/ξ, sup 2 = ‖f‖₁ at ξ=0 | Pass |
| 94 | `λ^ω` cocycle law | k=h⁻¹g⁻¹x in ω(g,h)ω(gh,k)=ω(g,hk)ω(h,k) | λ_gλ_h f(x)=ω(g,g⁻¹x)ω(h,h⁻¹g⁻¹x)f(h⁻¹g⁻¹x) = ω(g,h)λ_{gh}f(x) | Pass |
| 95 | strong-Borel correspondence | (z,g),(w,h) | (zV_g)(wV_h)=zwω(g,h)V_{gh} = image of (zwω(g,h),gh); converse W(1,g)W(1,h)=W(ω(g,h),gh)=ω(g,h)W(1,gh) using (ω,1)(1,gh)=(ω,gh) for normalized ω | Pass |
| 96 | ℤ/2 example (line 1594) | ω(a,a)=−1 | (λ_a^ω)²f(x)=ω(a,ax)ω(a,x)f(x)=−f(x); (1,a)²=(−1,e), (1,a)⁴=(1,e): order 4; untwisted λ_a²=Id | Pass |
| 97 | M0 skew-symmetry | G=ℝ on L²(ℝ) by translation, dπ(1)=−d/dx | ⟨−f′,g⟩=⟨f,g′⟩=−⟨f,dπ(1)g⟩; dπ(X*)=−dπ(X)⊆dπ(X)* | Pass |
| 98 | differential dictionary | same, test f | dπ(1)π(f)v=d/ds∫f(t−s)π(t)v dt=∫(−f′)π(t)v; R_X f=f′ | Pass (equals SBR `:38`) |

**Seeded sample.** The fifteen sampled blocks are untouched by the diff; their rows (35–37, 43–45, 52–53, 60–62, 64, 66, 70–73, 77–78, 83–86) and the source lines read for them are in the previous report and carry forward. Cited supplier sections that the diff touches were re-resolved above.

## Not verifiable

- The previous report's items stand: Bargmann 1947, Lang *SL₂(ℝ)* Ch. VIII, Mackey 1958 and Parthasarathy 1969 are paywalled; the Dooley and Grundling course notes have no legal source; the Weibel, Kechris and Wallach locators are cited from the standard numbering; Gel'fand–Naimark Eq. 188's exponent is illegible in the OCR.
- Williams, *Crossed products of C*-algebras*, Appendix D (the source OperatorAlgebraDynamics cites for the objects of R01) was not opened; R01 rests on the two READMEs' text, not on the source.

## Source issues

- none
