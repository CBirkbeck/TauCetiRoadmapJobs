# Review of AlgebraicTopology (pull request #1652 at 287181d)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/AlgebraicTopology/` at 287181d. The previous review read the same head, so nothing in the folder has changed since. Its two findings are unrepaired and carried as R02 and R08. The full pass adds one blocking finding and five more P3 findings. R01 (blocking): the compact-source mapping-space headline is stated more generally than any target that proves it. The P3 findings:

- R03: a Tau Ceti local-homology API is described too narrowly and partly restated.
- R04: several targets lack a locator, including the bundle Euler headline.
- R05: a compactness Check whose non-examples satisfy the conclusion.
- R06: a predicate without Checks, whose export is stated below its Lean generality.
- R07: a dropped Lean name that an open roadmap still imports.

## R01 (P2) — `finiteSourceMappingCWType` is stated for compact Hausdorff sources, but §8.11a's targets stop at compact metric sources

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md:3228`–`:3241` ("for compact Hausdorff X … so C(X,Y)≃C(X,K) and Milnor's theorem applies to K"). Also `:3250` ("Prove the finite-CW-source pair specialization"), `:3281` ("maps from a compact metric source into a metric ANR have metric ANR type") and `:3292` ("These inputs establish the function-space CW-type theorem"). The Lean statement is `Suggested.lean:244`–`:249`.

**Claim.** The headline is Milnor's Theorem 3 for every compact Hausdorff X. Its only route in the README goes through 8.11a. 8.11a proves the finite-CW-source specialization, and its ANR-type step assumes a compact *metric* source. No target reaches a non-metrizable compact source.

Separately, the passage mixes up the ambient Hausdorff space K with the CW complex C ⊆ K. The Lean docstring at `Suggested.lean:242` correctly says C(X,C).

**Witness.** Take X = βℕ, which is compact Hausdorff but not metrizable: no 8.11a target applies to C(βℕ,K_m). And for Y = C = S¹ ⊆ K = ℝ², X = S¹: C(S¹,S¹) has ℤ components, while C(S¹,ℝ²) is contractible.

**Repair.**

1. State the ANR-type target for every compact source X. Embed K_m by the Kuratowski–Wojdysławski embedding (already owned) as a closed subset of a convex set H in a normed space E. ANR⇔ANE (already owned) gives a retraction r : U → K_m from an open U ⊆ H. Then:
   - C(X,H) is convex in the normed space of continuous maps X→E with the sup norm, so it is an AR by Dugundji Theorem 4.1.
   - C(X,U) is open in C(X,H) because X is compact.
   - r∘– retracts C(X,U) onto the closed subset C(X,K_m).

   Alternatively, add Milnor's Lemmas 3 and 4 as targets (milnor1959 lines 247–257, pp.277–279): K^C is ELCX and metrizable for compact C, and a paracompact ELCX space is dominated by a CW complex. Tested on βℕ: either route makes C(βℕ,K_m) a metric ANR, and 8.11a's domination and telescope steps then give CW type.
2. In `:3236`–`:3241`, name the model Z ⊆ K, which also avoids the clash with the notation C(·,·). The sentence then reads "so C(X,Y)≃C(X,Z), and the compact-source theorem applies to Z".

## R02 (P3) — The branch still pins Tau Ceti 358314d4 and does not merge with main; the docstring's "not statable" list describes that old pin

Carried from the previous review's R01 and not repaired: the head is unchanged.

**Location.** `lake-manifest.json:8` (`358314d4…`); `README.md:241`–`:244` ("read at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…`"); `Suggested.lean:33`–`:41`.

**Claim.** The README reads its supplier contracts at 2fd255d9, but the file is built at 358314d4. The docstring's reasons for leaving Hurewicz unstated, and the explicit CW-model encodings, are true only of the old pin.

