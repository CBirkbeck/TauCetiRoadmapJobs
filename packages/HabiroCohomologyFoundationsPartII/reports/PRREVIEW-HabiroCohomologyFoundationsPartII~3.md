# Review of HabiroCohomologyFoundationsPartII (pull request #1466 at 729dbcb)

**Verdict:** accepted

No finding. The previous review read this same head; its single finding is repaired outside the roadmap folder, and the whole roadmap was re-reviewed as below.

## Previous findings

- **R01 (P2, obsolete supplier-gap inventory): repaired.** The previous review asked for the fourteen obsolete entries to be deleted from the plan's top-level `gaps` list, with no README change ("Delete the fourteen obsolete entries from the plan's top-level `gaps` list. Keep the existing section-level imports and §0.1 construction targets"). `packages/HabiroCohomologyFoundationsPartII/design/plan.json` now reads `{"gaps": []}`; the brief records "gaps this roadmap declares: none declared". The README's only `gap:` tokens are `gap:cardinal-interchange` and `gap:light-countable-ab6` (3 occurrences each), which name SolidAnalyticRings' own declared gaps (its README lines 71 and 79 state them as "What EnhancedDerivedSheaves must provide" and "What VStackSheavesAndLisseCategories must provide"); this README reports them as inherited markers of the §6.4 contract and declares nothing. The settled finding FIX-RT~2 F02 (spectral prerequisites belong to RefinedTraceMethods) is not re-raised: §0.1 now owns the two constructions with a route.

## Verified sound

**Gate and build.** The worker's gate at this head passed every check (set_option, LaTeX, pull-request numbers, sorry'd data, imports, layer and target ids, dependency check, metadata, stray files, outside-folder, build). Independently: `lake env lean` on `TauCetiRoadmap/HabiroCohomologyFoundationsPartII/Suggested.lean` exited 0 in 24 s with no diagnostics; the worktree is clean and the outside-folder diff against `origin/main` is empty. The file has a single `import Mathlib`, the module docstring "HabiroCohomologyFoundationsPartII: target signatures", the namespace, and no declaration; so there is no `#check @name` to compare, no section variable to lose, no one-tactic padding probe to run, and no `sorry`. The dependency check returned

