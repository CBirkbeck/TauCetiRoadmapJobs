# Review of AlgebraicTopology (pull request #1652 at db70d31)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/AlgebraicTopology/` at db70d31, the head the previous review also read. The gate passes and nothing in the folder is false. There are four findings:

- **R01 (P2, blocking):** the ordinary representability headline is statable at the pins but is missing from `Suggested.lean`.
- **R02 (P3):** two locators cite a source statement weaker than the claim.
- **R03 (P3):** the four dropped `stage-k` anchors are mapped only by a templated sentence, so the overlap check still lists them.
- **R04 (P3):** the pull request's text and merge order. Carried from the previous review.

## Previous findings (review of db70d31, R01 only)

- **R01, stale title and description, no order against the conflicting pull requests, DGFloerPartII §1.0 double ownership: not repaired.**
  - The title is still "AlgebraicTopology: compact Cech pairs and relative cup modules".
  - The description still says "Add a compact-metric Čech construction … This amendment changes only README mathematics; existing Lean modules are unchanged" (`scratch/pull-request.md`).
  - No order is stated against #1187, #1797, #1807, #1808 or #1854.
  - DGFloerPartII's head has moved to 05e7c012 and still owns the identification (`README.md:510`–`:535`, `Suggested.lean:106`).
  - The board has no repair report for that round, so the finding is not settled. It is carried below as R04.

## R01 (P2) — Ordinary representability is statable at the pins but absent; the docstring's reason is incorrect

**Location.** `Suggested.lean:28` lists "ordinary representability with the EM loop comparison" among the headlines. `Suggested.lean:54`–`:56` then says: "The normalized representability and EM-loop headlines need the supplier's functorial normalized K(A,n) family and its universal class; the pins have only K(G,1) spaces." The README states the theorem at `README.md:3818`–`:3823` (§8.10, Hatcher Theorem 4.57) and in Scope item 8 (`:50`–`:52`).

**Claim.** Representability, as Hatcher states it, needs no chosen family of models. It holds for every K(A,n): such a space carries a class ι for which f↦f*ι is a bijection from homotopy classes [X,K] to Hⁿ(X;A) for every CW complex X. So the only missing carrier is a homotopy-group predicate for K(A,n). That is a three-line definition with a real body on Mathlib's `HomotopyGroup`, which the Lean rules allow. The statement over every K(A,n) also implies the README's statement for DGFloer's shared models, since those are K(A,n) spaces.

**Witness.**
- Hatcher line 17069–17071 (Theorem 4.57, p.393) states the bijection for all CW X and "a certain distinguished class α" on K(G,n). It is stated per space, with no family.
- At the pins, Mathlib has no Eilenberg–MacLane predicate, and Tau Ceti has only `TauCeti.IsEilenbergMacLaneSpaceOne` (`AlgebraicTopology/EilenbergMacLane/Basic.lean:123`).
- I wrote a scratch file containing the statement below and ran `lake env lean` on it from the worktree. It elaborates with only the `sorry` warning.
- Other open revisions of this folder already state representability "by every `K(A, n)` model": #1807 `Suggested.lean:91` and #1854 `Suggested.lean:87`, `:741`.

**Repair** (tested). In `Suggested.lean`, Layer 8, add:

