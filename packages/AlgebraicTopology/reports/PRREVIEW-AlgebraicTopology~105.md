# Review of AlgebraicTopology (pull request #1652 at 456e2cb)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at 456e2cb. The folder has 877 changed lines since 287181d, the head the previous review read. #1663 has been merged into this branch, so the review covers both amendments.

Two findings are blocking:
- **R01:** two headlines are statable at the new pin but absent from `Suggested.lean`, and its module docstring still describes the old pin.
- **R02:** §8.4 states relative Hurewicz with "component" where Hatcher has "path component", and the component reading is false.

The other four findings are P3:
- **R03:** about a dozen targets restate Tau Ceti natives.
- **R04:** three targets have no locator at the claim.
- **R05:** two process words.
- **R06:** the title and description are stale, and no order is stated against five conflicting pull requests.

## Previous findings (review of 287181d)

- **R01 (P2, compact-source mapping-space route): repaired.**
  - §8.11a now states the ANR step for every compact source ("for every compact space X, with no metrizability or separation axiom on X, and every metric ANR Y, the compact-open space C(X,Y) … is a metric ANR", `README.md:3489`–`:3504`). It gives the Dugundji/Kuratowski–Wojdysławski route. The chain C(X,Z)≃C(X,K_w)≃C(X,K_m) is spelled out (`:3517`–`:3520`).
  - The model is renamed Z, and the passage says "the ambient space K is not a substitute for Z" (`:3442`–`:3448`).
  - The βℕ check (`:3653`–`:3657`) and the S¹⊂ℝ² check (`:3658`–`:3660`) test both points.
- **R02 (P3, pin and docstring): partly repaired.** `lake-manifest.json` now pins Tau Ceti 2fd255d9, and `git merge-tree origin/main HEAD` is clean. However:
  - the Hurewicz headlines are still unstated;
  - the module docstring still says the carriers are missing;
  - the CW-type headlines still spell out the model.

  These are carried into R01, now P2, because the pin makes the headlines statable.
- **R03 (P3, local-homology natives): repaired.** `README.md:437`–`:461` names `TauCeti.localHomologySystem` (any abelian category), the `Compact`, `Section` and `TopHomology` lemmas with module coefficients, and the integral fundamental class. §6.3 consumes them and "builds only the twisted-coefficient, boundary and corner extensions" (`:460`–`:461`, `:2078`–`:2081`, `:2149`–`:2161`). §6.4 obtains the 2=0 class from `TauCeti.mem_range_localHomologySystemCone_π_app_iff` (`:2461`–`:2466`).
- **R04 (P3, locators): repaired.**
  - §1.5 (`:721`–`:722`).
  - §2.3: "naturality square (Hatcher, §2.1, p.127) … (Hatcher, §2.1, p.118; naturality p.128)" (`:790`–`:792`).
  - §7.1 Theorem 2.44 (`:2701`–`:2704`).
  - §7.2 Klein–Malkiewich–Ramzi, in the README (`:2728`–`:2729`), in References and in `Suggested.lean:183`–`:184`.
  - §7.3, which separates Exercise 21 from the Mayer–Vietoris form (`:2753`–`:2757`).
- **R05 (P3, 8.7 compactness Checks): repaired.** ℕ discrete and ℝ²∖(ℤ×{0}) are the non-examples, and ℝ is kept as "compactness is sufficient, not necessary" (`:3193`–`:3200`).
- **R06 (P3, proper HEP predicate): repaired.**
  - Five Checks on the predicate, including the (I,{0,1/n}) negative control (`:2973`–`:2987`).
  - The export is stated "at the generality of its statement" (`:3087`–`:3094`).
- **R07 (P3, `poincareDualityMap_isIso`): repaired.** The bullet "`poincareDualityMap_isIso` (the homotopy-sphere roadmap): §6.4, `poincareDuality_of_isFundamentalClass`" is present (`:4096`–`:4097`).
- **R08 (P3, title/description, merge order): partly repaired.** The description now says "#1663 … was stacked on this branch and the merge bot merged it into this branch … #1663 is closed". The title and the rest of the description are unchanged, and no order is stated against the five other conflicting pull requests. Carried as R06.

## R01 (P2) — Relative Hurewicz and universe-general absolute Hurewicz are statable at the pin but absent; the module docstring describes the old pin