**Witness.** At 358314d4 the following modules are absent; all exist at 2fd255d9: `AlgebraicTopology/{ClassifyingSpace,Homotopy}`, `Singular/BrouwerFixedPoint.lean` (the worker's one unresolved citation, README:349), `Singular/LocalHomology` and `Topology/Category/BasedTopPair.lean`. Also, `git merge-tree origin/main HEAD` reports a conflict in `Suggested.lean`.

**Repair.**

1. Merge origin/main. Keep this head's deletions at the two modify/delete conflicts (`GeneralModelOrientation.lean`, `TopologicalGroupFundamentalGroup.lean`), take this head's `Suggested.lean`, and re-run the gate.
2. At 2fd255d9, state relative Hurewicz: for n ≥ 2, A nonempty and simply connected, and π_i(X,A,a₀)=0 for 1≤i<n, `TauCeti.RelHomotopyGroup.hurewicz` is bijective. State the absolute theorem in every universe on `HomotopyGroup.hurewicz`.
3. Restate `homologicalWhitehead_cwType`, `nonempty_homotopyEquiv_sphere_of_homologySphere` and `finiteSourceMappingCWType` with `[TauCeti.CWType _]`. The class at `Topology/CWComplex/Classical/CWType.lean:38` is exactly the model C ⊆ K spelled out now.
4. Rewrite `:33`–`:41`. For proper Whitehead, name the carrier that is missing, compactly supported singular cohomology with proper pullback, which neither pin has. The current text (`:50`) names a proof input instead ("the supported cellular/singular comparison").

## R03 (P3) — Tau Ceti's module-coefficient local homology is described as integral only, and §6.3 claims to add what it already has

**Location.** `README.md:426`–`:431` ("the integral local homology system of a topological manifold … Layer 6.3 consumes these for boundaryless manifolds and integral coefficients"); `:1999`–`:2001` ("add the local system as a coefficient system for Layer 2.6, arbitrary coefficient rings, boundary and corners").

**Claim.** At the declared revision, the Tau Ceti natives already work over every ring. The README should cite them and build only the twisted and boundary extensions.

**Witness.** At 2fd255d9, two declarations take any `N : ModuleCat Λ` over any ring `Λ` (`Compact.lean:60`, `TopHomology.lean:88`):
- `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact` (`Singular/LocalHomology/Compact.lean:328`, docstring "Hatcher's Lemma 3.27(a)");
- `TauCeti.isLimitLocalHomologySystemCone` (`TopHomology.lean:97`).

**Repair.**

1. In the supplier bullet, name these natives:
   - `TauCeti.localHomologySystem`, with coefficients in any abelian category (`System.lean:77`);
   - `TauCeti.isZero_localHomology_of_isCompact` and `TauCeti.existsUnique_localHomologyRestriction_eq_of_isCompact`;
   - `TauCeti.isLimitLocalHomologySystemCone`, `TauCeti.localHomologySystemCone_π_app_injective` and `TauCeti.mem_range_localHomologySystemCone_π_app_iff` (`TopHomology.lean:97`, `:110`, `:124`).
2. In §6.3, drop "arbitrary coefficient rings" from what the roadmap adds. Limit the compact-support lemma at `:2066`–`:2073` to non-constant local systems.
3. Obtain the fundamental class used by `poincareDuality_twoTorsionCoefficients` from `mem_range_localHomologySystemCone_π_app_iff`. When 2=0, every loop acts by ±1=1 on H_n(M,M∖{x};R), so a local generator at x is the restriction of a global class. Tested on RP² over 𝔽₂: the generating loop acts by −1=1, giving the class used in §6.4's Betti 1,1,1 Check.

## R04 (P3) — Targets without a locator, and two misplaced locators

**Location and witness.**
- §1.5 (`README.md:646`–`:652`) has no locator. Brown 6.7.5 (brown line 9692, p.248) computes π(S¹) from the two-arc cover. Brown §6.7 Exercise 2 (brown line 9749, p.249) and Hatcher Example 1.21 (hatcher line 1962, p.43) treat the wedge of circles.
- §7.1 (`:2529`–`:2531`): the relative and local-system Euler–Poincaré equalities, including χ(X;L)=rank(L)·χ(X), have no locator.
- §7.2 (`:2552`–`:2562`): the headline bundle formula has no locator in the README or in `Suggested.lean:154`–`:157`. The manifest's kmr2023, recorded for 7.2, is cited in neither file. Its introduction states the finite-complex case (kmr2023 lines 28–35), and Theorem A (line 48) extends it to finitely dominated F and B.
- §2.3 (`:718`–`:722`) cites p.117 for the naturality square. Page 117 has the sequence and ∂[α]=[∂α] (hatcher lines 5131–5142). Naturality is on p.127 for pairs (line 5566) and p.128 for triples (line 5584).
- §7.3 (`:2579`–`:2583`) attributes the open-cover formula to Exercise 21. That exercise is about subcomplexes A and B of a finite CW complex (hatcher line 6855, p.157).

**Repair.** Add these locators:
- §1.5: Brown 6.7.5, p.248 and Hatcher Example 1.21, p.43.
- §7.1: Hatcher Theorem 2.44, p.146, whose cellular argument the extension follows on §4.3's twisted cellular chains, stated as this roadmap's construction.
- §7.2: Klein–Malkiewich–Ramzi, pp.1–2 and Theorem A, added to References and to the Lean docstring.
- §2.3: "naturality p.127; triples p.118, naturality p.128".
- §7.3: Exercise 21 for the subcomplex formulas; Mayer–Vietoris (§2.2, p.149) with Theorem 2.44 for the open-cover form.

## R05 (P3) — §8.7's compactness non-examples have finite CW type

**Location.** `README.md:2994`–`:2996` ("A model built from the triangulation of a noncompact manifold (ℝ with its integer-vertex triangulation) is countable but not finite, which is why compactness is a hypothesis"); `:2998`–`:3000` (the open disk).

**Witness.** ℝ and the open disk are contractible, so a one-point model gives `TauCeti.FiniteCWType`. Neither Check shows that `compactManifoldFiniteCWType` fails without `[CompactSpace M]`.

**Repair.** Use a noncompact manifold with no finite CW type:
- ℕ with the discrete topology, a 0-manifold whose H₀ is free of infinite rank (a finite CW complex has finitely generated homology);
- or ℝ²∖(ℤ×{0}), whose H₁ is free of infinite rank.

Keep ℝ as the example showing that a noncompact manifold can still have finite CW type.

## R06 (P3) — `HasProperHomotopyExtensionProperty` has no Checks, and §8.5 states its export below the Lean generality

**Location.**
- `README.md:2790`–`:2795`: the three Checks test r and H, not the predicate.
- `:2895`–`:2897` ("Export `properStrongDeformationRetract_of_inverse`: for a closed strongly locally finite CW subcomplex A⊂X"), whereas `Suggested.lean:273`–`:301` and `README.md:2776`–`:2784` take any A with the predicate in a locally compact Hausdorff X.

**Witness.** No Check evaluates the predicate. For (I,{0,1,1/2,1/3,…}), A is closed, yet no retraction I×I→I×{0}∪A×I exists (hatcher line 795, p.14). So the predicate fails there, and the README never records it.

**Repair.** Add Checks on the predicate:
- A=∅: K(t,x)=f(x), which is proper as f composed with the proper projection I×X→X.
- A=X: K=H.
- A={0}⊂I: K(t,x)=H(t−x,0) for x≤t and f(x−t) for x≥t.
- The negative control above: take Y=I×{0}∪A×I, f(x)=(x,0) and H(t,a)=(a,t). Both maps are proper (compact domain, Hausdorff target), and a proper extension would be the impossible retraction.

State the §8.5 export at the Lean generality, with strongly locally finite CW pairs as the instance supplied by FTW Theorem 1.6 (ftw1973 line 134).

## R07 (P3) — The dropped name `poincareDualityMap_isIso` is still cited by an open roadmap and is missing from the former-name map

**Location.** `README.md:3512`–`:3535`, the list of former Lean names.

**Witness.** HomotopySpheres, pull request #284 at its head, imports this module (`TauCetiRoadmap/HomotopySpheres/Suggested.lean:3`) and checks `TauCetiRoadmap.AlgebraicTopology.poincareDualityMap_isIso` (`:36`). Main's `Suggested.lean` declares this name; this head does not, and the list omits it.

**Repair.** Add the bullet "`poincareDualityMap_isIso` (HomotopySpheres): §6.4, `poincareDuality_of_isFundamentalClass`."

## R08 (P3) — The pull-request title and description are stale and state no merge order

Carried from the previous review's R02 and not repaired.

**Location.** The title ("compact Cech pairs and relative cup modules") and the description ("This amendment changes only README mathematics; existing Lean modules are unchanged").

**Witness.** The diff deletes seven Lean files and rewrites `Suggested.lean`, and `README.md:162`–`:163` excludes compact Čech pairs from scope. Six open heads conflict with it (#1187, #1663, #1797, #1807, #1808, #1854), and no order is stated.

**Repair.**
1. Rewrite the title and description to say what the head does.
2. State which of #1652 and #1663 is rebased onto the other.
3. State which direction of supply survives the rebase with #1807 and #1854. This head follows main: CharacteristicClasses C1.2a consumes AT 6.1–6.2 (CharacteristicClasses README on main, `:66`–`:70`), and AT's supported-cellular supplement consumes C1.2a S0–S4 (`README.md:562`–`:568`). #1854's head reverses this (its AT README, lines 157–168: "No stage here consumes those carriers, comparisons or that identification").

## Previous findings

- R01 (pin 358314d4; Hurewicz headlines absent): not repaired; same head. Now R02, which also covers the `TauCeti.CWType` restatement and the proper-Whitehead docstring.
- R02 (stale title and description, no merge order): not repaired. Now R08.

## Verified sound

**Gate, dependency check, build.**
- The worker's gate at 287181d reports every counter at 0 and "OK". `git diff --stat origin/main...HEAD` outside the folder is empty.
- I re-ran the dependency check: `depcheck: 238 roadmaps, 2322 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` at the branch pin ran in 20 s and produced exactly 12 "declaration uses `sorry`" warnings and nothing else.

**Lean statements.**
- A scratch copy ran `#check @name` on all 20 declarations. The worker's list of 21 includes a phantom "`μ`" class taken from a docstring backtick.
- The file has no `variable` block. Every elaborated type matches its README statement: §6.2 `:1895`–`:1906`, §6.4 `:2360`–`:2370`, §7.2 `:2552`–`:2556`, §8.5 `:2779`–`:2784` and `:2805`–`:2810`, §8.7 `:2961`–`:2968`, §8.8 `:3013`–`:3015`, §8.11 `:3228`–`:3232`. The exception is R06's export sentence.
- One-tactic probe: each of the 12 theorems with `first | rfl | infer_instance | (simp; done) | trivial | decide` fails (12 errors). Nothing restates a definition, mirrors a Check or computes a small value.
- The six imported modules exist at both pins. Between the pins they differ only by additions plus three deleted lines: one import and one `Epi` instance, neither used here.

**Sampled locators** (Hatcher printed page = PDF page − 9; Brown printed page = PDF page − 25).

| Target | Locator in the README | Source line, printed page | Result |
| --- | --- | --- | --- |
| 1.2 | Brown 3.6.4 (Lebesgue), §6.7 Ex. 6 | brown 3995 p.91; 9768 p.250 (colimit for the cover of pairwise intersections of a subcover) | sound |
| 1.4 | Brown 6.7.2 | brown 9424 p.240 (A representative in X₀, X₁, X₂) | sound |
| 1.5 | none | — | R04 |
| 2.3 | §2.1 p.117, p.118 | hatcher 5131–5142 p.117; 5187 p.118; naturality 5566 p.127 | R04 (naturality page) |
| 2.5 | Prop 3B.1 pp.269–270; after 3B.6 p.276; Lemma 3.27 p.236 | hatcher 11612–11640 (cube formula (∗) with signs); 11937 p.276; 10255 p.236 | sound |
| 4.2 | formula p.140; Lemma 2.34 p.137 | hatcher 6086 p.140; 5963 p.137 | sound |
| 5.4 | Thm 3B.6 p.275; Ex. 3.16 p.216 | hatcher 11898 p.275; 9388 p.216 | sound |
| 5.7 | Prop 2.21 pp.119–120 | hatcher 5222 p.119 | sound |
| 6.0 | Prop A.1 p.520; Thm 3.5 p.203 | hatcher 22534 p.520; 8799 p.203 | sound |
| 6.2 | Lemma 3.6 p.206; Thm 3.11 p.210; cap pp.239–240; §3.2 Ex. 2 p.229; relative cup p.209 | hatcher 8935; 9099; 10391–10400 (Hatcher's front/back-face formula and ∂(σ⌢φ)=(−1)^ℓ(∂σ⌢φ−σ⌢δφ), p.240); 9938; 9074 | sound |
| 6.4 | p.236; Thm 3.30 p.241; p.235; Thm 3.26 p.236 | hatcher 10246; 10453; 10228 (R-orientable iff a unit of order 2, i.e. 2=0); 10237 | sound |
| 6.5 | §3.E; Thm 3.30; Thm 3.2 p.195; CFH | hatcher 13238 (§3.E begins, p.303); 10453; 8476 p.195; CFH not verifiable | sound as far as checkable |
| 7.1 | none for the extensions | — | R04 |
| 7.2 | Thm 2.44 p.146; §2.2 Ex. 20 p.157; bundle formula none | hatcher 6380 p.146; 6854 p.157 | R04 (bundle) |
| 8.1 | §4.1 pp.343–345; Cor 4.12 p.351; Thm 4.8 p.349 | hatcher 15007 (Thm 4.3, p.344); 15308 p.351; 15205 p.349 | sound |

Also checked:
- Milnor Theorem 3 and Corollary 3 are on p.276 (milnor1959 lines 209–222), for a compact n-ad with no metric hypothesis.
- Hatcher 4.32 p.366, 4.33 p.367, 4.57 p.393, A.11 p.528, A.14–A.16 pp.530–531, 1B.7 p.89, 1B.9 p.90, Example 2.42 p.144 (lines 15961, 16001, 17069, 22877, 23034–23081, 3844, 3905, 6223).
- FTW Theorem 1.6 (line 134) and §3 (line 452 onward).

**Adversarial table.**

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.2 generation and relations | S¹, U={Re z>−1/2}, V={Re z<1/2}, γ(t)=e^{2πit} | γ⁻¹U=[0,1/3)∪(2/3,1], γ⁻¹V=(1/6,5/6), Lebesgue number 1/6; pieces [0,¼],[¼,¾],[¾,1] lie in U,V,U; splitting [¼,¾] at ½ gives the same composite by composition in π(V) | holds |
| 1.4 two-open pushout | S¹∨S¹ with contractible U∩V; S² as two caps; two-arc S¹ | ℤ*ℤ; 1*1=1; disconnected intersection, so the hypothesis fails | holds |
| 1.5 circle, wedge | two-arc S¹, one basepoint per component; wedge of two circles | vertex group ℤ (Brown 6.7.5); F₂ with abelianization ℤ² | holds; R04 |
| 2.3 pair, triple | (D¹,S⁰); (D¹,S⁰,pt) | H₁(D¹,S⁰)=ker(ℤ²→ℤ, (a,b)↦a+b)=ℤ; connecting map H₁(D¹,S⁰)→H₀(S⁰,pt)=ℤ is an isomorphism | holds |
| 2.5 cube and S⁰ classes | n=2, n=0, S⁰ | d(e₁×e₂)=de₁×e₂−e₁×de₂ = right−left−top+bottom; a swap gives −1; the point class has augmentation 1; [q]−[−q] has local images +1,−1 and augmentation 0, while [q]+[−q] has augmentation 2 | holds |
| 4.2 differentials | RP², RP³; degree-m 2-cell | d_k=1+(−1)^k gives d₁=0, d₂=2, d₃=0, so H(RP³)=(ℤ,ℤ/2,0,ℤ); d₂=m: kernel ℤ at m=0, cokernel ℤ/2 at m=2 | holds |
| 5.4 torus | T², T³; A=[[0,1],[1,0]] | Betti 1,2,1 and 1,3,3,1; A acts on H₂=Λ²ℤ² by det A=−1 | holds |
| 5.7 cover descent | point covered twice; S¹ by two arcs; zero ring | 0→R→R²→R→0 is exact, H₀=R; S¹: d¹(a,b)=(−(a+b),a+b), kernel R=H₁, cokernel R=H₀; all 0 over the zero ring | holds |
| 6.0 towers, homotopy squares | constant ℤ; ×2 tower at (1,0,1,…); fₙ=n·id; ×3 tower | δ(3,1,0,…)=(2,1,0,…); 3x₀+1 divisible by 4^k for all k is impossible; the squares fail by 1 and the composite by 2n+1=(n+1)+n; lim¹≅ℤ₃/ℤ, and Σ3ⁿ=−½∉ℤ | holds |
| 6.2 `lsCupLength_add_one_le_of_categoricalCover` | point; S¹; T²/ℤ; CP^∞; zero ring; ∅ | 0+1≤1; 1+1≤2; a∪b≠0, so every categorical cover of T² has ≥3 members; length ⊤, so no finite cover; 0+1≤n; ∅ is excluded by `[Nonempty X]` (count 0) | holds |
| 6.4 `poincareDuality_of_isFundamentalClass`, `IsFundamentalClass` | S¹/𝔽₂; RP²/ℤ/4 with class 2; two points/ℤ; n=0; M=∅ | caps bijective; 2∈ℤ/4 is not a unit, so excluded, and duality would claim ℤ/4≅ℤ/2; (u₁,u₂) units give (a,b)↦(u₁a,u₂b); μ=1; both sides 0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP²/𝔽₂; ℤ/4; zero ring | Betti 1,1,1 match; 2≠0 in ℤ/4, so excluded, as H⁰=ℤ/4≠ℤ/2=H₂; 0→0 | holds |
| 6.5 linking | RP³; L(5,1), L(5,2); (n,i)=(5,2); sign | ½; {1/5,4/5} vs {2/5,3/5} under k²∈{1,4} and negation; exponent 9, so skew; (−1)^a(−1)^{a(b−1)}=(−1)^{ab}, which for n=2k+1, i=k is (−1)^{k+1} | holds |
| 7.1 Euler–Poincaré | point; one-cell and two-cell circle; S²; Möbius system | 1; 1−1=2−2=0; 1+1=2; d₁=−2: over ℚ both groups vanish (0=1·0), over 𝔽₂ the groups are 𝔽₂, 𝔽₂ with sum 0 | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | S³→S²; Klein bottle over S¹; S²×S²; empty base or fibre | 0=2·0 although d²≠0; 𝔽₂ Betti 1,2,1 and ℚ Betti 1,1,0, both summing to 0=0·0; 4=2·2; 0=0 | holds |
| 8.1 relative groups | (D²,S¹,p); (RP²,RP¹); S¹×S¹ | π₂≅π₁(S¹)=ℤ and π₁ is one point; one 2-cell makes the pair 1-connected, so ℤ→ℤ/2 is onto and not injective; the diagonal maps to (1,1) | holds |
| 8.5 `homologicalWhitehead` | point; Poincaré sphere P→S³; degree 2 on S² | identity; a homology isomorphism, but π₁ has order 120, so excluded; ×2 on H₂ is not an isomorphism | holds |
| 8.5 `homologicalWhitehead_cwType` | ℝ³∖{0} (model S²), x↦x/‖x‖ | isomorphism on H_*; the map is a homotopy equivalence by radial deformation | holds |
| 8.5 `properStrongDeformationRetract_of_inverse` | A=X; (I,{0}); (ℝ,{0}); A=∅ | r=id; H(t,x)=(1−t)x; the constant g has preimage ℝ of {0}, so `hg` fails; g : C(X,∅) forces X=∅ | holds |
| 8.5 `HasProperHomotopyExtensionProperty` | ∅; X; (I,{0}); (I,{0,1/n}) | K=f∘pr; K=H; the piecewise K of R06; fails, since no retraction exists | R06 |
| 8.7 `compactManifoldFiniteCWType` / with boundary | Sⁿ; [0,1]; D²; ℕ discrete; ℝ | finite models; 2+1 cells; a point; ℕ has H₀ of infinite rank, so no finite type; ℝ has a one-point model | holds; Check R05 |
| 8.7 `nonempty_homotopyEquiv_sphere_of_homologySphere` | Sⁿ; P; n=0; n=1 | identity; excluded; a point meets the hypotheses but S⁰ has two points, hence `2≤n`; the hypotheses contradict | holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ; S₃ with g=(12), h=(23) | a point; S¹ with the edge at +1; hg=(132) sends 1↦3 and gh=(123) sends 1↦2; nonabelian allowed, as the predicate is `IsAspherical ∧ Nonempty (π₁≃*G)` (`EilenbergMacLane/Basic.lean:123`) | holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; X=pt; Y Sierpiński; X=βℕ | C(∅,Y)=pt; C(pt,Y)=Y; contractible; true by Milnor Thm 3 but out of 8.11a's reach | route R01 |
| 8.11 model naming | Y=S¹⊆K=ℝ², X=S¹ | π₀C(S¹,S¹)=ℤ, while C(S¹,ℝ²) is contractible | R01 |
| 6.3 native coefficients | RP², 𝔽₂ | the loop acts by −1=1; the native range criterion yields μ | R03 |
| 3.1 Sd and T | [v₀,v₁] | Sd σ=[b,v₁]−[b,v₀]; ∂Tσ+T∂σ=σ−Sd σ, including the degenerate terms | holds |
| 4.7 cell homeomorphism | n=1, z=±1; n=2, z=(1,0) | e₁, e₀; w=(−1,1,0), m=1, giving (0,2/3,1/3); min weight (1−r)/(n+1), so the boundary maps to the boundary | holds |
| 5.6 Čech signs | three opens; two opens | U₂-component c−c=0; δc=(−c,c), the negative of (i_U,−i_V) | holds |
| 6.1 transport | u=2 over ℤ/5; ℤ/2 fibre over ℤ | u⁻¹−1=2 vs u−1=1; direct cochains ℤ/2, dual-system cochains 0 | holds |
| 6.3 boundary sign | D¹, D² | (−1)^m: −1 for D¹, giving ∂[D¹]=[+1]−[−1]; +1 for D², counterclockwise | holds |
| 8.2 Moore complex | ℤ[Δ¹/∂Δ¹] | N₁=ℤ(e−s₀v), N₂=0; ranks 1,2,3 unnormalized | holds |
| 8.9 obstruction | D², f₁ of degree k, attaching degree m | c(f₀)=m, c(f₁)=km, δd=m(k−1)=c(f₁)−c(f₀) under the README's pinned convention | holds |

**Library declarations opened** (file:line).

At 2fd255d9:
- `Topology/CWComplex/Classical/CWType.lean:38`;
- `Topology/Homotopy/LusternikSchnirelmann.lean:264`;
- `AlgebraicTopology/EilenbergMacLane/Basic.lean:59`, `:123`;
- `Singular/LocalHomology/Compact.lean:60`, `:242`, `:328`; `TopHomology.lean:88`, `:97`, `:110`, `:124`; `System.lean:77`;
- `Cohomology/FundamentalClass.lean:88`–`:145`: integral evaluation only, with no coefficient-ring duality;
- `Singular/BrouwerFixedPoint.lean:71`–`:159`;
- `Cellular/EulerCharacteristic/` (`MayerVietoris.lean:93`, `Covering.lean:140`, `Product.lean:80`; no fibre-bundle formula);
- `Topology/Triangulable/FiniteCWType.lean:41`;
- `Algebra/Category/ModuleCat/Tower/` (`DerivedLimit`, `Milnor/Naturality`, `Subsequence/LimOne`).

At both pins, searches found no cup length, Poincaré duality, homological Whitehead, nerve-realization K(G,1), proper deformation retraction, bundle Euler formula, compactly supported cohomology or general-degree EM predicate. So none of the 12 headlines restates a native.

**Cross-roadmap citations resolved on main.**
- GeometricTopology: "smoothing-and-triangulation comparison" item 1 (`:937`–`:942`, Whitehead and Munkres), Layer 1 (`:177`), Layer 11 (`:831`).
- TopologicalKTheory: T1.6a–c (`:394`, `:561`, `:671`).
- CharacteristicClasses: C1.2a S0–S5 (`:512`–`:524`), C1.2b (`:599`), C2.0 (`:730`); C1.2a consumes AT 2–4 and 6.1–6.2 only (`:66`–`:70`).
- GeneralizedCohomology: `realizationProductKelleyComparison` (`:234`).
- DGFloer: Layer 1 (`:451`) and Layer 2 (`:846`).
- ComplexKahlerGeometry: K7 (`:21`).
- MorseTheory: cites only §6's cup-length supplement (`:69`, `:509`).
- Lean files on main import none of the seven deleted modules; only this folder's own files do. FuchsianOrbifolds mentions `compactManifoldFiniteCWType`, which still exists.
- Former Lean names cited by other READMEs on main are covered by `:3512`–`:3535` or by native names; the exception is R07's open roadmap.

**Overlaps and ownership.**
- The dropped `stage-k` anchors are mapped at `:587`–`:604`.
- Searching every open head for the headline names (`roadmaps grep`) finds only HomotopySpheres (#284, a consumer: R07) and the pin-bump #1187.
- StableHomotopyKTheory (#1227) consumes AT 1–4, 4.7, 8.8 and 8.10 and owns none of these objects. Its stale AT names (`simplicialRealizationCW`, `standardCellBallToOrderedSimplex`) are not on main, so this pull request did not drop them.
- ClassifyingSpaces and CharacteristicClasses: covered under R08.

## Not verifiable

- May, *Simplicial Objects*, §14 Theorem 14.1 and §§3, 17: the manifest's copy is image-only and OCR is unavailable on this worker. Cited by locator.
- Conway–Friedl–Herrmann, *Linking forms revisited*: no manifest entry and no cached copy. The sign derivation was recomputed internally (table).
- Freedman–Quinn, Milnor 1963, Weibel, Lee and tom Dieck are uncertified in the manifest. Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary and K. Brown have no copy.
- Elaboration at 2fd255d9 was not run, because the permitted commands run at the branch pin. Instead I read that pin: every carrier `Suggested.lean` uses exists there.

## Source issues

- none