```lean
/-- `K` is an Eilenberg–MacLane space `K(A, n + 1)` at `k`: every homotopy group other than
`π_(n+1)` is trivial (so `K` is path connected) and `π_(n+1)(K, k) ≅ A`. -/
def IsEilenbergMacLaneSpace (A : Type u) [AddCommGroup A] (n : ℕ)
    (K : Type u) [TopologicalSpace K] (k : K) : Prop :=
  (∀ i, i ≠ n + 1 → Subsingleton (HomotopyGroup (Fin i) K k)) ∧
    Nonempty (HomotopyGroup (Fin (n + 1)) K k ≃* Multiplicative A)

/-- **Ordinary representability** (Hatcher, Theorem 4.57, p.393). Every `K(A, n + 1)` carries
a class `ι` such that, for every space `X` of CW type, `f ↦ f*ι` is onto `H^(n+1)(X; A)` and two
maps with the same pullback are homotopic. -/
theorem ordinaryRepresentability (A : Type u) [AddCommGroup A] (n : ℕ)
    (K : Type u) [TopologicalSpace K] (k : K) (hK : IsEilenbergMacLaneSpace A n K k) :
    ∃ ι : (TopCat.of K).singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ
        (ModuleCat.of ℤ A) (n + 1),
      ∀ (X : Type u) [TopologicalSpace X] [TauCeti.CWType X],
        (∀ c : (TopCat.of X).singularCohomology (ModuleCat.of ℤ (ULift.{u} ℤ)) ℤ
            (ModuleCat.of ℤ A) (n + 1),
          ∃ f : C(X, K), TopCat.singularCohomologyMap (TopCat.ofHom f) (n + 1) ι = c) ∧
        ∀ f g : C(X, K), TopCat.singularCohomologyMap (TopCat.ofHom f) (n + 1) ι =
          TopCat.singularCohomologyMap (TopCat.ofHom g) (n + 1) ι → f.Homotopic g := by
  sorry
```

Then make three matching edits:
- **Docstring.** Remove "normalized representability" from the list of headlines that cannot be stated. Keep the EM loop comparison there, with its real reason: its coefficient-natural maps, which induce the identity on A, need a chosen functorial family of models (DGFloer Layer 1 item 4).
- **README §8.10.** Name `IsEilenbergMacLaneSpace` and `ordinaryRepresentability`.
- **README Checks for the predicate.** Add at least three:
  - S¹ satisfies it for A=ℤ, n=0.
  - S² fails it for A=ℤ, n=1, since π₃(S²)=ℤ. This is the clause that makes the theorem true: [S³,S²]=ℤ while H²(S³;ℤ)=0.
  - A point satisfies it exactly for A=0.
  - For n=0 it agrees with `TauCeti.IsEilenbergMacLaneSpaceOne` on abelian groups.

**Why the statement is true as written.** K may be any space with these homotopy groups. Take a CW approximation K′→K. It is bijective on homotopy classes from CW sources (Hatcher, Proposition 4.22) and an isomorphism on singular cohomology, so Theorem 4.57 for K′ transports to K. Spaces X of CW type reduce to their CW models. Unbased classes agree with based ones because K is path connected and π₁(K) acts trivially on π_(n+1)(K) (for n=0 because A is abelian). A disconnected X is treated componentwise, and X=∅ gives one map and the zero group.

## R02 (P3) — Two locators cite a source statement weaker than the claim

1. **The Hurewicz map.**
   - **Location.** The map is cited to Theorem 4.32 at six places:
     - `Suggested.lean:199`–`:201` (`hurewicz_bijective`: "the Hurewicz map … is bijective (Hatcher, Theorem 4.32, p.366)");
     - `Suggested.lean:210`–`:214` (`relativeHurewicz_bijective`);
     - `Suggested.lean:258`–`:262` (the homology-sphere corollary);
     - `README.md:3319`, `:3346`–`:3347` and `:3614`.
   - **Claim.** Each passage asserts that the native Hurewicz map is bijective, or (for the corollary) that a generator of πₙ maps to a generator of Hₙ. Theorem 4.32 states only an abstract isomorphism πₙ≈Hₙ. The statement about the map h is Hatcher's Theorem 4.37.
   - **Witness.**
     - Hatcher line 15961–15963 (Theorem 4.32): "πn(X)≈Hn(X)", with no map named.
     - Lines 15976–15980 defer the general relative Hurewicz theorem to Theorem 4.37.
     - Lines 16124–16126 (Theorem 4.37, p.371): h′ is an isomorphism for an (n−1)-connected pair of path-connected spaces with A≠∅.
     - Line 16127: the absolute form is the case where A is the basepoint.
     - π′ₙ=πₙ when π₁(A) is trivial (lines 16117–16120).
   - **Repair.** At those six places write "(Hatcher, Theorem 4.37, p.371, where π′ₙ=πₙ since π₁(A)=1; Theorem 4.32, p.366, for the vanishing below n)". In the absolute case, say "with A the basepoint".
