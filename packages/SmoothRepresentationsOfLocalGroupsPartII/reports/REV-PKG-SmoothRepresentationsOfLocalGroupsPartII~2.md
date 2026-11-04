<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1642#issuecomment-6404392166 -->
Review (claude) of e4d41bc

Verdict: accepted
Conditional on the announced gaps: `triple-centralizers-and-orbit-tables`, `steinberg-equivariant-k-theory`, `integrated-l1-gns`, `pi-admissibility`, `bounded-trace-character-limits`, `finite-product-fell-duals`, `tempered-dual-local-topology`, `induced-character-continuity`, `semisimple-parameter-cuspidal-support`

1. **F01** (P3) Section locators into CH26 and Ber92 that point at a lemma of the same number

   **Location.** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md` line 1306 (5.18): "(CH26, §6.7, PDF p. 18; CH26 line 858)"; line 1318 (5.19): "(CH26, §6.8, PDF p. 18; CH26 line 865)"; line 1342 (5.21): "(CH26, §6.10, PDF p. 18; CH26 line 881)"; line 612 (2.1): "(Ber92, Definition 27 and Proposition 40, PDF p. 83; Ber92 line 2853)".

   **Claim.** The line and page locate the cited section.

   **Witness.** CH26 line 858 is Lemma 6.7, 865 is Lemma 6.8, 881 is Proposition 6.10 (all page 18); the sections are §6.7 G₂ at line 1060 (page 22), §6.8 F₄ at line 1072 (page 22), §6.10 E₇ at line 1111 (page 23). Ber92 line 2853 is Definition 27 (page 83); Proposition 40 ("unitary representations have unitary central characters") is line 2915, page 85. The sibling locators 5.14–5.17, 5.20, 5.22 (lines 977, 991, 1000, 1036, 1140, 1085) and 5.8, 5.9, 5.12 are right; the mathematics of 5.18, 5.19, 5.21 agrees with the sections (table).

   **Repair.** 5.18: "CH26, §6.7, PDF p. 22; CH26 line 1060". 5.19: "§6.8, PDF p. 22; CH26 line 1072". 5.21: "§6.10, PDF p. 23; CH26 line 1111". 2.1: "Definition 27, PDF p. 83, Ber92 line 2853; Proposition 40, PDF p. 85, Ber92 line 2915", and the same in the Ber92 `locator` field of `sources.toml`. Tested: each new line opens the named section or proposition.

2. **F02** (P3) Seven works cited in prose have no manifest entry

   **Location.** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md` line 714 ("Bernstein 1974"), 787 ("Miličić 1973, Theorem 5"), 835/953 ("Rodier"), 943 ("Barbasch–Moy 1994"), 1180 ("Knapp–Stein's complementary-series argument"), 1543 ("Steinberg, Endomorphisms …, 8.1" and "Corvallis, §6, Lemma 6.4 and Proposition 6.7"); `sources.toml` has 19 `[[source]]` tables and none with status `waived`.

   **Claim.** Every cited work is recorded in `sources.toml`.

   **Witness.** `grep` of `sources.toml` for BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79, Ber74, "waived" and "uncertified": no hit; the References section lists only the 19 recorded works. The brief lists these seven as settled-waived keys, so this is bookkeeping, not a request for a text.

   **Repair.** Add a `[[source]]` entry for each of the seven keys with `status = "waived"`, its authors, title, year, `locator_scheme`, the locator the README uses, and `cited_for` (2.6; 3.3; 3.7 and 4.4; 4.3; 5.8; 6.1; 6.1), and list them under `## References`; cite them in the README by key at those lines. Nothing else changes.