**Location.**
- `Suggested.lean:40`–`:44`: "relative Hurewicz … and the universe-general absolute Hurewicz theorem need … (`TauCeti.BasedTopPair`, `TauCeti.RelHomotopyGroup`, `TauCeti.RelHomotopyGroup.hurewicz`, `HomotopyGroup.hurewicz`), which the Tau Ceti revision this file is built against does not have."
- Also `:36`–`:38` (the cup-length bound and the CW models "use only declarations present"), `:44`–`:48` and `:22`–`:24`.

**Claim.**
- Both theorems are named headlines (`:22`–`:23`, README §§8.3–8.4, scope item 6). Every carrier they need exists at 2fd255d9.
- The explanatory paragraph is false at this pin in four places:
  1. The Hurewicz carriers exist.
  2. `TauCeti.lsCategoryCount` and `TauCeti.CWType` exist.
  3. The orientation system is already a `LocalCoefficientSystem`.
  4. The Wang sequence, listed as an unstatable headline, is a Tau Ceti theorem.
- HomotopySpheres (#284 head, `Suggested.lean:34`) checks a `relativeHurewicz` by name.

**Witness.**
- The carriers at the pin:
  - `AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:201` (`HomotopyGroup.hurewicz`, any `Type w`);
  - `Homotopy/Relative/Hurewicz.lean:324`;
  - `Topology/Category/BasedTopPair.lean:41`;
  - `Topology/CWComplex/Classical/CWType.lean:38`;
  - `Topology/Homotopy/LusternikSchnirelmann.lean:264`;
  - `Singular/LocalHomology/System.lean:22`, `:406`;
  - `Singular/MappingTorus/Wang.lean:172`, `:203`–`:223`.
- My scratch copy of the file added the four statements below. `lake env lean` produced no error.

**Repair.** Add the two theorems to Layer 8 and check them on the instances given after the block.

```lean
theorem hurewicz_bijective {X : Type u} [TopologicalSpace X] (x : X) (n : ℕ)
    (hX : ∀ k < n + 2, Subsingleton (HomotopyGroup (Fin k) X x)) :
    Function.Bijective fun a : HomotopyGroup (Fin (n + 2)) X x ↦
      (HomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1) a).hom 1

theorem relativeHurewicz_bijective (X : TauCeti.BasedTopPair.{u}) (n : ℕ)
    [SimplyConnectedSpace X.pair.snd]
    (h₀ : ∀ y : X.pair.fst, ∃ a : X.pair.snd, Joined y (X.pair.map a))
    (h : ∀ k < n + 1, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) X)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) X ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ (ULift.{u} ℤ)) (n + 1) a).hom 1
```

- `RelHomotopyGroup (Fin k)` is π_{k+1}, so the hypothesis is π_i(X,A)=0 for 1≤i≤n+1, as in Tau Ceti's `surjective_hurewicz`.
- Instances:
  - (D³,S²) lies outside Tau Ceti's `bijective_hurewicz_of_subsingleton_homotopyGroup`, which needs π₂(A)=0, while π₂(S²)=ℤ. It lies inside this statement: π₃(D³,S²)≅π₂(S²)=ℤ and H₃(D³,S²)=ℤ.
  - The native theorem is also stated only for `BasedTopPair.{0}`; this one holds in every universe.

Then:
1. Restate `homologicalWhitehead_cwType`, `nonempty_homotopyEquiv_sphere_of_homologySphere` and `finiteSourceMappingCWType` with `[TauCeti.CWType _]` (probe-tested for the first). README `:195`–`:196` no longer applies.
2. Either restate the LS bound with the native count `lsCupLength X R + 1 ≤ TauCeti.lsCategoryCount X Set.univ` (probe-tested) or delete the reason at `:36`–`:38`.
3. Rewrite the paragraph at `:40`–`:58` to list only what is missing:
   - the direct local-system cochains, the twisted cap and relative classes with boundary (not the orientation system);
   - the Künneth, Cartan–Leray and Serre spectral sequences;
   - the normalized EM family;
   - the obstruction cochains;
   - compactly supported cohomology;
   - the pair forms of 8.7.
4. Move the Wang sequence to the list of what Tau Ceti proves.

## R02 (P2) — §8.4 uses "every component of X meets A"; the vanishing it claims needs path components

**Location.** `README.md:2929`–`:2931`: "the pair is (n−1)-connected: every component of X meets A and π_i(X,A,a₀)=0 for 1≤i<n. Prove H_i(X,A;ℤ)=0 for 0≤i<n".

**Claim.** A connected component can contain several path components. Relative homotopy groups see only the path component of a₀, while H₀(X,A) sees all of them. Hatcher's definition uses path components.

**Witness.**
- Take X the closed topologist's sine curve and A={0}×[−1,1], with a₀∈A. X is connected, A is contractible, and π_i(X,A,a₀)=π_i(A,A,a₀)=0 for all i≥1.
- But H₀(X,A;ℤ)=ℤ, from the graph's path component.
- Hatcher Theorem 4.32 (hatcher line 15962, p.366) assumes an (n−1)-connected pair. Its definition requires each path component of X to meet A.

**Repair.** Replace "every component of X meets A" with "every path component of X meets A", the `Joined` hypothesis of R01's statement. On the sine curve the hypothesis now fails, as it must. Check §§8.1 and 8.14 for the same word: both are stated for CW complexes, which are locally path-connected, so no change is needed there.

## R03 (P3) — About a dozen targets restate Tau Ceti theorems that the supplier contracts never name

**Location and witness.** Each README passage below says "Define", "Construct" or "Prove" for something the pin already contains. None of these natives appears in `README.md:250`–`:558`; the only hint is "with subdivision and small-chain suppliers" (`:469`).

| README | Native at 2fd255d9 |
| --- | --- |
| §2.6 `:887`–`:892` pair/triple sequences and relative homotopy invariance with local coefficients | `Singular/Twisted/Relative.lean` (`TopPair.shortExact_twistedChainComplexShortComplex`), `Twisted/Triple.lean:139`, `Twisted/HomotopyInvariance/Basic.lean:305` and `Relative.lean:108` (transport along the homotopy, relative homotopies) |
| §3 preamble `:912`–`:916` and §3.1 `:922`–`:926` subdivision, prism, ∂T+T∂=1−S, twisted versions | `Singular/Subdivision/Basic.lean:227`, `Homotopy.lean:239`, `Twisted/Subdivision.lean:439` |
| §3.2 `:944`–`:946` small chains | `Subdivision/Small/Chains.lean:60`, `Small/Equiv.lean:423` (`TauCeti.smallSingularChainHomotopyEquiv`, Hatcher Prop. 2.21) |
| §5.2 `:1555`–`:1558` Wang sequence, mapping-cone model, naturality | `Singular/MappingTorus/Basic.lean:177`, `:275`, `Wang.lean:172`, `:203`–`:223` |
| §5.4 `:1623`–`:1626` torus homology as exterior powers, natural in maps | `Singular/Torus/Exterior.lean:325`, `:343`; `Pontryagin/Exterior.lean:416` |
| §5.6 `:1672`–`:1677` ordered Čech double complex | `Singular/Cech.lean:113` (`TauCeti.cechDoubleComplex`, tuples i₀<…<i_p) |
| §5.7 `:1698`–`:1701` quasi-isomorphism to singular chains; E¹ spectral sequence | `Cech/OrderedQuasiIso.lean:409`; `Cech/SpectralSequence.lean:55`, `:112`, `:136` |
| §6.1 `:1864`, `:1911`–`:1916` constant cochains, coefficient sequences, Bockstein | `Cohomology/Basic.lean`, `Relative.lean`; `Cohomology/Bockstein.lean:127`, `:278` |
| §6.2 `:1942`–`:1947` constant-coefficient cup/cap, associativity, unit, graded signs | `Cohomology/Cup.lean`, `Cap/Associativity.lean`, `Cap/Unit.lean`, `GradedCommutativity.lean:63` |

Instance: for the reflection of S¹, native `wangδ` and `wang_exact₁`–`₃` already give H₁(Klein bottle)=ℤ⊕ℤ/2. §5.2 as written would build that sequence a second time.

**Repair.**
1. Add one supplier bullet naming these declarations and files.
2. Rewrite each item as "consume X; add Y", keeping only what the pin lacks:
   - §2.6: excision and Mayer–Vietoris compatibilities and naturality not in `Twisted/*`;
   - §3: the twisted small-chain theorem, twisted excision and twisted Mayer–Vietoris (§§3.3–3.4 are genuinely new);
   - §5.2: drop it, or extend to non-homeomorphic monodromy if a consumer needs that;
   - §5.4: the integer-matrix form only, as a corollary of `pontryaginExteriorPower_naturality`;
   - §§5.6–5.7: local coefficients and naturality in covers only, if needed;
   - §6.1: direct local-system cochains and the cup–Bockstein Leibniz signs;
   - §6.2: local-coefficient and relative products.
3. Point §6.5 (`:2561`) at `singularCohomologyBockstein`.

## R04 (P3) — Three targets have no locator at the claim

**Location and witness.**
- **§3.2** (`:944`–`:946`) has no locator. Hatcher Proposition 2.21 is at hatcher line 5222, p.119; it is cited only in the closing paragraph `:971`.
- **§5.1** (`:1537`–`:1541`) constructs the general-ring Künneth spectral sequence with no locator. References `:4244`–`:4245` cite "Weibel … Chapters 3 and 5".
- **§8.12** (`:3667`–`:3680`) identifies RP∞ and CP∞ as K(ℤ/2,1) and K(ℤ,2) with no locator.

**Repair.**
- §3.2: "(Hatcher, Proposition 2.21, p.119; §3.H, p.333, for local coefficients)".
- §5.1: give a theorem-level locator for the Künneth spectral sequence, for example Weibel's Künneth spectral sequence in §5.6 under the manifest's uncertified key `weibel`, with its theorem number.
- §8.12: "(Hatcher, Example 1B.3, p.88; Example 4.50, p.380)". Both are checked: hatcher line 3816 ("RP∞ is a K(Z2,1)") and line 16490 (from S¹→S∞→CP∞, "CP∞ is a K(Z,2)", line 16491).

## R05 (P3) — Process words in §6.3

**Location.** `README.md:2406`–`:2407`, "Consume Layer 2, item 5's corrected two-case normalization"; `:2416`–`:2417`, "consumes the present native arbitrary-pole generator".

**Witness.** "Corrected" and "present" refer to an earlier state of the text. The README house rule requires timeless prose.

**Repair.** Delete "corrected", and replace "the present native" with "the native".

## R06 (P3) — The title and description are stale, and no order is stated against five conflicting pull requests

**Location.**
- Title: "compact Cech pairs and relative cup modules".
- Description: "This amendment changes only README mathematics; existing Lean modules are unchanged."

**Witness.**
- `README.md:173`–`:174` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap.
- `git diff --stat origin/main...HEAD` deletes seven Lean modules and rewrites `Suggested.lean` (5573 deletions).
- The overlaps list shows conflicts:
  - #1187 conflicts in `Suggested.lean` and `TopologicalGroupFundamentalGroup.lean`;
  - #1797, #1807, #1808 and #1854 conflict in `README.md` and `Suggested.lean`.
- The description orders none of them.

**Repair.**
1. Retitle the pull request and rewrite the description to say what the head does: Layer form, Tau Ceti 2fd255d9, deleted modules, §§6.6 and 8.13–8.16.
2. State, for each of #1187, #1797, #1807, #1808 and #1854, which pull request is rebased onto which.

## Verified sound

**Gate, dependencies and build.**
- The worker's gate, and my re-run of it on 456e2cb, show every counter at 0 and "OK". The worktree is clean, and nothing changed outside the folder.
- The dependency check printed `depcheck: 237 roadmaps, 2308 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` at the pin printed exactly 15 "declaration uses `sorry`" warnings and nothing else.
- `git merge-tree --write-tree origin/main HEAD` reported no conflict.

**Lean statements.**
- `#check @` on all 23 declarations elaborated. The worker's 24th entry, "`μ`", is a docstring backtick, not a declaration. The file has no `variable` block, so no binder can be dropped.
- Each elaborated type matches its README statement:
  - §6.2 `:1975`–`:1982`;
  - §6.4 `:2451`–`:2461`;
  - §6.6 `:2611`–`:2615`;
  - §7.2 `:2725`–`:2729`;
  - §8.5 `:3087`–`:3094`;
  - §8.7 `:3156`–`:3163`;
  - §8.8 `:3218`–`:3220`;
  - §8.11 `:3433`–`:3437`;
  - §8.13 `:3873`–`:3876`;
  - §8.15 `:3962`–`:3966`.
- `exists_transverse_circle_classifying_map` is stated in `Type`, because `Circle` and the ℤ-valued `singularCohomology` abbreviation live there.
- One-tactic probe: each of the 15 theorems was tried with `first | rfl | infer_instance | (simp; done) | trivial | decide | (exact ⟨⟩) | aesop`. All 15 failed (15 errors), so none is padding by this test. No declaration restates a definition, mirrors a Check or computes a small value.
- The imports are `import Mathlib` plus six existing `TauCeti.*` modules.

**Sampled locators** (Hatcher printed page = PDF page − 9; Brown = PDF − 25).

| Target | Locator in the README | Source line, printed page | Result |
| --- | --- | --- | --- |
| 1.3 | Hatcher Thm 1.20, p.43 | hatcher 1956–1961 p.43: pairwise path-connected ⇒ surjective; triples ⇒ kernel generated by i_αβ(ω)i_βα(ω)⁻¹ | sound |
| 2.1 | Hatcher §2.1, p.115 | hatcher 5024–5027 p.115: C_n(X,A)=C_n(X)/C_n(A) with the induced boundary | sound |
| 2.3 | p.117; p.127; p.118; p.128 | hatcher 5142 p.117 (∂[α]=[∂α]); 5566 p.127 (pair naturality); 5186–5191 p.118 (triple); 5584 p.128 (triple naturality) | sound |
| 3.1 | Hatcher §2.1, pp.121–122 | hatcher 5314 p.121 (S(λ)=b_λ(S∂λ)); 5336, 5343 p.122 (T λ=b_λ(λ−T∂λ), ∂T+T∂=1−S) | sound |
| 3.2 | none at the claim | Prop. 2.21 at hatcher 5222 p.119 | R04 |
| 4.6 | Hatcher Ex. 2.42, p.144 | hatcher 6230 p.144: deg qϕ=1+(−1)^k | sound |
| 4.7 | VBKT Prop. 1.20, p.36; May Thm 14.1 | hatcher-vbkt 1445 (PDF 40 = p.36) "Every CW complex is paracompact"; May not readable | sound / not verifiable |
| 4.8 | Hatcher A.14–A.16 pp.530–531; pp.523–524, Thm A.6 | hatcher 23034–23037 p.530 (evaluation needs local compactness), 23063 p.531, 23081 p.531 (Y locally compact Hausdorff, Z Hausdorff); 22686–22697 p.524 | sound |
| 5.1 | none for the spectral sequence | — | R04 |
| 6.3 | Lemma 3.27 p.236; Prop. 3.29 p.239 | hatcher 10255 p.236; 10370 p.239: H_i(M;R)=0 for i≥n, connected noncompact M | sound |
| 8.2 | Moore Déf. 4 p.18-07, Th. 3 p.18-04, Th. 4–5 pp.18-06–18-08; Stacks 14.31.6 | moore1955 239 (p.18-07), 139 (p.18-04), 188 (p.18-06), 244 (p.18-07); stacks-simplicial 2740 (Lemma 31.6, tag 08NZ: simplicial groups are Kan) | sound (Moore OCR is poor; only numbering and pages were legible) |
| 8.5 | Hatcher Thm 4.5 p.346, Cor. 4.33 p.367, p.14; FTW 1.6, 4.2, 4.3, 4.9 | hatcher 15109 p.346, 16001 p.367, 795 p.14; ftw1973 134 (proper extension for strongly locally finite K), 600, 610, 752 (simply connected and SC at infinity; H_* and H_c^* isomorphisms) | sound |
| 8.11 | Milnor Thm 3/Cor. 3 p.276, proof of Thm 2 pp.274–276; Dugundji 4.1 p.357, 4.2 p.358, §7 and 7.1 p.363, 7.5 p.365; Hatcher 2C.5 p.182, A.11 p.528 | milnor1959 209–218, 191–206, 119; dugundji1951 155, 201, 342–349, 357, 418; hatcher 7923, 22877 | sound; two misprints under Source issues |
| 8.12 | none | Hatcher Ex. 1B.3 (3816, p.88), Ex. 4.50 (16490, p.380) | R04 |
| 8.14 | Hatcher §4.2 Ex. 13, 16, 17 p.390; 1B.9 p.90; 3.29 p.239 | hatcher 16895, 16908, 16911 (PDF 399 = p.390), 3905 p.90, 10370 | sound |

Also checked:
- §8.15 Ex. 26 and 28 (16974, 16980, p.391);
- §8.16 Ex. 34 (17020, p.392);
- §8.4 Thm 4.32 (15961–15963, p.366, absolute and relative forms);
- KMR intro (kmr2023 25–36, pp.1–2) and Theorem A (48–51, p.2);
- Strøm Theorem 6 (strom1972 181, p.135);
- VBKT Lemma 3.18 p.100 and Prop. 3.19 p.101 (3881, 3908);
- Brown 6.7.5 p.248, Ex. 2 p.249, Ex. 6 p.250, 3.6.4 p.91, 6.7.2 p.240 (brown 9692, 9749, 9768, 3995, 9424).

**Adversarial table** (sampled targets, headlines and every target a finding touches).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.3 based presentation | S¹ = two arcs through x₀; S¹∨S¹ | intersection has 2 components, π₁(U_i)=1, free product 1 ↛ ℤ; wedge: ℤ*ℤ with contractible intersection | holds; the pairwise hypothesis is needed |
| 2.1 relative chains | (X,X); (X,∅) | C_*(X)/C_*(X)=0; C_*(X)/0=C_*(X) | holds |
| 2.3 triple | (D¹,S⁰,pt) | H₁(D¹,S⁰)=ℤ → H₀(S⁰,pt)=ℤ is an isomorphism | holds |
| 3.1 Checks | σ=[v₀,v₁] | Tσ=[b,v₀,v₁]−[b,v₁,v₁]+[b,v₀,v₀]; ∂Tσ+T∂σ=σ−[b,v₁]+[b,v₀]=σ−Sdσ; dropping the degenerate terms leaves +[v₁,v₁]−[v₀,v₀] | holds |
| 3.2 small chains | S¹, two arcs | one subdivision of the loop already lies in the arcs; inclusion of small chains is a homotopy equivalence (native Small/Equiv) | holds; R03, R04 |
| 4.6 RPⁿ differential | k=1,2,3 | 1+(−1)^k = 0, 2, 0; RP² twisted: d₂=0, d₁=±2 ⇒ H₂=ℤ, H₁=0, H₀=ℤ/2; constant: 0, ℤ/2, ℤ | holds |
| 4.7 cell homeomorphism | n=1, z=±1; n=2, z=(1,0) | w=(∓1,±1), m=1 ⇒ e₁, e₀; w=(−1,1,0) ⇒ (0,2/3,1/3); min weight ≥ (1−r)/(n+1) | holds |
| 4.8 compact generation | Sierpiński S | {1} is not k-closed (f:[0,1]→S, f(0)=0, f⁻¹{1}=(0,1]), so kS=S, still not T₂ | holds |
| 5.1 Künneth SS | RP²×RP² over ℤ | E²₀,₂=ℤ/2, E²₁,₂=Tor(ℤ/2,ℤ/2)=ℤ/2; abutment H₂=ℤ/2, H₃=ℤ/2 | holds; R04 |
| 5.2 Wang | reflection of S¹ | id−f_* = 2 on H₁, 0 on H₀ ⇒ H₁(K)=ℤ/2⊕ℤ, the native sequence's value | R03 |
| 5.4 torus | T² with A=[[0,1],[1,0]] | Λ²A=det A=−1 on H₂ | R03 |
| 5.7 Čech SS | point covered twice | augmented row 0→R→R²→R→0 exact; native E¹: |s|=1 gives R², |s|=2 gives R | R03 |
| 6.1 Bockstein | RP², 0→ℤ→ℤ→ℤ/2→0 | β:H¹(RP²;ℤ/2)=ℤ/2 → H²(RP²;ℤ)=ℤ/2 is an isomorphism | R03 |
| 6.2 graded signs | T², a,b ∈ H¹ | b∪a=(−1)^{1·1}a∪b=−a∪b | R03 |
| 6.2 `lsCupLength_add_one_le_of_categoricalCover` | point; S¹; ∅; zero ring | 0+1≤1; 1+1≤2, so a single open S¹ is excluded; ∅ has a 0-member cover, excluded by `[Nonempty X]`; 0+1≤n | holds |
| 6.3 local generator | ℝ^m, v₀=−Σe_i | edge matrix I+J, det 1+m>0; m=1: [−1,1], boundary [1]−[−1] | holds |
| 6.3 boundary sign | D¹, D² | (−1)^m = −1, +1 | holds |
| 6.3 n=0 pole | p₀=q; p₀=−q | ι₀=[−q]−[q]=−s₀ ⇒ σ₀=−1; ι₀=s₀ ⇒ σ₀=+1 | holds |
| 6.4 `IsFundamentalClass` / `poincareDuality_of_isFundamentalClass` | two points/ℤ; RP²/ℤ/4; ∅ | (u₁,u₂) units, cap (a,b)↦(u₁a,u₂b); 2∈ℤ/4 not a generator, so no class exists (H⁰=ℤ/4 vs H₂=ker 2=ℤ/2); both sides 0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP²/𝔽₂; zero ring | Betti 1,1,1 both sides; 0→0 | holds |
| 6.6 `productBallImages_intersect` | p=0; constant f=(a,0), g=(0,b) | p=0: g₂ fixes S_q, misses z ⇒ retraction, excluded by `TauCeti.noRetraction_diskBoundary`; constants: d_f=d_g=0, disjoint, consistent with (−1)^q d_f d_g=0; homotopy H_t: first component ≥ 1−(1−t)=t on S_p×D_q | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | S³→S²; Klein bottle over S¹; empty fibre | 0=0·2; 𝔽₂ 1−2+1=0, ℚ 1−1+0=0, =0·0; 0=χ(B)·0 | holds |
| 8.2 Kan π₁ of nerve | g=(12), h=(23) in S₃ | g then h = hg = (132) (1↦3); gh=(123) (1↦2) | holds |
| 8.3 absolute Hurewicz (R01) | S² in a higher universe | π₂=H₂=ℤ, identity ↦ +[S²]; antipode ↦ (−1)³=−1 | statable; R01 |
| 8.4 relative Hurewicz (R01, R02) | (D³,S²); (D²,S¹∨S¹); sine curve | ℤ=ℤ; F₂ → ℤ² is abelianization (A not simply connected); X connected, π_i(X,A)=0, H₀(X,A)=ℤ | R01, R02 |
| 8.5 `homologicalWhitehead`, `_cwType` | Poincaré sphere P→S³; degree 2 on S² | H_* isomorphism but |π₁|=120, excluded; ×2 on H₂, not an isomorphism | holds |
| 8.5 `properStrongDeformationRetract_of_inverse` | A=X; (ℝ,{0}); (I,{0,1/n}) | r=id; constant g has noncompact preimage ℝ, so `hg` fails; the predicate fails (Hatcher p.14) | holds |
| 8.7 `compactManifoldFiniteCWType` (and boundary form) | ℕ discrete; [0,1]; ∅ | H₀ of infinite rank ⇒ none; 2−1=1; empty model | holds |
| 8.7 `nonempty_homotopyEquiv_sphere_of_homologySphere` | n=0; n=1 | point vs two-point S⁰, hence 2≤n; H₁=0 contradicts H₁≅ℤ | holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; S₃ | point; π₁ has 6 elements and is nonabelian | holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; X=βℕ, Y=S⁰; Y=S¹⊂ℝ² | C(∅,Y)=pt; discrete, 2^ℵ₀ points, covered by the compact-source ANR route; π₀C(S¹,S¹)=ℤ vs contractible C(S¹,ℝ²) | holds (R01 of the previous review repaired) |
| 8.12 EM identifications | RP¹, CP¹ | π₁(RP¹)=ℤ≠ℤ/2; π₃(CP¹)=ℤ≠0 | holds; R04 |
| 8.13 bordism sign | normal rank c, t=1 and t=0 | normal-first gives ∂ = (−1)^c N₁; ×(−1)^c gives N₁ at t=1 and −N₀ at t=0 | holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; dim M=0; M=S¹, f=id | a=0, empty f; H¹=0 and constant −1 avoids 1; 1 is a regular value | holds |
| 8.14 Ex. 13 | n=0 | connected 0-dim CW = point | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n>1 | p²>2 points; free action on S¹ makes G cyclic; dim H^{n+1}(B(C_p²);𝔽_p)=n+2 > 1 bound | holds |

**Library declarations opened** (at 2fd255d9 unless marked Mathlib):
- Hurewicz and relative homotopy: `Homotopy/Hurewicz/Basic.lean:201`, `Absolute.lean:161`, `Relative.lean:199`; `Homotopy/Relative/Hurewicz.lean:324`; `Topology/Category/BasedTopPair.lean:41`.
- CW type and LS category: `CWComplex/Classical/CWType.lean:38`, `FiniteCWType.lean:74`; `LusternikSchnirelmann.lean:264`.
- Local homology: `LocalHomology/System.lean:22`, `:406`; `Compact.lean:341`; `Section.lean:84`.
- Subdivision and twisted chains: `Subdivision/Basic.lean:227`, `Homotopy.lean:239`, `Small/Chains.lean:60`, `Small/Equiv.lean:423`; `Twisted/Subdivision.lean:439`, `Triple.lean:139`, `HomotopyInvariance/Basic.lean:305`, `Relative.lean:108`.
- Wang, Čech and torus: `MappingTorus/Basic.lean:177`, `:275`, `Wang.lean:172`–`:223`; `Cech.lean:113`, `Cech/OrderedQuasiIso.lean:409`, `Cech/SpectralSequence.lean:55`–`:136`; `Torus/Exterior.lean:325`, `:343`; `Pontryagin/Exterior.lean:416`.
- Cohomology: `Cohomology/Bockstein.lean:127`, `:278`; `GradedCommutativity.lean:63`.
- Other Tau Ceti: `HomotopyGroup/Product.lean:176`, `:200`; `HomotopyGroup/LoopSpace.lean:200`, `:321`; `ImplicitFunctionTheorem.lean:407`; `Sard/OutermostStratum.lean:347`; `Geometry/Manifold/Sard/EqualDimension.lean:105`; `Boundary/Collar/Brown.lean:459`; `ContCohomology/DiscreteGroup.lean:166`; `FundamentalGroup/TopologicalMonoid.lean:110`.
- Milnor's model `ClassifyingSpace/Basic.lean` is the orbit space of the countable join, not the nerve, so 8.8 does not restate it.
- Mathlib: `WhitneyEmbedding.lean:132`, `SmoothApprox.lean:79`, `GroupCohomology/FiniteCyclic.lean:91`, `OnePoint/Sphere.lean:34`.
- All 231 dotted backticked names of the README resolve at the pins. The worker's lead `Singular.BrouwerFixedPoint` (`:360`) is the module `TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`.

**Cross-roadmap citations and ownership.**
- CharacteristicClasses (main `:54`–`:69`): C1.2a consumes ordinary AT 2–4 and 6.1–6.2 only, C2 consumes AT 8.9, and C1.5's comparison consumes no AT 8.12. So §§8.12, 8.13 and the supported supplement add no item-level cycle.
- TangentialBordism (#942 head `:82`–`:92`) consumes §8.13's transversality and supplies nothing back.
- DeRhamCohomologyAndDuality (main and #2085 `:64`–`:66`) owns a different object (families against maps into a vector space).
- HomotopySpheres (#1287 head `:128`, `:146`, `:436`) consumes §4.8 and owns no compact generation.
- AlgebraicTopologyPartII (#1694) consumes AT and owns no compact Čech theory.
- MorseTheory (main `:69`, `:509`) uses only the `stage-6` anchor, which is mapped at `:644`–`:672`.
- The dropped anchors (GeneralAlgebraicKTheory, PlanarTopology, SurfaceTopology, DerivedModuleAlgebra, GeneralizedCohomology) are mapped by the Stage→Layer paragraph.
- The dropped Lean names `relativeHurewicz` and `poincareDualityMap_isIso` (HomotopySpheres #284) and `finiteCWEulerCharacteristic` (FuchsianOrbifolds main `Suggested.lean:316`) are mapped at `:4072`–`:4106`.
- No Lean file on main outside this folder imports a deleted module.

## Not verifiable

- **May, *Simplicial Objects*:** Theorem 14.1 (4.7) and §§3, 17 (8.2). The manifest's copy is image-only and OCR is unavailable on this worker.
- **Conway–Friedl–Herrmann:** Prop. 1.2, Lemmas 2.5–2.6 (6.5). There is no manifest entry or cached copy, and this review edits no manifest. The (−1)^{ab} sign derivation was recomputed (table) without their text.
- **Uncertified texts, cited by locator:** Weibel (the theorem number suggested in R04), Lee Theorems 6.26–6.36, Thom 1954 Ch. II, Freedman–Quinn §7.7 and Milnor 1963 Lemmas 3.6–3.7. All are uncertified in the manifest.
- **No manifest copy:** Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary and K. Brown, *Cohomology of Groups*. These are cited at chapter level only.
- **Moore 1955:** the statement text of Théorèmes 3–5 is too garbled to check beyond their numbering and pages.
- **Ownership against the open revision pull requests #1797, #1807, #1808 and #1854:** their files were not given, so ownership against them was not checked beyond the conflict facts in the overlaps list.

## Source issues

- **Misprint** in milnor1959 at the proof of Theorem 2, (c)⇒(d), p.276: the source closes the argument by calling it the proof of Theorem 3; it should say Theorem 2; affects nothing.
- **Misprint** in milnor1959 at the proof of Corollary 3, p.276: the source says Theorem 4 gives the triad's CW type; it should say Theorem 3 (the paper has no Theorem 4); affects nothing.