2. **Local-coefficient Mayer–Vietoris.**
   - **Location.** `README.md:1210`–`:1211` (§3.4): "extend its natural long exact sequence to local coefficients (Hatcher, §2.2, p.149; §3.H, p.333)".
   - **Witness.** Hatcher lines 14565–14575 (p.333) give the pair sequence, excision by iterated subdivision, additivity and cellular homology with local coefficients, but not a Mayer–Vietoris sequence. Mayer–Vietoris with local coefficients appears only for cohomology (line 14604, p.334).
   - **Repair.** Write "(Hatcher, §2.2, pp.149–150, for the derivation from the small-chain short exact sequence, applied with the local-coefficient subdivision and excision of §3.H, p.333)".

## R03 (P3) — The dropped `stage-k` anchors are mapped only by a templated sentence

**Location.** `README.md:839`–`:842`: "Stage k is Layer k, with the same title, so the anchor `stage-k-<title>` is the anchor `layer-k-<title>`".

**Claim.** The sentence names no literal anchor. The overlap check (`scratch/overlaps.md`, index of 2026-11-09) still lists all four anchors as dropped and cited:
- `#stage-2-relative-singular-chains-and-homology` and `#stage-4-cw-pairs-cellular-homology-and-cofibrations`, cited by GeneralAlgebraicKTheory (#1212);
- `#stage-6-cohomology-products-and-manifold-duality`, cited by MorseTheory and DerivedModuleAlgebra on main;
- `#stage-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability`, cited by GeneralizedCohomology.

**Witness.** On main, `MorseTheory/README.md:69` and `:509`, and `DerivedModuleAlgebra/README.md:30` and `:1418`, link `../AlgebraicTopology/README.md#stage-6-cohomology-products-and-manifold-duality`. That anchor no longer exists at this head, whose heading is "Layer 6: cohomology, products, and manifold duality". GeneralizedCohomology's `:2284` is a permalink to a fixed commit and is unaffected.

**Repair.** Under that sentence, add a four-row table whose header names the former numbering:

| Former anchor (Stage numbering) | Section now |
| --- | --- |
| `#stage-2-relative-singular-chains-and-homology` | Layer 2 |
| `#stage-4-cw-pairs-cellular-homology-and-cofibrations` | Layer 4 |
| `#stage-6-cohomology-products-and-manifold-duality` | Layer 6 |
| `#stage-8-relative-homotopy-hurewicz-whitehead-and-ordinary-representability` | Layer 8 |

## R04 (P3) — Stale title and description, no stated order against the conflicting pull requests, and DGFloerPartII §1.0 still owns §4.8's identification

**Location.** The title and description of the pull request (`scratch/pull-request.md`), unchanged except for the paragraph "Carries #1663".

**Claim.** The text describes another head. It states no order against the five pull requests that conflict in this folder. It also does not record that DGFloerPartII's coreflection identification becomes a citation of this roadmap.

**Witness.**
- **Wrong scope.** `README.md:189`–`:190` puts "Compact closed-pair Čech theory, continuity and cube-module extensions" outside this roadmap.
- **Unmentioned deletions.** `git diff --stat origin/main...HEAD` deletes seven Lean modules of the folder.
- **Unordered conflicts.** The overlaps list reports conflicts with #1187, #1797, #1807, #1808 and #1854 in `TauCetiRoadmap/AlgebraicTopology/README.md` or `Suggested.lean`.
- **DGFloerPartII.** At its head 05e7c012, `README.md:510`–`:535` identifies `CompactlyGenerated` with Mathlib's `GeneratedByTopCat` and transports `GeneratedByTopCat.adj`, and `Suggested.lean:106` declares `compactlyGeneratedToTop_isLeftAdjoint`. This head owns the same identification at `README.md:161`–`:165` and §4.8 (`:1767`–`:1777`). AlgebraicTopology is on main, so the open roadmap is the one that must cite it.

**Repair.** In the pull request text, not the README:
1. Retitle, and describe what the head does: the Layer form at Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b, the seven deleted modules, §§6.6 and 8.13–8.16, the Hurewicz headlines, Mathlib's coreflection consumed in §4.8, and Hausdorffness of Mathlib's projectivization in §4.6.
2. State the order: this pull request first. Then #1797, #1807, #1808 and #1854 rebase onto it (they edit modules this head deletes, and their `Suggested.lean` differ). #1187's Tau Ceti revision is superseded for this folder by 2fd255d9.
3. State that DGFloerPartII §1.0's identification, convenient products, exponential law and pointed suspension–loop adjunction become citations of AlgebraicTopology §4.8 when this merges.

## Verified sound

**Gate, dependencies, build, merge.**
- My run of the gate from the worktree printed every counter at 0 and "OK", as the worker's `scratch/gate.md` does.
- The dependency check printed `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` exited 0 with exactly 16 "declaration uses `sorry`" warnings (lines 108–371) and nothing else.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty.
- The folder's `PROGRESS.md`, `STATUS.md` and `metadata.toml` are roadmap files, and the gate's `stray-files` count is 0.

**Lean statements.**
- **Padding probe.** I ran a scratch copy with every `sorry` replaced by `first | rfl | simp | infer_instance | decide | trivial | aesop | exact? | sorry` (each followed by `done`), plus `#check @` for all 24 declarations. It elaborated in about 5 minutes and still reported 16 sorries, so none of the 16 theorems closes in one tactic and none is padding by this test.
- **Signatures.** Every `#check @` type matches its README statement. The file has no `variable` block, so no binder can drop.
- **Hurewicz indexing.** The pinned `HomotopyGroup.hurewicz R n` (`Homotopy/Hurewicz/Basic.lean:201`) maps π_(n+1) to H_(n+1). The relative `RelHomotopyGroup.hurewicz R n` (`Homotopy/Relative/Hurewicz.lean:324`) maps `RelHomotopyGroup (Fin n)`, which is π_(n+1)(X,A), to H_(n+1)(X,A). So the headlines' argument `(n + 1)` lands in degree n+2 as their docstrings say.
- **What the natives cover.** The native absolute theorem is for X in `Type` (`Hurewicz/Absolute.lean:161`). The native relative one needs B and Y both (n+1)-connected (`Hurewicz/Relative.lean:282`). Both headlines generalize them.
- **No sorried data.** `cupProduct`, `LSPositiveCupProduct`, `lsCupLength`, `IsFundamentalClass`, `groupClassifyingSpace`, `groupClassifyingSpaceBasepoint` and `HasProperHomotopyExtensionProperty` all have real bodies.
- **Universe of the transverse circle map (remark, no change).** `exists_transverse_circle_classifying_map` is stated for `Type`. `Circle` lives in `Type` and `TopCat.ofHom f` needs both ends in one universe, so a universe-polymorphic form would need a `ULift` of the target and adds no mathematics. The README states §8.13 with no universe.
- **Connectedness in the two-torsion Poincaré duality headline (remark, no change).** `[ConnectedSpace M]` is used by its stated route (Tau Ceti's top-homology lemma for compact connected M).

**Seeded sample** (Hatcher printed page = cache marker − 9).

| Target | Locator | Source line, printed page | Result |
| --- | --- | --- | --- |
| 1.6 | Hatcher §3.C Ex. 5, p.291; native `cast_map_prod_mul`, `instCommGroup` | hatcher 12736–12742 (marker 300); Tau Ceti `FundamentalGroup/TopologicalMonoid.lean:54` (`[MulOneClass M] [ContinuousMul M]`, as the README paraphrases), `:110`, `:120` | sound |
| 2.1 | §2.1, p.115 | hatcher 5024–5027 (marker 124) | sound |
| 3.3 | Thm 2.20, p.119; §3.H, p.333 | 5200–5204 (marker 128); 14569–14570 | sound |
| 3.4 | §2.2, p.149; §3.H, p.333 | 6503–6521 (marker 158: ordinary MV, interiors cover); 14565–14575 has no MV | R02 |
| 4.1 | Appendix Ex. 1, p.529 | 22952 (marker 538) | sound |
| 4.2 | cellular boundary formula, p.140; Lemma 2.34, p.137 | 6086–6088 (marker 149); 5963–5966 (marker 146) | sound |
| 4.5 | Thm 4.8, p.349; Prop. A.3, p.522; Prop. 0.19, p.16; Thm A.6, p.524; Strøm Thm 6, p.135 | 15205 (marker 358); 22617 (marker 531); 867 (marker 25); 22693 (marker 533); strom1972 179–185 (closed A, product pair cofibered) | sound; Milnor 1963 not verifiable |
| 5.6 | none | a construction (twisted Čech double complex) with three Checks; the constant case is native `TauCeti.cechDoubleComplex` and `Singular/Cech/*.lean` carries no local system | no locator needed for a definition |
| 6.1 | pp.333–334; pp.330–331; pp.328–329; Thm 3.5, p.203; §3.H, p.334 | 14576–14584; 14476–14479 (coefficients at σ(v₀)); 14326–14331; 8799 (marker 212); 14605–14607 | sound |
| 6.3 | Lemma 3.27, p.236; Prop. 3.29, p.239 | 10255–10258 (marker 245); 10370–10371 (marker 248) | sound |
| 7.2 | Thm 2.44, p.146; §2.2 Ex. 20, p.157; KMR pp.1–2 and Thm A, p.2 | 6380 (marker 155); 6854 (marker 166); kmr2023 25–36, 48–51 | sound |
| 8.4 | §4.1, p.346; Thm 4.32, p.366 | 15099–15102 (path components in degree 0); 15961–15963 (abstract iso) | locator R02 |
| 8.6 | §4.1, p.340 | 14821–14826, 14846–14848 | sound |
| 8.7 | GeometricTopology smoothing-and-triangulation item 1; Tau Ceti `IsTriangulable.finiteCWType`; Thm 4.32; Cor. 4.33, p.367 | GT main `README.md:776`–`:778` maps item 1 to Layer 11.3 (`:7887`, Whitehead 1940); `Topology/Triangulable/FiniteCWType.lean:41`; 16001–16002 | sound; 4.32 R02 |
| 8.12 | Ex. 1B.3, p.88; Ex. 4.50, p.380; native `AddCircle.isEilenbergMacLaneSpaceOne` | 3816 (marker 97); 16490 (marker 389); `UniversalCover/Circle/EilenbergMacLane.lean:47` | sound |

Also read in the cache: Hatcher Ex. 2.42 (6223–6230, p.144), §4.2 Exercises 13, 16, 17, 26, 28, 34 (16895, 16908, 16911, 16974, 16980, 17020, pp.390–392), and Theorem 4.57 (17069, p.393).

**Adversarial table.** It covers the sampled targets, all 16 headline theorems, their definitions, and the statements the findings touch.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 1.6 naturality and order of concatenation | U(1), loops of degree m, n; squaring map | pointwise product m+n both ways; squaring: 2m+2n from either order, one-factor model 2m+n; SO(3): π₁=ℤ/2, γ·γ contractible | holds |
| 2.1 two forms of relative chains | A=∅; A=X | C(X)/0=C(X); C(X)/C(X)=0 | holds |
| 3.3 local excision | S¹, A=S¹∖{p}, Z a closed arc in A, sign system ε | left H₁(arc, arc∖p)=H̃₀(two arcs)=ℤ; right: H₁(S¹;ε)=0→H₁(S¹,A;ε)→H₀(A)=ℤ→H₀(S¹;ε)=ℤ/2, so 2ℤ≅ℤ | holds |
| 3.4 local MV, first map (i_U,−i_V) | S¹=two arcs, constant ℤ and ε | ℤ: [[1,1],[−1,−1]], kernel ℤ(1,−1)=H₁, cokernel ℤ=H₀; ε: [[1,1],[−1,1]], det 2, kernel 0=H₁(S¹;ε), cokernel ℤ/2=H₀ | holds |
| 4.1 lifted CW, surjectivity clause | z↦z² on one-vertex S¹; S¹⊂S¹⊔S² | 2 vertices, 2 edges, χ=0=2·0; lifted dimension 1 over base dimension 2 | holds |
| 4.2 incidences | RP², integral | native even i: 0, odd i: ±2, so d₂=±2, d₁=0; Hatcher d_k=1+(−1)^k: d₂=2, d₁=0 | holds |
| 4.5 pushout Checks | S⁰→*; degree-m 2-cell on S¹ | χ(S¹)=1−1=0 (wrong models 2, 1); m=0: S¹∨S², H₂=ℤ; m=2: RP², H₁=ℤ/2, H₂=0 | holds |
| 5.6 Čech signs | U₀₁₂ chain c; two-open cover; c at (1,1) | δc=(c,−c,c), U₂-part of δδc=c−c=0 (unsigned 2c); two opens: (−c,+c)=−(i_U,−i_V); D=δ+(−1)^p∂ gives D²c=∂δc−δ∂c=0, while δ+∂ gives 2δ∂c | holds |
| 6.1 direct cochains | rank one, monodromy u; ℤ with u=−1; ℤ/5 with u=2; fibre ℤ/2 over ℤ | δ⁰a=u⁻¹a−a both models; −2a vs −2a; 3a−a=2a vs 2a−a=a; dual fibre Hom(ℤ/2,ℤ)=0 | holds |
| 6.1 RP² with ε | cellular | δ⁰=±2, δ¹=0: H⁰=0, H¹=ℤ/2, H²=ℤ, matching H₂,H₁,H₀(RP²;ℤ)=0,ℤ/2,ℤ | holds |
| 6.3 local generator, boundary sign | v₀=−Σe_i, v_i=e_i; D¹, D² | det(I+J)=1+m>0, barycentre 0; (−1)^(m−1)·(−1)=(−1)^m: −1 for D¹, +1 for D²; ∂[D¹]=[+1]−[−1] | holds |
| 7.2 `finsum_finrank_singularHomology_fiberBundle` | Hopf; Klein bottle; S²×S²; empty base or fibre | 0=2·0; 𝔽₂: 1−2+1=0, ℚ: 1−1+0=0; 1+2+1=4=2·2; empty total space, 0=0; homology is finite-dimensional and bounded by the E² page, so the finsum has finite support | holds |
| 8.4 `relativeHurewicz_bijective` hypotheses | (D³,S²), n=1; (D²,S¹∨S¹); closed sine curve with A the segment | π₃(D³,S²)=π₂(S²)=ℤ=H₃; π₂=F₂→H₂=ℤ² is abelianization (A not simply connected); π_i(X,A)=0 for all i but H₀(X,A)=ℤ, excluded by `h₀` | holds |
| 8.4 consequences | H_i(X,A)=0 for i<n | H_i(A)→H_i(X) injective for i<n−1 and surjective for i≤n−1, from the pair sequence; π₂(X)↠π₂(X,A), so π₂(X,A) is abelian | holds |
| 8.6, 4.4 sphere normalization | n=1, n=2 | n=1: (0,1)→(−.87,−.5)→(0,−1)→(.87,−.5), counterclockwise, +1; n=2: det(−e₂,e₀,e₁)=−1, det A=−1, A e₂=e₀; product +1 | holds |
| 8.7 CW-type headlines and recognition | ℕ discrete; ℝ²∖(ℤ×0); [0,1] half-space; n=0, n=1 | infinite-rank H₀ and H₁, no finite model; χ=2−1=1; n=0: contractible vs S⁰, so `2 ≤ n` is needed; n=1: H₁≅ℤ contradicts simple connectivity | holds |
| 8.12 EM comparisons | RP∞, RP¹, CP∞, CP¹ | π₁=ℤ/2 vs ℤ; π₂=ℤ, CP¹=S² has π₃=ℤ; ⟨h,[CP¹]⟩=±1 by orientation | holds |
| 6.2 `lsCupLength_add_one_le_categoryCount` | point; S¹; T²; RP∞ over 𝔽₂; zero ring; ∅ | 0+1≤1; 1+1≤2; 2+1≤3; ⊤≤⊤ (infinite category); 0+1≤count; ∅: count 0, excluded by `[Nonempty X]` | holds |
| 6.4 `IsFundamentalClass`, `poincareDuality_of_isFundamentalClass` | two points over ℤ; S¹ with 2[S¹]; RP² over ℤ/4; ∅ | (a,b)↦(u₁a,u₂b) bijective; local image 2, caps ×2, not fundamental; 2e²↦2∈ℤ/4, not a generator, so no claim (H⁰=ℤ/4 vs H₂=ℤ/2); 0→0 | holds |
| 6.4 `poincareDuality_twoTorsionCoefficients` | RP²/𝔽₂; μ=0; zero ring | Betti 1,1,1 matched; zero class fails, generator works; all 0 | holds |
| 6.6 `productBallImages_intersect` | p=0; q=0; p=q=1 with f(x)=(x,0), g(y)=(0,y) | g₂ fixing S_q and missing z gives a retraction, excluded; f₁ restricted to S_p is the identity, so f₁ is onto D_p; common point (0,0) | holds |
| 8.3 `hurewicz_bijective` | X=S², n=0; X=S¹; X=S³, n=1 | π₂=H₂=ℤ; π₁≠1 excluded by k=1<2; π₃=H₃=ℤ; `(n + 1)` lands in H_(n+2) | holds |
| 8.5 `homologicalWhitehead` | id of a point; Poincaré sphere P→S³; degree 2 on S² | identity; homology iso but |π₁P|=120, excluded; ×2 on H₂, not an iso | holds |
| 8.11 `finiteSourceMappingCWType` | X=∅; βℕ with Y=S⁰; S¹ into Z=S¹⊂K=ℝ² | one point; discrete with 2^ℵ₀ points; π₀C(S¹,S¹)=ℤ vs C(S¹,ℝ²) contractible | holds |
| 8.8 `groupClassifyingSpace_isEMOne` | trivial group; ℤ/2; S₃ | point; RP∞, π₁=ℤ/2; π₁ of order 6, nonabelian; `IsEilenbergMacLaneSpaceOne` = aspherical plus π₁≃*G (`Basic.lean:123`) | holds |
| 8.5 `HasProperHomotopyExtensionProperty`, `properStrongDeformationRetract_of_inverse` | A=∅; A=X; (I,{0}); (I,{0,1/n}); (ℝ,{0}) | K=f∘pr, proper since I is compact; K=H; piecewise K, proper on a finite closed cover; no retraction of I×I onto I×0∪A×I (Hatcher p.14); g:ℝ→{0} is not proper, so the hypotheses fail | holds |
| 8.13 `exists_transverse_circle_classifying_map` | M=∅; dim 0; M=S¹, a a generator; b 0=−generator | empty f; H¹=0, f≡−1 misses 1; f=id, 1 regular; use conj∘f | holds |
| 8.15 `elementaryAbelianPair_sphere_action_has_stabilizer` | n=0; n=1; n≥2 | p²≥4>2 points; free actions on S¹ are cyclic; dim H^(n+1)(B(C_p²);𝔽_p)=n+2>1 | holds |
| R01 `ordinaryRepresentability` (proposed) | K=S¹, A=ℤ, n=0; A=0; X=∅; K=S² with A=ℤ, n=1 | [S¹,S¹]=ℤ=H¹(S¹); weakly contractible K: one class, H=0; one map, H=0; S² fails the predicate (π₃=ℤ) and the conclusion fails for X=S³: [S³,S²]=ℤ vs H²(S³)=0 | holds; elaborates |
| R02 Hurewicz locator | Hatcher 4.32 vs 4.37 | 4.32: πₙ≈Hₙ, no map; 4.37: h′ an isomorphism, π′=π for π₁(A)=1 | locator only |
| 6.5 linking sign | (n,i)=(3,1), (5,2); CFH Lemma 2.6 with k=a−1 | exponent 4, symmetric; 9, skew; (−1)^a·(−1)^(a(b−1))=(−1)^(ab)=(−1)^((n−i)(i+1)) | holds |
| 3.1 subdivision and prism | 0- and 1-simplex | Sd σ=[b,v₁]−[b,v₀], boundary ∂σ; ∂Tσ+T∂σ=σ−Sd σ, with the degenerate terms needed | holds |
| 5.2 Wang for continuous maps | reflection; z²; constant; f=g=id | H₁(Z)=ℤ/2⊕ℤ; ℤ with H₂=0; ℤ with H₂=0; H_n(Y)⊕H_(n−1)(X) | holds |
| 6.0 towers | ×2 tower; ×3 tower in degree −1 | 3x₀+1 ≡ 0 mod 4^k for every k is impossible; Σ3ⁿ=−1/2∉ℤ, so the cone map depends on the chosen homotopies | holds |
| 8.2 Moore complex | free simplicial abelian group on Δ¹/∂Δ¹ | N₁=ℤ(e−s₀v), d₀=0, N₂=0, so π₀=π₁=ℤ | holds |

**Library declarations opened at the pins** (Tau Ceti 2fd255d9 unless marked).
- Cohomology and EM spaces: `AlgebraicTopology/Cohomology/Basic.lean:89`–`:137`; `EilenbergMacLane/Basic.lean:59`, `:123`.
- Hurewicz: `Homotopy/Hurewicz/Basic.lean:157`, `:201`; `Hurewicz/Absolute.lean:161`; `Hurewicz/Relative.lean:282`; `Homotopy/Relative/Hurewicz.lean:190`, `:324`.
- CW type: `Topology/Triangulable/Basic.lean:38`; `Triangulable/FiniteCWType.lean:41`.
- Other natives: `FundamentalGroup/TopologicalMonoid.lean:54`, `:110`, `:120`; `Topology/Homotopy/LusternikSchnirelmann.lean:264`; `UniversalCover/Circle/EilenbergMacLane.lean:47`; `Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`.
- Absences confirmed:
  - The `Singular/Twisted/` modules have no small-chain, excision or Mayer–Vietoris module, and `Singular/Cech/*.lean` has no local system, as §§3.2–3.4 and 5.6 say.
  - `Singular/Fibration/LocalSystem.lean:102` (`TauCeti.fiberLocalSystem`) is the fibre-homology system of a Hurewicz fibration with a lifting function; §5.5 takes the Serre-fibration version from DGFloer, so nothing is restated.
  - Mathlib 1b1ccf4b contains no file mentioning Eilenberg–MacLane spaces.

**Cross-roadmap citations** (resolved on main 3090489).
- **DGFloer.** Layer 1 items 1 (`:462`), 2 (`:470`: CW approximation, relative-CW lifting, LES, Serre sequences), 3 (`:621`) and 4 (`:659`, functorial abelian K(A,n) at `:673`); Layer 2 item 3 (fixed-interval loops).
- **GeneralizedCohomology.** G2.1 `realizationProductKelleyComparison` (`:234`); G2.10 `numerableFiberBundle_hurewicz` (`:651`).
- **CharacteristicClasses.** C1.2a (`:512`).
- **ComplexKahlerGeometry.** K7 (`:1405`) and K7.1 (`:291`).
- **DifferentialGeometry.** 10.2 (`:884`).
- **GeometricTopology.** Layer 1 collars and tubes (`:788`, `:974`); Layer 11.1 (`:7740`); "item 1" through its own anchor map (`:776`–`:778`).
- The worker's resolve lead `Singular.BrouwerFixedPoint` (README 393) is a module name; `Singular/BrouwerFixedPoint.lean` exists at the pin.
- **Forbidden suppliers.** No roadmap on the never-cite list is used as a supplier. "the homotopy-sphere roadmap" appears only as a consumer (`:198`, `:4528`, `:4530`).

**Overlaps and ownership.**
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- The dropped anchors are R03; the conflicting heads and DGFloerPartII are R04.
- Ownership against #1187, #1797, #1807, #1808 and #1854 was not checked beyond the overlaps list and one search of their Lean files for K(A,n) statements, used only as corroboration in R01.

## Not verifiable

- **May, *Simplicial Objects*** (4.7, Theorem 14.1; 8.2, §§3, 17): the manifest's copy is image-only and OCR is unavailable on this worker; it is listed in `needs-references.toml`.
- **Milnor, *Morse Theory*, Lemmas 3.6–3.7** (4.5), and the other uncertified manifest entries cited by locator: Lee, Thom 1954, Weibel, Freedman–Quinn, tom Dieck, Serre 1953, Dowker 1952. They are paywalled and settled as uncertified.
- **Conway–Friedl–Herrmann:** the theorem numbers were verified on arXiv by the previous full review. The published pages (494, 499, 502, 503–504) are not in that text.
- **Chapter-level citations with no manifest copy:** Eilenberg–Steenrod, G. W. Whitehead, Dold, Serre 1951, McCleary, K. Brown *Cohomology of Groups*.

## Source issues

- none