3. **F03** (P3) 4.8's noncompact-centre clause has no route

   **Location.** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md` line 1009: "(With noncompact centre the same holds in the subset of Ĝ with a fixed unitary central character.)"; the route at line 1013 uses "Z(G) ⊆ G°, so the lattice G/G° is finite, hence trivial, Ψ(G) = 1".

   **Claim.** The displayed route proves the parenthetical clause.

   **Witness.** The clause is true, but the Ψ(G) = 1 step uses compactness of the centre. Instance: G = GL₂(ℚ_p), whose G° = ker |det| = {g : v(det g) = 0} with G/G° ≅ ℤ via v(det); ψ = (−1)^(v(det)) is trivial on G°, so ψ ∈ Ψ(G), and ψ is trivial on the centre (ψ(a·1) = (−1)^(2v(a)) = 1); σ a ramified-dihedral supercuspidal with trivial central character, σ ⊗ ψ ≇ σ, same Bernstein component, same central character; for K a principal congruence subgroup, K ⊆ ker ψ, so (σ⊗ψ)(e ∗ 1_K) = σ(e ∗ 1_K) ≠ 0 and {x ∈ Ĝ_ω : rep x (f) ≠ 0} ⊇ {[σ], [σ⊗ψ]} ≠ {[σ]}. The *Needs:* line has no item for separating the finitely many twists.

   **Repair.** Add to the route: "With a fixed unitary central character ω, the twists σ ⊗ ψ (ψ ∈ Ψ(G), ψ|_Z = 1) with the same central character are finitely many, since Z(G)G° has finite index; their K-fixed spaces are simple pairwise non-isomorphic H(G,K)-modules, so by SR.1 corner-irreducibles / hecke-module-equivalence there is f ∈ e ∗ H(G,K) with σ(f) ≠ 0 and (σ⊗ψ)(f) = 0 for every twist σ⊗ψ ≇ σ; then {x ∈ Ĝ_ω : rep x (f) ≠ 0} = {[σ]}." Add `SmoothRepresentationsOfLocalGroups SR.1 / corner-irreducibles` and `SR.1 / hecke-module-equivalence` to the *Needs:* line. Tested on the instance: with such f, σ(f) ≠ 0, (σ⊗ψ)(f) = 0, and the open set is {[σ]}.

4. **F04** (P3) Style, numbering and one undefined symbol

   **Location, witness, repair.**

   - Line 282 (0.4 Check): "the off-diagonal coefficient the coefficient π (−1) 1 is the constant −1" repeats the F06 pattern. Repair: "the off-diagonal coefficient of (−1, 1) is the constant −1".
   - Headings run 5.23, 5.25, 5.26, …: there is no 5.24 (heading list; no text refers to 5.24). Repair: renumber 5.25–5.29 as 5.24–5.28 and update every internal reference to SRU.5.25–SRU.5.29 (the "SRU.5.28" items in the *Needs:* lines of 5.4, 5.8, 5.9, 5.10, 5.27, 6.2, 7.13 and the Dependencies paragraph of SRU.5; "SRU.5.29" in 5.11). A gap in the numbering reads as a deleted target.
   - Line 1797 (7.10): `ω^j_(⌊rⱼ/2⌋)` is used without saying which weight it is; CH26 Theorem 8.5(1) (line 1369–1371) adds "the fundamental coweight of so(rⱼ) as in Proposition 6.31", and under the roadmap's CH26 numbering convention (line 25) the index matters for rⱼ ≥ 5. Repair: add that clause after the formula.

Reviewed at the pull request's head e4d41bc (`Suggested.lean` is byte-identical to the round-1 head; the README and `sources.toml` carry the round-2 repair). Round 1 raised one P2 (F01) and seven P3 findings; the repair applied F02–F08 and disputed F01. I checked every repair at this head, judged the dispute, ran the adversarial pass over every changed passage and the sampled targets, and looked for each repaired pattern in the rest of the package. All four findings below are P3; none blocks. Acceptance is conditional on the nine declared supplier gaps listed at the end.

## Round-1 findings at this head

- **F01 (P2, disputed) — settled; the dispute is correct.** The round-1 witness used χ(g) = (−1)^(v_p(det g)) on PGL₂(ℚ_p) as an "unramified character". The supplier defines Ψ(G) = Hom(G/G°, ℂ^×) with G° the subgroup generated by all compact subgroups (`TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` at its open head, SR.3.1 *unramified-characters*, lines 2492–2497), citing Ber92 Ch. II §2.1 Proposition 22 (Ber92 line 1281, p. 39: G° open normal, G/G° a lattice, G°Z of finite index). Computed: w = [[0,1],[p,0]] has w² = p·1, central, so w has order 2 in PGL₂ and lies in G°; χ(w) = (−1)^(v_p(−p)) = −1, so χ ∉ Ψ(G). With Z(G) compact, Z(G) ⊆ G°, so [G : G°] < ∞ and the lattice G/G° is trivial: Ψ(G) = 1 and the Bernstein component of a supercuspidal σ is {σ}. The round-1 refutation fails and the 4.8 route for compact centre stands. The repair's added text (README line 1013) and negative-control Check (line 1015) say exactly this. The round-1 instance does bite the parenthetical noncompact-centre clause of 4.8, which the route does not cover: see R03.
- **F02 (locators) — repaired.** Verified at the cached texts: Cas95 line 744 (definition of P_K, page 20), 760 (Proposition 2.1.5, p. 20), 858 (Proposition 2.1.15, p. 23), 964 (§2.3 distribution character, p. 25); CH26 line 789 (before (6.2), p. 17), 825 ((6.5), p. 17), 1268 (Corollary 7.5, p. 26); Aub95 line 265 (Théorème 2.3) and Corollaire 3.9 on printed page 2189 (line 423); BHV lines 11667 (Definition A.1.1, PDF p. 316), 11764 (A.1.7, p. 319), 14649 (remark after Lemma C.5.4, p. 393), 14923 (Exercise C.6.10, p. 400). README lines 157, 389, 480, 665, 679, 685, 769, 1142, 1584, 1646 and the Cas95/Aub95/BHV `locator` fields carry the new values. The same pattern recurs elsewhere: R01.
- **F03 (supplier citations) — repaired.** README lines 614, 616, 639 cite "Schur's lemma for countable coset spaces (SmoothRepresentationsOfLocalGroups SR.3a.1)"; SR.3a.1 exists at the head (SR README line 2255) and its Schur sentence is line 2357. Lines 748 and 759 cite EndoscopicTransferAndUnitaryTraceComparison §2.16 (heading at its head, line 1058) and the declared `gap:induced-character-continuity`. Lines 1654–1656 cite `gap:semisimple-parameter-cuspidal-support` on ExcursionOperatorsAndSpectralActionPartII SC3–SC4; the `ES5`/`ES7` labels are gone. The worker's citation resolution reports no cross-roadmap citation and no Lean name found nowhere.
- **F04 (pinned Steinberg) — repaired.** README lines 67–70 list `TauCeti.GL2Steinberg`, `finrank_GL2Steinberg`, `character_GL2Steinberg`, `character_GL2PrincipalSeries_one_one_eq_one_add`; at the pin they are `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean` lines 107, 130, 142, 172 with the stated contents (augmentation subrepresentation of ℂ[GL₂/B]; finrank = `Fintype.card F`; character = fixed points on GL₂/B minus 1; Ind_B 1 character = 1 + Steinberg). The 4.1 Check (line 914) is now the agreement Check in prose, and the Scope (line 7) records the GL₂ case as library-owned.
- **F05 (process narrative) — repaired.** Line 43 no longer carries the "Replaced deprecated alias" sentence; line 163 reads "NoncompactQuantumSymmetry M0"; line 1813 cites "CiF4, §3.2, the B₃ row …, p. 14; CiF4 line 584" (verified: line 584 is the B₃ row on page 14; the reviewer's "§3.1" was wrong and the fix's §3.2 is right); line 1406 states the G₂ root-lattice fact in prose. A grep for process words, pull-request numbers, LaTeX delimiters and "optional/deferred/(removed)" finds nothing.
- **F06 (style) — repaired.** Line 258 no longer duplicates "the coefficient"; line 539 reads "this is the set-closure formulation of Proposition 11.6"; line 863 reads "…dg on G, and 𝐆 split simple"; no space before a full stop remains anywhere (grep). One sibling of the duplicated-phrase pattern remains at line 282: R04.
- **F07 (ambiguous Checks) — repaired.** Line 248: "a unit vector on the axis fixed by (12)". Line 516: the ℤ/2 example now uses δ₀, δ₁ and the family π₁ = 1, π₂ = sgn (values recomputed in the table).
- **F08 (Needs hygiene) — repaired.** Line 1200 no longer lists `SRU.4 / howe-moore`. The two "no change required" items stand.

## Verified sound

**Elaboration.** `lake env lean` on `packages/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean` from the content checkout: exit 0 in 3.8 s; the only output is `declaration uses 'sorry'` at lines 71, 83, 108, 119, 131, 144 (the six theorems). Imports: `import Mathlib`, `TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov`, `TauCeti.RepresentationTheory.Continuous.Unitary.Basic`, both present at the pin. No `set_option`, `lemma`, `#eval`, `#print`, `#synth`, sorry'd data, `True` placeholder or free `Prop` field; 5 `def`s with real bodies, 6 `theorem`s, one module docstring naming each non-statable headline with its missing carrier.