```text
depcheck: 204 roadmaps, 1662 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 313, after HabiroNumberFields (307), HabiroRings (308) and RefinedTraceMethods (309) and before HabiroNahmSeries (316).

**Headline audit.** The README names nine headlines (relativeFormalEtaleLift, sphericalPerfection, tracePair, traceHabiro, quotientLift, perfectedLiftNaive, tracePair_quasiRegular, canonicalFramedTrace, numberFieldTraceExports). Each needs a carrier absent at the pins (connective E∞-ring spectra, enhanced filtered modules and pairs, relative THH over ku, cyclonic spectra, genuine fixed points); Mathlib at `6b7abb3c` and Tau Ceti at `a91d3aaf` contain no spectrum, no filtered enhanced module and no Habiro, q-Hodge or THH object (searched the pinned trees for `THH`, `Habiro`, `qHodge`, `Cyclotomic` spectra, `Spectrum` ring objects: none). The docstring names all nine with the missing carrier, so stating nothing is correct. The statable arithmetic predicates (the exponent conditions, the inversion condition and its two-and-three unit lemma) are README definitions and Checks, and stating them would be padding; they are rightly absent.

**Source verification (seeded sample, all ten targets).** Every locator was opened at its line in the cached texts and its printed page recomputed from the page markers (KU, QH, TC, Bu, GSWZ, HA all agree with the README's pages; KU §6 printed pages 81–87 sit on PDF pages 86–92, QH §4 printed 55–67 on PDF 100–112, and the README cites printed pages). No locator is flagged unverified; all eight manifest entries are `certified`.

| Target | Text opened | What the source supports, with hypotheses |
| --- | --- | --- |
| §0.1 lifts and perfection | HA line 52724 (Thm 7.5.0.6, p.1374): étale E_k-A-algebras ≃ étale π₀A-algebras, 2 ≤ k ≤ ∞; HA line 51577 (Cor 7.4.1.28, p.1346): Postnikov maps are square-zero; KU line 3705 (Ex 6.9, p.83): the p-completely formally étale B̂′_p "lifts uniquely" asserted without proof; KU line 3902 (Lemma A.1, p.87): can : S_A ≃ S_A^{tC_p}, colimit of φ^{tC_p}, uniqueness via spherical Witt vectors; TC line 1304 (3.4, p.31): ℤ_p{x}_∞ lifts, x ↦ p lifts to an E∞-map | The ordinary theorem and the perfection map are cited correctly; the completed relative lifting equivalence is stated as a target with a route, not attributed to HA. |
| §1.1 inputs | KU lines 973–1000 (3.1–3.2, p.24): (tC_p) base datum with S¹-equivariant E∞ Frobenius; (E₂) lift or (E₁) p-torsion-free cover with relatively semiperfect R_∞/p and lifted Čech diagram; KU 1949–1958 (4.18, p.46): global Tor-amplitude [0,1], bounded p^∞-torsion, branch may vary with p; KU 2103–2106 (4.18a, p.49): (E₁) at 2, automatic if 2 invertible; KU 188–197 (1.11, p.5): ku-lift counterexample ℤ_p{x}_∞/x | Matches the category's object condition, the condition at 2 and the kuLift Check. |
| §1.2 trace pair | KU 2107–2142 (4.25–4.26, pp.49–50): ψ⁰_R from the product of local ψ⁰ and the Hodge-completion map, F defined as the pullback along gr⁰; KU 2143–2152 (Thm 4.27, p.50): completed F ≃ Σ^{−2∗}gr^∗, mod β Hodge, rational combined; KU 2153–2158 (Rem 4.28): E_{n−1} from E_n lifts or (E₁); KU 1598 (4.8, p > 2), 1796 (4.14, p = 2, (E₁)) | The pair clauses, the "only the completion has the trace description" caveat and the E_{n−1} bound are as cited. |
| §1.3 descent | QH 1089–1104 (Thm 3.11, p.25): symmetric monoidal factorisation through Habiro-complete objects; ascending q-Witt filtration on the quotient with gr ≃ Σ^{−∗}qW_m dR^∗; QH 1010–1022 (3.8–3.9, pp.23–24): conjugate filtration at m = 1; QH 1174–1184 (Cor 3.13, p.27): étale case is H_{R/A}; KU 3556–3600 (Thm 5.63, pp.79–80): ℤ[β^{±1}]-linear equivalence with the KU fixed-point limit under 4.18 + 2 ∈ R^× + (A₂); KU 3142–3149 (5.43 (A₂), p.70) | The cyclonic comparison is a module equivalence with exactly the stated hypotheses; KU calls its left side the Habiro–Hodge complex (KU line 234). |
| §2.1 quotient lifts | Bu 50–62 (Thms 1.4–1.5, p.2): E_n on A/v^q for q > n given a unital multiplication on A/v; Bu 86–88 (fn 4): 2Q₁(v) = 0, automatic when 2 invertible; Bu 474–488 (Rem 5.5, 5.7, p.12): squares of even classes qualify; v = 4 gives E_n on S/2^{2(n+1)}; KU 3682–3704 (Ex 6.8): E₂ for even α ≥ 6 or α ≥ 3 with 2 invertible, E₁ for even α ≥ 4 or α ≥ 2; KU 3705–3719 (Ex 6.9); TC 1262–1312 (3.3–3.4, pp.30–31): high-powered, x ↦ p specialisation by v-compatible uniqueness | The two exponent predicates reproduce Bu/KU exactly; sufficiency only is claimed. |
| §2.2 criterion | QH 2743–2758 (4.17, p.60): p-quasi-lci algebras are p-complete by convention; QH 2860–2875 (Thm 4.22(b), pp.62–63); QH 2876–2886 (Rem 4.23); QH 2970–2988 (Lemmas 4.26–4.27, pp.64–65); KU 1908–1921 (Thm 4.17, p.45): preimage description, independence of the E₁ lift | Hypotheses (p-complete, p-torsion free, p-quasi-lci, relatively semiperfect mod p, E₁ lift of R_∞) are reproduced verbatim in meaning; the p = 2 inclusion is QH's. |
| §2.3 quasi-regular pairs | QH 3026–3051 (Constr 4.28, Thm 4.29, p.66); QH 3075–3077 (Rem 4.31, p.67); KU 1901–1904 (§4.3 setup, p.45); KU 2162–2171 (Lemma 4.29, p.51) | The global identification is honestly stated as assembly of the local theorem with the two gluing squares; neither source states it. |
| §3.1 framed agreement | QH 2501–2509 (Rem 4.4, p.55): F_n → F_□ via the counit, equivalence mod (q−1); QH 2522–2530, 2556–2560 (Lemmas 4.6–4.7, pp.55–56); KU 3726–3733 (Thm 6.10, p.83): all relative dimensions, no prime inverted; KU 3873–3876 (Rem 6.14, p.86): E∞ and derived commutative | The canonical side keeps the small-prime inversion, the trace side does not; the common domain is correctly described. |
| §4.1 inversion and realisation | KU 3880–3890 (Cor 6.15, p.86): Δ divisible by 6 and by disc(F), H ≅ π₀ lim_m (THH(KU⊗S_R/KU)^{C_m})^{h(S¹/C_m)}; GSWZ 255–258 (p.6): Δ positive, divisible by the discriminant, R finite étale over ℤ[1/Δ] | Order of operations and the unexplained factor 3 are as in the source. |
| §4.2 exports | GSWZ 260–276 (Def 1.1, (12)–(13), pp.6–7): f_m(x + ζ_{pm} − ζ_m) = (φ_p f_{pm})(x) with φ_p the completed Frobenius; relation trivial at p ∣ Δ; GSWZ 262–265 (fn 1); QH 1174 (Cor 3.13) | The prime-edge relation, its triviality at p ∣ Δ, and the full coefficient algebra R^∧_p[ζ_{pm}] match. |

Also read: BMS2 line 252–276 (Thm 1.12, pp.6–7: gr⁰TC⁻ = gr⁰TP = Δ̂ with Nygaard filtration, gr¹TP = Δ̂{1}[2]); BS line 3898 (Thm 15.3, pp.103–104: Lη_I factorisation) and line 3960 (Prop 15.7, p.105: π₀TP(S/S[u]) is the Nygaard-completed Frobenius twist for quasiregular semiperfectoid S); KU 1117–1122 (Rem 3.10) and KU 3741–3790 (Lemma 6.11) for the Source issues below.

**Computed adversarial pass.** One row per statement; each row records the values on both sides. The rows cover the sampled targets, the nine headlines, the API laws and Checks they touch, and the conventions.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Rees sign and grading | i = 1 | βt = h; mod β: h = 0; mod h: only βt = 0, β and t survive | Convention consistent with QH 3.9 proof (QH line 1027). |
| Filtered quotient convention | Fⁱ = h^{max(i,0)}ℤ[[h]], i = 0,1,2 | cofib(h: F^{i−1} → F^i) = ℤ, 0, 0; degreewise cofib(h: F^i → F^i) = ℤ, ℤ, ℤ | Only the filtered convention gives fil_Hdg of ℤ; matches QH 3.1 (line 850). |
| q-integers | r = 0,1,2 at q = 1 | [0]_q = 0, [1]_q = 1, [2]_q = 1+q ↦ 2; constants have differential 0 | Keep. |
| Ordinary étale lift of ℤ[1/6] | T = S | π₀ = ℤ[1/6]; π₁ = (ℤ/2)[1/6] = 0 (2 invertible kills ℤ/2) | Check correct. |
| Lift of ℤ₂ over S₂ | p = 2 | π₁(S₂) = ℤ/2 ≠ 0 = π₁(Hℤ₂) | Spherical carrier necessary; Check correct. |
| Perfect free δ-ring specialisations | x ↦ p versus x ↦ 0 | reductions differ by p ≠ 0 in ℤ_p; cofibres of x² after base change: S_p/p² versus S_p ⊕ ΣS_p | Marking excludes the zero specialisation. |
| sphericalPerfection on toric base | A = ℤ_p⟨x⟩, p = 2, 3 | can⁻¹∘φ reduces to x ↦ x^p; x has no preimage in 𝔽_p[x]; stage n+1 class is a p-th root of stage n | can ≠ φ; colimit is the perfection. For A = ℤ_p: endomorphism = id, colimit S_p; A = 0 gives 0. |
| Completed localisation Check | f = Σ p^{n²}x^{−n}, radius |p|^{2m} | exponent n² − 2mn minimised at n = m: −m²; m = 1,2,3 give −1, −4, −9 | f is transcendental; ℤ_p⟨x⟩ → ℤ_p⟨x,x⁻¹⟩ is not ordinarily étale although completed cotangent vanishes (mod p it is 𝔽_p[x] → 𝔽_p[x,x⁻¹]). |
| Relative root tower | A = ℤ[x], B = A[t^{1/n}] | relative Frobenius of B/p over 𝔽_p[x] is Frob on 𝔽_p[t^{1/∞}] ⊗ id on 𝔽_p[x]: iso, so completed cotangent 0; x has no p-th root in B/p; t^{1/(N+1)!} ∉ 𝔽_p[x,t^{1/N!}] | Neither finitely presented nor absolutely perfect; relative lifting is genuinely broader. |
| Markings and base change | T = (S[x])^∧_p, C = (ℤ_p⟨x⟩)² | unmarked automorphisms of T×T over T: {id, swap} (2 components); fixing the marking: 1; base change along x ↦ 0: S_p×S_p with reduction ℤ_p² | Marked mapping-space law is the right statement. |
| Nonflat scalar extension | A₀ = ℤ_p⟨t^{1/p^∞}⟩, C = ℤ_p, A₀′ = A₀/(t) | C ⊗^L (A₀ --t--> A₀) = (C --0--> C): π₀ = π₁ = ℤ_p; both C/p and A₀/p perfect so (L_{C/A₀})^∧_p = 0 | Staticity hypothesis in the base-change law is necessary. |
| TraceInput.rationalAmplitude | R = ℚ[u,v]/(u,v)² | ideal height 2, minimal generators 3 (u², uv, v²), so not lci and L_{R/ℚ} has Tor-amplitude outside [0,1]; every R̂_p = 0 | Global amplitude condition is separate from local ones. |
| TraceInput at 2 | R = ℤ[x] with S[x] | (E₂) available at every p, but 4.8 is proved for p > 2 only (KU line 1598); at 2 the (E₁) cover ℤ₂⟨x⟩ → ℤ₂⟨x^{1/2^∞}⟩ | Condition (R₂) correctly imposed. |
| TraceInput.invertTwo | R = ℤ[1/2] | R̂₂ = 0 satisfies (E₁) trivially | "Unless R̂₂ = 0" agrees with KU 4.18a. |
| ofEtale relative semiperfectness | R étale over A | relative Frobenius R/p ⊗_{A,φ} A → R/p is an isomorphism | Identity cover admissible. |
| tracePair_unit | A = R = ℤ | F^i = h^{max(i,0)}ℤ[[h]]; F/β = ℤ in degrees ≤ 0, 0 in degrees > 0 = fil_Hdg of ℤ | Clause (b) holds. |
| tracePair_zero | A = ℤ, R = 0 | dR_{0/ℚ} = ℚ (0 = ℚ ⊗^L_{ℚ[y]} ℚ along y ↦ 0, 1; the resolution ℚ[y] --y--> ℚ[y] tensors to ℚ --1--> ℚ, acyclic; dR of polynomial rings is ℚ); dR_{0/𝔽_p} = 0 (conjugate filtration with zero graded pieces); fracture square gives dR_{0/ℤ} = ℚ, qdR_{0/ℤ} = ℚ[[h]]; F^i = qdR for all i; completion lim_n cofib(id) = 0; F/β = ℚ constant = fil_Hdg dR_{0/ℤ} since L_{0/ℤ} = 0 | Clause (a) excludes defining F as the completed object. |
| tracePair_etaleUncompleted | A = ℚ, R = ℚ(i), k ≥ 1 | F^k = ℚ[[h]] ×_{R[[h]]} h^kR[[h]]: H⁰ = ℚ[[h]] ∩ h^kR[[h]] = h^kℚ[[h]], H¹ = R[[h]]/(ℚ[[h]] + h^kR[[h]]) = (R/ℚ)[[h]]/h^k; (F/β)^k = cofib(h: F^{k−1} → F^k) has H⁰ = 0, H¹ = R/ℚ for k ≥ 1 and (F/β)⁰ = ℚ; fil^k_Hdg dR_{R/ℚ} = fib(ℚ → R) = (R/ℚ)[−1] for k ≥ 1 (gr^k = ∧^kL[−k] = 0), fil⁰ = ℚ | Both sides agree degreewise: the uncompleted pullback pair satisfies (b); the static h-adic substitute has zeroth step R[[h]] ≠ qdR and fails (a). |
| tracePair_polynomial | R = ℤ[x], i = 1, 2 | completed steps [h·B → B dx], [h²B → hB dx], B = ℤ[x][[h]] (KU line 93) | dx carries coefficient (q−1)^{i−1}; h^iqΩ would be wrong. |
| tracePair_multiplicative | n = 2, ∞ | guaranteed output E₁, E∞ | No E∞ from a bare E₂ lift (KU line 2153). |
| traceHabiro_hCompletion | ℤ[x]; 1, x, x² | q-Hodge complex differential: 0, h, q² − 1; qdR: 0, 1, 1+q; at q = 1: 0,0,0 versus 0,1,2 | h-completion is qHdg, not qΩ. |
| traceHabiro_qWittGraded / mOne | ℤ[x], m = 1 | qHdg/h has zero differential: H⁰ = ℤ[x], H¹ = ℤ[x]dx; F/β is Hodge: H¹ = ⊕_{r≥1}(ℤ/r)x^{r−1}dx | Different objects, not exchanged. |
| traceHabiro_zero | R = 0 | colim(ℚ[[h]] →h ℚ[[h]] → ⋯) = ℚ((h)); its (q^m − 1)-completion = 0 since q^m − 1 = h·unit acts invertibly; H_{0/A} = 0 | Descent of a nonzero uncompleted pair can vanish. |
| traceHabiro_etale h-completion | R étale | F̂^i → F̂^{i+1} is h^iR[[h]] → h^{i+1}R[[h]], an isomorphism; colimit R[[h]], h-complete | Matches §4.2's hCompletion law. |
| traceHabiro_cyclonic hypotheses | ℤ[1/6], m = 1 | C₁ = {1}: genuine fixed points = id, term TC⁻; needs 2 ∈ R^× and (A₂) | Exactly KU 5.63's hypotheses (line 3556). |
| E1QuotientExponent | α = 0..7 | p = 2: 0,0,0,0,1,0,1,0; p = 3: 0,0,1,1,1,1,1,1 | Even ≥ 4 at 2; ≥ 2 otherwise. |
| E2QuotientExponent | α = 0..7 | p = 2: 0,0,0,0,0,0,1,0; p = 3: 0,0,0,1,1,1,1,1 | Distinguishes the E₂ tower. |
| E₂ ⇒ E₁ | all natural p, α | lower bounds 6 ≥ 4 (even) at 2 and 3 ≥ 2 otherwise | Implication holds without primality. |
| quotientLift at odd p | T p-complete, y ∈ π₀T | π₀T is a ℤ_p-algebra (derived p-complete), so 2 is a unit; 2Q₁(y) = 0 gives Q₁(y) = 0 (Bu line 87); v = y, E_n for q > n | α ≥ 2 gives E₁, α ≥ 3 gives E₂. |
| quotientLift at p = 2 | v = y² | Q₁(y²) ≡ 0 mod y² (Bu line 478); T/y^{2q} is E_n for q > n: α = 2q ≥ 4 for E₁, ≥ 6 for E₂ | Evenness is forced by the tower used. |
| Moore towers | S/9, S/16, S/64 | p = 3, α = 2 > 1: E₁; v = 4, q = 2 > 1: E₁; v = 4, q = 3 > 2: E₂ | Agrees with TC 3.3–3.4 after x ↦ p. |
| Sufficient, not necessary | S/8 | α = 3 fails the predicate at 2; Bu Thm 1.1 (line 27) gives E₁ by a separate argument | Claim correctly limited. |
| High-powered integers | 1, 9, 16, 64, 8, 32, 12 | 1: vacuous; 9: v₃ = 2; 16: v₂ = 4; 64: v₂ = 6; 8: v₂ = 3; 32: v₂ = 5; 12: v₃ = 1 | true, true, true, true, false, false, false (TC line 1262–1264). |
| quotientLift_perfected versus §2.2 | A = B = ℤ₃, R = ℤ/9 | lift exists (α = 2), but 3·3 = 0 with 3 ≠ 0 | Torsion-freeness is a separate hypothesis. |
| quotientLift_identityCover example | B = ℤ[x^{1/n}], R = B/(x⁴) | ℤ-basis x^r, r ∈ ℚ, 0 ≤ r < 4: torsion free; α = 4 passes at 2 (even ≥ 4) and at odd p; for x²: odd p only | Matches KU Ex 6.9 (line 3712–3714). |
| perfectedLiftNaive hypotheses | QH 4.17 | "p-quasi-lci" there includes p-complete (line 2748) | README's "p-complete" is QH's convention, not a narrowing. |
| Toric x − 1 divided powers | n = 1, 2 | (x−1); (x−1)(x−q)/(1+q) ↦ (x−1)²/2 at q = 1 | Elements of the q-PD envelope (QH line 2964). |
| Exponent one | ℤ_p{x}_∞/x | ku-lift exists (KU line 194), spherical E₁ lift excluded by 4.22(b) since the naive filtration is not a deformation (QH Ex 4.24) | Hypothesis cannot be weakened to a ku-lift. |
| p = 2, α = 2 | A = ℤ₂{x}^∧₂, R = A/x² | predicate at 2 false; QH 4.22(a) still applies (line 2889) | Two independent routes, as stated. |
| tracePair_quasiRegular, clause 1 | base change of lift | (S_{R̂_p} ⊗ S_{(Â_p)∞})^∧_p reduces to (R̂_p ⊗ (Â_p)_∞)^∧_p | Gives QH 4.22(b)'s hypothesis at every p. |
| Toric base Check | A = ℤ[x], R = ℤ via x ↦ 1 | relative Frobenius 𝔽_p[x]/(x^p − 1) → 𝔽_p, x ↦ 1: surjective; L_{ℤ/ℤ[x]} regular quotient, amplitude [0,1] | Identity-cover input; contains δ^{(n)}_q(x,1). |
| Branch dependence | R = ℤ[x] at odd p | Ω¹_{ℤ[x]/ℤ}/p = 𝔽_p[x]dx ≠ 0, so ℤ[x]/p is not relatively semiperfect | ℤ[x] is outside §2.3, compared in §3.1 instead. |
| Canonical domain | d = 0, 1, 2 | n = max(d,1) = 1, 1, 2; primes ≤ n inverted: ∅, ∅, {2} | Dimension 0 and 1 need no inversion; d = 2 empties the datum at 2. |
| Counit, not any map | S = A modulo β | counit = id_A; the zero map is also between complete filtrations but is not an equivalence | Completeness alone is insufficient; the specified map is used. |
| Jackson operator | 1, x, x²; q = 1; x = 0 | 0, dx, (1+q)x dx; at q = 1: 0, dx, 2x dx; at x = 0: 0 | Integral, no division by x; (qx−y)(qx−qy) − (x−y)(x−qy) = (q²−1)x(x−y) checked. |
| Derived reduction Check | M = (B → B dx, x^r ↦ (q^r−1)x^{r−1}dx) | H⁰(M) = ℤ[[h]], H⁰(M)/h = ℤ; H⁰(M/^Lh) = ℤ[x]; Bockstein x^r ↦ [r]_q x^{r−1}dx, h-torsion (h·[r]_q = q^r − 1 ∈ image) and nonzero ([r]_q ∉ h[r]_qℤ[[h]]) | Derived reduction is the right object. |
| Laurent framed Check | S = ℚ[x^{±1}] | dR_{S/ℚ} = ℚ (sifted colimit of polynomial rings, each with dR = ℚ), qdR = ℚ[[h]]; qΩ has H¹ = ℚ[[h]]dx/x | Pullback to qdR is essential. |
| Tensor domain | ℤ[x] ⊗ ℤ[x] | d = 1 + 1 = 2, prime set ∅ → {2} | No closure claimed. |
| TraceInversion | F = ℚ; Δ = 6, 1, 0, −6 | disc(ℚ) = 1 (Mathlib `Rat.numberField_discr`); 6 ∣ 6, 1 ∣ 6, 6 > 0: true; 6 ∤ 1: false; 0 ≯ 0: false; −6 < 0: false | Positivity and 6 ∣ Δ discriminate. |
| Gaussian Δ | F = ℚ(i), Δ = 6, 12 | disc = −4; 4 ∤ 6 false, 4 ∣ 12 true; both give ℤ[i][1/6] | Predicate is on the integer. |
| Gaussian étaleness at Δ = 1 | ℤ[i] over ℤ mod 2 | Ω¹ = ℤ[i]/(2i)di = 𝔽₂[i]di ≠ 0 | Discriminant inversion needed. |
| Cubic | F = ℚ(∛2), Δ = 108 | disc = −108 = −2²·3³; 6 ∣ 108, 108 ∣ 108, 108 > 0; R = ℤ[∛2][1/6] | Admissible. |
| isUnit_two_three | ℤ[1/6] | 2·(3/6) = 1, 3·(2/6) = 1; `Commute.isUnit_mul_iff` on 2·3 = 6 | Route correct. |
| Finite étale rank | ℚ, Δ = 6; ℚ(i), Δ = 12 | ranks 1 and 2 over ℤ[1/Δ]; basis 1, i; −4 invertible | No finiteness over ℤ asserted. |
| Divisibility diagram | m = 1 | C₁ = {1}, term THH^{hS¹}; order 0 subgroup does not exist | Positive indices. |
| Zero coefficient datum | R = 0 | all fixed-point terms, the limit and P_R are 0 | Distinguishes the realisation from a constant functor. |
| Δ a unit in H_R | family (1/Δ)_m | φ_p(1/Δ) = 1/Δ for p ∤ Δ; completed terms at p ∣ Δ are 0 | (1/Δ)·Δ = 1 in the equalizer. |
| Full coefficients | ℚ(i), m = 4 | ℤ[i][1/6] ⊗ ℤ[i] = R[x]/((x−i)(x+i)) ≅ R × R since 2 invertible; e = (1⊗1 − i⊗i)/2 ↦ 1, 0 under x ↦ ±i; e² = e | One embedding loses a factor. |
| Twisted family at p = 7 | F = ℚ(i), constant i | 7 ≡ 3 mod 4 inert; φ₇(i) = i⁷ = −i ≠ i: constant fails; f₇ = φ₇⁻¹(i) = −i, φ₇(−i) = i = f₁: twisted glues | Constant families need not glue. |
| Frobenius direction | F = ℚ(ζ₇), p = 11 | 11 ≡ 4 mod 7; 4² ≡ 2, 4³ ≡ 1: order 3; f₁₁ = φ⁻¹(a) = a² and φ(a²) = a⁸ = a; alternative f₁₁ = a⁴ gives φ(a⁴) = a¹⁶ = a² ≠ a; Δ = 6·7⁵ with disc = −7⁵ | Inverse convention forced; GSWZ footnote 1 has the wrong direction. |
| Nonabelian field | F = ℚ(∛2), p = 5 | 3³ = 27 ≡ 2; (x−3)(x²+3x+4) ≡ x³ − 2 mod 5; discriminant 9 − 16 ≡ 3, not in {0,1,4} | Irreducible quadratic factor; Frobenius moves ∛2's component (HabiroRings §7.3). |
| Equalizer strictness | family (1,0,0,…) over ℤ[1/6] | at (p,m) = (5,1): left 1, right 0 | Product is strictly larger than P_R. |
| τ₁ non-injectivity | R = ℤ[1/6] | relations at p = 2, 3 empty; equalizer splits by (v₂, v₃) of root orders; τ₁ kills every factor except (0,0) | Consistent with GSWZ line 252 (not a domain when Δ ≠ 1). |
| TC finite-coefficient corner | m = 1; m = p^α | empty product = 0; dR_{(ℤ/p^α)/ℤ} ⊗ ℚ = dR_{0/ℚ} = ℚ ≠ 0 | TC's "rationalisations vanish" is false; the arithmetic pullback of HabiroCohomologyFoundations §5.26 keeps the corner. |
| KU Lemma 6.11 sign | d = 1, 2 | (q−1)^dγ̃^d = (q−1)^d∏(x−q^iy)/∏(1−q^k) = (−1)^dδ^{(d)}; λ¹((x−y)/(q−1)) = (x−y)/(q−1) = −γ̃¹; ∇_qδ^{(2)} = δ^{(1)} while ∇_qγ̃¹ = 1/(1−q) ≠ γ̃⁰ | The README's normalisation and its source remark are right; generated ideals unaffected. |
| Previous R01 | plan gaps | plan.json gaps: 0 entries; README gap tokens: 2 slugs, both SolidAnalyticRings' | Repaired. |

**Pinned Mathlib declarations opened (all at `6b7abb3c`).**

| Declaration | File:line | Content and boundary |
| --- | --- | --- |
| `NumberField.discr` | Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36 | `Algebra.discr ℤ (RingOfIntegers.basis K)`, an integer. |
| `Rat.numberField_discr` | same file:75 | `discr ℚ = 1`. |
| `NumberField.RingOfIntegers` | Mathlib/NumberTheory/NumberField/Basic.lean:101 | integral closure, no spectral structure. |
| `IsLocalization.Away.algebraMap_isUnit` | Mathlib/RingTheory/Localization/Away/Basic.lean:82 | the inverted element becomes a unit. |
| `map_dvd` | Mathlib/Algebra/Divisibility/Hom.lean:31 | divisibility under a `MulHomClass` map. |
| `isUnit_of_dvd_unit` | Mathlib/Algebra/Divisibility/Units.lean:129 | a divisor of a unit is a unit. |
| `Commute.isUnit_mul_iff` | Mathlib/Algebra/Group/Commute/Units.lean:74 | `IsUnit (a*b) ↔ IsUnit a ∧ IsUnit b` for commuting a, b. |
| `Algebra.Etale` | Mathlib/RingTheory/Etale/Basic.lean:205 | `FormallyEtale` and `FinitePresentation`; not module finite. |
| `Algebra.Smooth` | Mathlib/RingTheory/Smooth/Basic.lean:539 | formally smooth and finitely presented. |
| `MvPolynomial` | Mathlib/Algebra/MvPolynomial/Basic.lean:79 | `AddMonoidAlgebra R (σ →₀ ℕ)`. |
| `Even` / `IsSquare` | Mathlib/Algebra/Group/Even.lean:54–56 | the `to_additive` block; the README's line 55 is its docstring line, line 56 the `def IsSquare`. |
| `Nat.factorization` | Mathlib/Data/Nat/Factorization/Defs.lean:50 | `ℕ →₀ ℕ`; 0 and 1 have empty support. |

Tau Ceti at `a91d3aaf` is not imported and contains none of the needed carriers, as the README says.

**Cross-roadmap citations resolved (every one, at main or at the cited open head).**

| Supplier (head) | Sections found, with line anchors in its README | Contract checked |
| --- | --- | --- |
| RefinedTraceMethods (#1493) | §6.1:2517 ("Étale algebras lift uniquely":2519; "Compatible local and global spherical lifts":2557), §§6.2–6.7:2580–2846, §6.8:2860, §6.9:2956 (ψ⁰ and Thms 4.8/4.14/4.17 statements), §6.10:3019 (framed inputs:3070; framed comparison:3142; prime-two resolution agreement in the completeness statement; framed trace pair and E∞:3166), §6.11:3189 (A₂ coherence), §6.12:3269, §6.13:3321, §6.14:3347 (Cor 6.15 as a ring statement with 6 ∣ Δ kept), §7.6:3531 (high-powered predicate, torsion-free base change via ℤ_p{x}_∞/x^a, finite-coefficient TC⁻), §8.8:3907 | Each imported statement exists with the hypotheses this README repeats. |
| HabiroCohomologyFoundations (#1428) | §0.1:274; §§1.14–1.16:588–604; §§2.1–2.11:846–1002; §4.1:1295; §4.4:1337; §4.8:1404; §§4.12–4.24:1467–1669 (incl. 4.17a:1560, 4.21:1606); §4.28:1736; §§5.2–5.8:1827–1892; §5.13:1974; §§5.15–5.26:2008–2146; §§8.18–8.19:2452–2466 | Pairs, descent record, canonical and naive filtrations, quasi-regular section, finite-coefficient pairs with rational corner: as cited. |
| HabiroRings (#1425) | §2.1:392, §2.4:476, §2.5:505; §§5.1–5.9:902–1069 (relative ring, Taylor maps and T_{p,m}, equalizer:978, completed base change:1007, number-field étaleness:1048, GSWZ comparison:1069); §7.3:1290 | "HR.n" in this README denotes HabiroRings Layer n (Layers 2, 5, 7 at lines 388, 898, 1266); the exact contracts are stated by section number and resolve. |
| HabiroNumberFields (#1469) | §§2.1–2.4:611–678 | roots, full coefficient algebras, re-expansion, twisted gluing. |
| QWittVectors (#1351) | §§2.1–2.5:319–438 (perfectly covered Λ-rings torsion free:414; relative perfection:438) | as cited. |
| SolidAnalyticRings (#1458) | §6.4:631; gap statements:71, 79; §4.1:429, §4.2:445 | inherited gaps named correctly. |
| StableHomotopyKTheory (#1227, via the roadmaps tool) | §§5.13–5.18:2100–2219; §§7.13–7.21:2510–2594; §7.32:2781; §7.34:2806 | Burklund towers with v-compatible uniqueness; prime-two range. |
| KTheoryFiniteLocalFields (#1281) | §4.0:639 | genuine circle spectra and fixed points. |
| PrismaticCohomology (#1057) | Layer 0:277 | δ-rings, toric φ(x) = x^p. |
| PrismaticCohomologyPartII (#1065) | §3.1:150, §§3.13–3.16:443–499, §§3.20–3.23:547–603, §§5.7–5.8:1563–1600, §§5.14–5.18:1717–1831; `Prismatic.Nygaard.relativeFrobenius`:466 | as cited. |
| PrismaticCohomologyPartIII (#1070) | §7.0:752; `Prismatic.Trace.gradedTCMinus`, `gradedTP`, `gradedTC`:768 | The three resolver leads are this supplier's README targets, cited as such. |
| AInfCohomology (#1044) | §AI.7.2:3816 (circle, Tate, THH; quasisyntomic unfolding and Nygaard:3954–3961) | as cited. |
| HabiroCyclotomicCompletions (#1314) | §1.4:582, §2.3:879, §5.1:1956, §5.3:2178 | as cited. |
| EnhancedDerivedSheaves (main) | E5:abstract.2:1456; E5:presentability.4:1732 (`TraceClassData`, `IsTraceClass`:1772); E5:cotangent-export.1:2869 | as cited. |

All suppliers precede this roadmap in the merge order or are on main; no `*Needs:*` line, supplier row or "Supplied by" cites a later roadmap, and no cited supplier section cites this roadmap back (HabiroCohomologyFoundations §4.28 mentions it only as a consumer).

**Ownership against open work.** Searched by object with the roadmaps tool over main and the 442 open heads: the completed relative formally étale lift, spherical perfection map, TraceInput category, trace-pair descent, higher-power quotient lifts, perfected-lift criterion, canonical/framed agreement, trace inversion and number-field exports occur only in this roadmap; the only other `quotientLift` hits are Huber-pair quotient lifts in AdicSpacesPartII and `ContinuousMonoidHom.quotientLift` in LocalGaloisGroups, unrelated. StableHomotopyKTheoryPartII §4.8 (spherical Witt vectors of a finite field) and GeneralAlgebraicKTheoryPartII §6.1a (perfect algebras over a Lubin–Tate E(k)) do not supply the marked relative completed lifting of §0.1. The sibling checkouts named in the brief were available; ownership against open pull requests without files was not needed.

**Shape and policy.** README has Summary, Scope and ownership (with a supplier table and deferrals), Conventions, Exact supplier contracts (Mathlib, Tau Ceti, each roadmap), How to read the build, Layers 0–4 each ending in Examples and Dependencies, Downstream consumers, Remarks on the sources (the same device as the errata section of the completed ProfiniteProPGroups roadmap), References. Every theorem carries hypotheses and a locator; every definition has an API list and at least three discriminating Checks (TraceInput 7, tracePair 6, traceHabiro 7, exponent predicates 12, perfectedLiftNaive 4, tracePair_quasiRegular 5, canonicalFramedTrace 6, TraceInversion 8, numberFieldTraceExports 9). Scan for process words, "optional/deferred", LaTeX delimiters, pull-request numbers, `lemma`, local paths: none. No copied passage: each statement is in the roadmap's words with theorem and page.

## Not verifiable

- Nothing was unreadable: all eight manifest texts are certified and were read at the cited lines; no manifest change and no missing-text request.
- relativeFormalEtaleLift (§0.1) is a new target: the sources assert the lifting of p-completely formally étale algebras (KU line 3715, TC line 1305) without proof. The README states a route (animated versus spectral square-zero deformation problems, Postnikov lifting, p-complete effectivity) and the Checks above test instances; this review verifies the statement's consistency on those instances, not the proof.
- The global identification in tracePair_quasiRegular and the naturality of ε_R in numberFieldTraceExports_naturality are assembly targets the sources do not state; the route's inputs (KU 4.17, 4.29, QH 4.28, A.12) exist as cited.

## Source issues

- **Error** in GSWZ at footnote 1, printed p.6 (GSWZ line 263): the source says the coefficient embedding of an abelian field is a ↦ (φ_m a)_m with φ_m the forward Frobenius product; it should be a ↦ (φ_m⁻¹ a)_m for the gluing (13), as the order-three example at p = 11 in ℚ(ζ₇) shows; affects a stated result.
- **Misprint** in KU at proof of Corollary 6.15, printed p.86 (KU line 3888): the source says the étale identification of the Habiro–Hodge complex is QH Corollary 3.12; it should be QH Corollary 3.13, 3.12 being the framed Example; affects nothing.
- **Error** in TC at 3.5 and Lemma 3.7, printed pp.31–32 (TC lines 1325–1327, 1358–1363): the source says the uncompleted rational comparisons for ℤ/m are vacuous because (ℤ/p^α)⊗ℚ = 0; it should keep the rational corner, since dR_{0/ℚ} = ℚ and qdR_{0/ℤ} = ℚ[[h]] are nonzero (already at m = 1 the product of local factors is 0); affects a stated result (the uncompleted pair; completed statements unaffected).
- **Misprint** in KU at Lemma 6.11, printed p.84 (KU lines 3751, 3770): the source says λ^d((x−y)/(q−1)) equals γ̃^d_q(x−y) with (q;q)_d = ∏(1−q^k); it should carry the sign (−1)^d, already at d = 1; affects the proof only (generated ideals unchanged).
- **Misprint** in KU at proof of Theorem 6.10, printed p.86 (KU line 3862): the source says q-∂_x γ̃^d_q(x−y) = γ̃^{d−1}_q(x−y); it should be the identity ∇_q δ^{(d)} = δ^{(d−1)} for the [d]_q!-normalised divided powers (for γ̃ a factor 1/(1−q) appears at d = 1); affects the proof.
- **Gap** in KU at Remark 3.10, printed p.27 (KU line 1117–1122): the source says the perfectoid-root resolution could replace the polynomial one and "most arguments below would work"; it should give the comparison of the two resolutions and their filtered maps, which the trace input at 2 needs; affects the proof.