**Signatures.** A scratch copy with `#check @name` for all 12 declarations elaborated (exit 0). Every elaborated type agrees with its README statement (0.1, 0.3, 0.4, 0.5, 0.7, 1.1, 1.2, 1.3, 1.5, 1.6); `godement`, `raikov` and `exists_coeff_approx_of_weaklyContainedIn` carry `[T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]` (and `[BorelSpace G]`, `[μ.IsHaarMeasure]` where a measure enters) explicitly; the two Hilbert spaces of 1.6 carry `[CompleteSpace]`. No binder was lost; nothing changed.

**Padding probe.** A scratch copy replacing each `sorry` by `first | rfl | (simp; done) | infer_instance | exact?` leaves all six goals open (six `exact?` failures at the six proof positions). No declaration restates a definition, mirrors a Check or computes a value. Every backticked name of the roadmap's own in the README (12) is declared in the Lean file, once each.

**Headline theorems.** From the Summary and Scope: Fell closure and isolated summands (1.8–1.10), smooth/unitary dual correspondence (2.6–2.7), Miličić and Tadić limits (3.3–3.4), Steinberg and supercuspidal isolation (4.7–4.8), Howe–Moore (4.5), the spherical unitary classification and its half-integral consequences (5.11, 5.23, 5.26, 5.27), nonsplit transfer (6.2–6.3), Aubert duality and Kazhdan–Lusztig parameters (7.1, 7.4), central-point unitarity and extraneous points (7.7, 7.10–7.12). Statable at the pins and stated: GNS (0.5), pure-iff-irreducible (0.7), Milman's converse (1.2), Godement (1.3), Raikov (1.5), single-coefficient approximation (1.6). The rest need the unitary-equivalence quotient and Fell topology, the reductive smooth categories, Hecke algebras and Satake parameters of SmoothRepresentationsOfLocalGroups, or Springer parameters, none of which exists at the pins; the docstring names each. No statable headline is absent; none is forced through a stand-in.

**Dependency check.** `tauceti-roadmap gate --depcheck … --movable` on the README: `depcheck: 56 roadmaps, 641 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.

**Declared gaps.** The nine slugs of `design/plan.json` (`triple-centralizers-and-orbit-tables`, `steinberg-equivariant-k-theory`, `integrated-l1-gns`, `pi-admissibility`, `bounded-trace-character-limits`, `finite-product-fell-duals`, `tempered-dual-local-topology`, `induced-character-continuity`, `semisimple-parameter-cuspidal-support`) each appear in the README under the supplier's subsection as "What <Supplier> must provide (gap:<slug>)" with a one-sentence `needs`; the README uses no other gap slug. ET §2.16 at its head (heading line 1058, "Harish-Chandra's character theorem and the Weyl integration formula") states no induced-character continuity, so that gap is minimal; the others were checked for minimality in round 1 against the supplier heads and nothing changed.

**Supplier citations resolved at this head.** SmoothRepresentationsOfLocalGroups at its open head: SR.3a.1 (line 2255; Schur sentence 2357), SR.3.1 *unramified-characters* (2492), SR.3.3 (2769), SR.3.4 (2851), SR.4.1 (3084), SR.4.2 (3179), SR.5.3 (4661). EndoscopicTransferAndUnitaryTraceComparison §2.16 (1058). Tau Ceti Steinberg declarations (above). `Representation.IsIrreducible` at the pin is `IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean` line 29), so nontriviality is on both sides of the 0.1 API bullet. The three consumers named under Downstream consumers are in the merge order. Ownership: `roadmaps grep` for Howe–Moore, Aubert, Fell topology, Milman, Kazhdan–Lusztig triple, Raikov, weak containment, spherical unitary dual finds only consumptions of the real-group Howe–Moore (GeometryOfNumbersAndQuadraticArithmetic §4.2.1 via ProbabilisticAndMetricNumberTheory), Milman–Pettis (BanachSpaceTheory), Gelfand–Raikov (VonNeumannAlgebras), QuiverRepresentationsPartII's exclusion of general Aubert duality, and NoncompactQuantumSymmetry/FactorRigidity's C*-side notions already recorded in the Scope; no second owner. Ownership against open pull requests whose files the brief does not give was not checked beyond that tool.

**Source locators verified at the text this round** (sampled targets and changed passages): BHV 11667, 11764, 14301 (C.4.1), 14340 (C.4.3), 14433 (C.4.10), 14471 (C.4.13), 14649, 14923, 16976 (F.6.4); GS23 1277–1286 (§11 opening, unitarizable = smooth vectors of an irreducible unitary), 1287 (§11.1), 1357 (Proposition 11.3), 1364 (Lemma 11.4), 1395 (11.5), 1398 (11.6), 1425 (11.7), 1179 (10.5); Cas95 744, 760, 858, 964, 969 (2.3.1); Ber92 1281 (Prop. 22), 2853 (Def. 27), 2861 (Prop. 38), 2887 (Lemma 38), 2915 (Prop. 40), 2934 (Prop. 41); CH26 789, 825, 865 (Lemma 6.8), 869–877 (Theorem 6.9: d = 0 for PGL(n), SO(2n+1); ⌊(n−1)/2⌋ for PSp(2n); n−1 for PSO(4n), PSO(4n+2); 1 for G₂, F₄, E₆; 3 for E₇; 4 for E₈, exactly as 5.11), 926–950 (Theorem 6.14, exactly the list of 5.23), 977, 991, 1000, 1036, 1060, 1072, 1085, 1111, 1140, 1172, 1192, 1268, 1352 (8.3), 1356 (8.4), 1359–1393 (8.5(1)–(5)), 1394 (8.6); CCLTV 18–24 (Howe–Moore recalled for the subgroup generated by unipotents; 4.5 states it on G with the explicit no-G⁺-invariant-vector hypothesis and G/G⁺ compact, which is consistent); Aub95 107, 265, 423 (Corollaire 3.9, p. 2189); CiF4 584; BC1 43–88 (§1.2, reduction to a smaller group and real infinitesimal character at lines 63–67, (1.2.1)–(1.2.2)).

**Adversarial table.** Values computed on each side; rows marked "change" point at a finding. Rows of the round-1 table with computed values for untouched sections (0.8, 1.1–1.3, 1.5, 1.9, 2.1, 2.4, 3.1, 3.4, 4.4, 4.6, 5.1–5.2, 5.7–5.8, 5.11, 5.13–5.22, 5.25, 5.27–5.29, 6.1, 7.1, 7.5, 7.9, 7.11–7.12) were relied on and not repeated except where re-sampled.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 4.8 route, compact centre (F01) | PGL₂(ℚ_p), w = [[0,1],[p,0]], χ = (−1)^(v det) | w² = p·1 central ⇒ order 2 ⇒ ⟨w⟩ compact ⊆ G°; χ(w) = (−1)^(v(−p)) = −1 ⇒ χ ∉ Ψ(G); Z ⊆ G° ⇒ [G:G°] < ∞ ⇒ Λ(G) = 0 ⇒ Ψ(G) = 1; component {σ} | round-1 F01 refuted; route holds | none |
| 4.8 parenthetical, noncompact centre | GL₂(ℚ_p), ψ = (−1)^(v det) ∈ Ψ, σ ramified-dihedral, ω = 1 | ψ(a·1) = (−1)^(2v(a)) = 1; σ⊗ψ ≇ σ, same component, same ω; K_n ⊆ ker ψ ⇒ (σ⊗ψ)(e∗1_(K_n)) = σ(e∗1_(K_n)) ≠ 0 ⇒ open set ⊇ {[σ],[σ⊗ψ]} | clause true, route absent | R03 |
| 4.5 example vs 4.8 control | PGL₂(ℚ_p) | G⁺ = image of SL₂: det = 1 ⇒ χ|_(G⁺) = 1; G/G⁺ ≅ ℚ_p^×/(ℚ_p^×)², order 4 (p odd); G° = G ⊋ G⁺ | consistent | none |
| 4.5 statement vs CCLTV | G⁺ cocompact | G = C·G⁺ with C compact; coefficient vanishing on G⁺ for the compact family π(c)*w ⇒ on G | holds | none |
| 0.1 Check 3 | ℤ_p on ℓ²(ℕ), g = p^m | χ_(m+1)(p^m) = e^(2πi/p); ‖π(p^m)−1‖ ≥ 2 sin(π/p) (p = 2: 2); for fixed v, g ∈ pⁿℤ_p ⇒ Σ_(k≤n) |χ_k(g)−1|²|v_k|² = 0, tail → 0 | strongly, not norm, continuous | none |
| 0.1 API finite-dim irreducibility | H = 0; H = ℂ trivial | `IsIrreducible` = `IsSimpleOrder (Subrepresentation ρ)`: false for H = 0 (⊥ = ⊤), true for ℂ; same as `Nontrivial H ∧ …` | equivalent | none |
| 0.2 Checks | ι = ∅; ι = ℕ, Hᵢ = ℂ | lp = 0; (1/(i+1)) has Σ 1/(i+1)² = π²/6 − 1 < ∞ and infinite support | algebraic sum proper, dense | none |
| 0.3 Check 6 (repaired) | v on axis fixed by (12); v on axis of (13) | Gram [[1,1],[1,1]], values 4 and 0; other axis: ⟪v,(12)v⟫ = cos 120° = −½ | repaired text correct | none |
| 0.5 GNS | g, a arbitrary | c(π_φ, Φe)(g) = ⟪Φe, Φg⟫ = K(e,g) = φ(g) (`inner_kolmogorovFeature`, second-linear); ‖Φ(ga)−Φ(a)‖² = 2φ(e) − 2Re φ(a⁻¹ga) → 0; φ ≡ 1: K ≡ 1, radical = {Σcᵢ Φ(gᵢ) : Σcᵢ = 0}, dim 1 | holds | none |
| 0.6 unitary dual | G = ℤ/2; G trivial | P₁ = {φ(1) = t ∈ [−1,1]}; kernel [[1,t],[t,1]] has rank 2 for |t| < 1 ⇒ GNS 2-dim, reducible; irreducible iff t = ±1 ⇒ 2 classes = Pontryagin dual; trivial G: 1 class | holds | none |
| 1.6 counterexample (repaired) | ℤ/2 regular, δ₀; π₁ = 1, π₂ = sgn | c(σ,δ₀) = (1, 0); c(1,1) = (1,1); c(sgn,1) = (1,−1); finite group ⇒ uniform approximation = equality | reducible σ fails single-coefficient form | none |
| 1.8 sum/closure | T = ∅; ℤ, T = rational-angle characters | ⊕_∅ = 0; c(v)(e) = 1 vs empty sum 0 ⇒ rep x ⊀ 0 ⇒ S = ∅ = closure ∅; closure T = circle, e^(inθ) → 1 uniformly on finite sets as θ → 0 | both directions; matches BHV F.6.4 line 16976 | none |
| 2.1 Checks | ℚ_p^×, χ = (−1)^(v); |·|_p; ℤ unipotent | |χ| = 1 ⇒ unitarizable; ‖χ(p)v‖ = p⁻¹‖v‖; (0,1) ↦ (n,1), norm² n²+1 | as stated | none |
| 2.7 bijection | G = F^×; GL₂ Steinberg | irreducible unitarizable smooth = unitary smooth characters, completion ℂ; St square-integrable mod centre ⇒ point of PGL₂ dual; GS23 lines 1283–1286 | holds | none |
| 3.2 independence | GL₂(ℚ_p) | Θ_(i_B δ^(1/2)) = Θ_1 + Θ_St (additivity); 1 ≇ St ⇒ independent (Cas95 2.3.1, line 969); i_B(δ^(1/2)) ≇ 1 ⊕ St with equal characters | determined only up to semisimplification | none |
| 3.1 van Dijk bullet (repaired) | ET §2.16 at head | heading line 1058: character theorem and Weyl integration; no induced-character statement | gap minimal, cited | none |
| 4.1 Check (repaired) | 𝐆 = GL₂, q = 3; q = 2 | pin: finrank = card F = 3 (2) (line 130); character = fixed points − 1 (142); Ind_B 1 = 1 + St (172); ℂ[Γ/B] degree q+1 = 4 (3) | agrees with library | none |
| 4.7 rank hypothesis | r = 1; r = 2 | 2^r = 2 constituents {1, St}, both unitarizable ⇒ no contradiction; 2^r = 4 > 2 | r ≥ 2 needed, as stated | none |
| 4.9 rank 0 and A₁ | W = 1; GL₂(𝔽_q) | empty Coxeter complex, H̃_(−1) = ℤ, sum over J ⊆ ∅ = trivial, degree q⁰ = 1; |ℙ¹(𝔽_q)| = q+1, perm − 1 of degree q | holds | none |
| 5.4 endpoint twist (repaired) | PGL₂, s = diag(t,t⁻¹), t = −q^(1/2) | χ_s(diag(ϖ,1)) = t = (−1)·q^(1/2) ⇒ twist by (−1)^(v det), trivial on 𝐆(O), ∉ Ψ(PGL₂) = 1 | consistent with 4.8 | none |
| 5.11 d-values | all types | CH26 Theorem 6.9 lines 872–877 list exactly the README's d | matches | none |
| 5.18, 5.19, 5.21 statements | G₂; F₄; E₇ | ⟨3α₁^∨+2α₂^∨, ½ω₂⟩ = 1 (wall) ⇒ {0}; ⟨(2,0,0,0),(½,0,0,0)⟩ = 1 ⇒ {0}; ⟨γ^∨, ½ω₇⟩ = ½ ⇒ {0, ½ω₇} | mathematics right, line locators wrong | R01 |
| 5.23 list | all types | CH26 Theorem 6.14 (lines 926–950) case by case: PGL(n) even {0,½ω_(n/2)}; SO(2n+1) {0,½ω₁}; PSp {0,½ωₙ}; PSO n even {0,½ω₁,½ω₂,½ωₙ}, n odd {0,½ωₙ}; E₇ {0,½ω₇}; else {0} | matches | none |
| 7.1 sign convention | GL₂; torus; supercuspidal rank 1, 2 | D[1] = [i_B r_B 1] − [1] = [i_B δ^(−1/2)] − [1] = ([1]+[St]) − [1] = [St]; Δ = ∅ ⇒ D = id; (−1)^(|Δ|) = −1, +1 | as stated | none |
| 7.2 parameter | GL₂, 1 and St | L^ss = |·|^(1/2) ⊕ |·|^(−1/2) for both; N = 0 vs N ≠ 0 | holds | none |
| 7.5 IM convention | (T_s+1)(T_s−q) = 0 | T_s⁻¹ = (T_s − (q−1))/q; −qT_s⁻¹ = −T_s + (q−1): q ↦ −1, −1 ↦ q | trivial ↔ sign, AZ(St) = 1 | none |
| 7.10 Theorem 8.5(1) | Sp(6), O = (2,2,2); all rⱼ ≤ 2 | r₂ = 3, ⌊3/2⌋ = 1, one ε ⇒ ½h + ½ω = (½,½,½) + ½(1,0,−1) = (1,½,0) ~ (0,½,1), norm² 5/4 ≠ 3/4; empty sum ⇒ none | matches CH26 lines 1369–1371, 1394 | R04 (undefined ω symbol) |
| 7.11 "none for G₂, E₆" | CH26 8.5 cases | cases (1)–(5) are Sp, Spin, F₄, E₇, E₈ only | holds | none |
| 7.13 reduction | s_c central; G₂ witness | Z(s_c) = G^∨ ⇒ 5.10; coroot values −1, ±q^(1/2), −q: q^(1/2) = q iff q = 1, −q ≠ q^(±1) ⇒ irreducible for q ≥ 2; centraliser roots with a even: A₁ × Ã₁ | holds | none |
| `godement` integrand | f ∈ C_c, φ ∈ L^∞ | |f(x) f(y) φ(y⁻¹x)| ≤ ‖f‖²_∞ ‖φ‖_∞ on supp f × supp f, integrable ⇒ no junk-zero integral; f* = Δ(y⁻¹) conj f(y⁻¹) substitution cancels Δ | same as BHV C.5.3 | none |
| `raikov` filter form | net ↔ filter | filter convergence in C(G,ℂ) (compact-open) ⇔ net convergence; BHV C.5.6 is the net statement on P₁ | equivalent | none |
| `extremePoints_closure_convexHull_subset_closure` | ℓ²(ℕ), S = {eₙ} | 0 = lim (e₁+⋯+eₙ)/n ∈ C, extreme in the positive cone, dist(0,S) = 1 | compactness hypothesis present | none |
| 1.4 non-closedness (repaired locator) | S¹, χₙ | ⟨χₙ, f⟩ → 0 (Riemann–Lebesgue), χₙ(1) = 1, 0 ∉ P₁; BHV line 14649 and Exercise C.6.10 line 14923 | holds | none |
| 2.3 non-example (repaired locator) | GL₂, i_B(δ^(1/2)) | Hom(1, i_B δ^(1/2)) = 0 and 1 a quotient ⇒ non-split; Cas95 2.1.5/2.1.14 lines 760, 858 | needs unitary structure | none |

## Not verifiable

- `BM94`, `KS71`, `Mi73`, `Rodier81`, `Steinberg68`, `Borel79`, `Ber74`: waived; cited by locator only (2.6, 3.3, 3.7/4.4, 4.3, 5.8, 6.1). The statements attributed to them are the standard ones and agree with the secondary sources read (GS23, CH26, BC1, BC3, Ber92). Their absence from the manifest is R02.
- BHV Exercise F.6.4, last sentence (line 16979): the extraction reads "weakly equivalent iff S = T"; the README says closure S = closure T, which is the correct statement. The extraction cannot show overlines, so I do not record this as a source issue.
- Kato81 Theorem 2.2 (line 229): the OCR garbles the definition of e(λ); the two-condition shape was verified, not the exact form.
- CH26 Theorem 8.5(3)–(5) tables: copied correctly (lines 1384–1393); the F₄ B₃ correction and the Sp(6) example were recomputed, the E₇/E₈ points were not.
- Ownership against open pull requests whose files the brief does not give was not checked beyond the roadmap grep tool.

## Source issues

- **Misprint** in Ber92 at Ch. IV §1.1, printed page 84–85: the two lemmas after Proposition 39 are numbered Lemma 38 and Lemma 39, repeating the numbers of Propositions 38–39 on the same pages; it should be distinct numbers; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e4d41bc", "job": "REV-PKG-SmoothRepresentationsOfLocalGroupsPartII~2", "model": "fable", "worker": "fable-rev154"} -->
