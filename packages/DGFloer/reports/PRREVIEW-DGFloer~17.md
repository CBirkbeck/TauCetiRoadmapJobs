# Review of DGFloer (pull request #1798 at 95dc935)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at 95dc935. The folder changed by 2411 lines since 72a3f12. The gate passes (rerun this round), and nothing outside the folder changes. Five findings block acceptance:

- one false target (R01);
- one statable headline that is missing (R02);
- one statement more general than its source and route (R03);
- one object with two owners (R04);
- one target restated without its hypothesis (R05).

## Previous findings (review at 72a3f12)

- **R01, Theorem A absent and false docstring claims: repaired.** `Suggested.lean:104` and `:126` state both cases. The L/M, fibration-theorem and Arnold bullets (`:40–54`) name the carriers that are really missing. The Theorem C bullet (`:37–39`) follows the old review's wording, but this round finds Theorem C statable after all (R02 below).
- **R02, restated cubical and Moore theory: repaired.** Layer 0 is only 0.1, Layer 2 consumes Tau Ceti (`README.md:1388–1391`), and the conventions carry metrizability (`:265–270`).
- **R03, restated cotangent and Liouville theory: repaired.** Items 6.2–6.5 consume the pin (`:2075–2079`, `:2098–2105`, `:2152–2158`). The annulus Check restates non-monotonicity against the pinned capacity (`:2176–2182`). 7.C.1 cites `TauCeti.Floer.PeriodGroup` and `TauCeti.Floer.CapClass` (`:2375`).
- **R04, HamiltonianSystems: repaired on this side.** The row at `:188` and the consumer entry at `:3759–3761` say HamiltonianSystems consumes Layer 6 item 0. The HamiltonianSystems head (#480, ef23c04) still builds its own Layers 1–2 and does not cite DGFloer. That pull request has to settle it; this README now takes the position the merge direction requires.
- **R05, upward AnalyticStableMaps edge: repaired for the gate** (depcheck 0 problems), by taking ownership as 7.C.2d. That move creates two owners (R04 below).
- **R06, DifferentialGeometry Layer 10: repaired.** No Layer 10 citation remains, and 10.5 uses `TauCeti.HomologicalOrientation.mapFundamentalClass` (`:3622`).
- **R07, the Layer 6 API catalogue: repaired.** `Suggested.lean` has 4 declarations.
- **R08, Check signs: repaired** at `:1676–1678`, `:3301–3302`, `:500` and `:2304–2308`. A new sign conflict appeared in 8.4 (R07 below).
- **R09, TeX at line 1974: repaired** (`:2022`; gate `tex=0`).
- **R10, #963 order: not repaired.** The description's merge-order paragraph still does not mention #963 (R16 below).

## R01 (P1) — Layer 2 item 1: the Moore loop map of a Hurewicz fibration is not a fibration

- **Location.** `TauCetiRoadmap/DGFloer/README.md:1395–1398`: "for a Hurewicz fibration `p : E → B` and `e ∈ E`, the induced map of Moore loop spaces `Ω_e E → Ω_{p(e)} B` … is a Hurewicz fibration, and so is the induced map of double Moore loop spaces."
- **Claim.** This is false. Fibres over one path component of the base have different homotopy types. The README's own Checks at `:1407–1416` compute those fibres.
- **Witness.** Take `E = B × S¹`, with `p` the first projection (pinned `TauCeti.isHurewiczFibration_fst`). The fibre over the duration-0 constant loop is a point. Over the duration-1 constant loop it is `Ω^{[0,1]}S¹`, which has ℤ components. The path `s ↦ (s, const_b)` joins these two base points, so no homotopy lifting is possible.
- **Repair.** Replace the statement with what holds:
  - Over the Moore loops of **positive** duration, rescaling `(L, γ) ↦ (L, γ(L·))` identifies the map with `id_{(0,∞)} ×` the pinned `TauCeti.IsHurewiczFibration.loopMap`, which is a Hurewicz fibration. The same applies to `loopMap_loopMap`.
  - The full map is not a fibration.
  - Add the `B × S¹` computation as a negative-control Check. Its fibres over every positive duration are `≃ ΩS¹`.
  - Nothing else in this README consumes 2.1's claim. DGFloerPartII cites Layer 2 item 1 only for the Moore carrier.

## R02 (P2) — Theorem C is statable at the pins but declared not statable

- **Location.** `Suggested.lean:37–39`: "Theorem C … a mod-2 fundamental class of a closed non-orientable manifold, for the mod-2 degree of `π ∘ φ`". Also `README.md:3629–3631`: "Theorem C is not statable at the pins".
- **Claim.** No mod-2 fundamental class is needed. When `S` is connected, `deg₂(π∘φ) ≠ 0` exactly when `(π∘φ)_*` is nonzero on Mathlib's `H_n(−; ZMod 2)`. When `S` is disconnected, a nonzero map gives a component of odd degree, so the statement has exactly the source's strength.
- **Witness.** The statement below elaborated in a scratch copy with `lake env lean`; the only warning is `sorry`. The source's Theorem C is at `bdho-cotangent` line 249, and Theorem 5.15 at line 4293.
- **Repair.** Add the statement below, remove the Theorem C bullet from the "not statable" list, and state it in README 10.5. Its instance check: for `Q = S = ℝP²` with `φ` the zero section, the map on `H₂(−; 𝔽₂) = 𝔽₂` is the identity. Also `π₂(ℝP²) = ℤ` with squaring not surjective, and `ℝP²` has no orientation.

```lean
theorem hasContractibleAlmostExistence_of_mod_two_degree_ne_zero {Q S : Type} [TopologicalSpace Q]
    [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q] [ConnectedSpace Q]
    [TopologicalSpace S] [T2Space S] [ChartedSpace E S] [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (hQo : IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))) (q : Q)
    (hQ : ∃ n : ℕ, ¬ Function.Surjective (fun a : π_ (n + 2) Q q ↦ a ^ 2))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q))
    (hφ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom
          ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
            C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ)) ≠ 0)
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφc : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry
```

## R03 (P2) — Theorem A lets `S` be a topological manifold; the source and the route need a smooth one

- **Location.** `Suggested.lean:106` (`[TopologicalSpace S] [T2Space S] [ChartedSpace E S] [CompactSpace S]`, with no `IsManifold`) and `:128`. Also `README.md:3620–3621`: "`S` a compact topological manifold".
- **Claim.** The source proves Theorem A as Theorem 5.10 for a **smooth** closed manifold `S`. The step `ker π_{U!}` is `d`-torsion (Proposition 5.13, README 10.4) needs the Morse shriek map `(π∘φ)_!` of Layer 5 item 3, which exists only between smooth manifolds. Nothing in the roadmap owns a topological substitute.
- **Witness.** Theorem 5.10 says "smooth n-dimensional orientable closed manifold S" (`bdho-cotangent` lines 4140–4142). Proposition 5.13 uses `(π∘φ)_*(π∘φ)_! = d·Id` (line 4241), which is BDHO Proposition 10.6.1 for closed oriented manifolds (`bdho-morse-dg` line 7091).
- **Repair.**
  - Add `[IsManifold 𝓘(ℝ, E) ∞ S]` to both theorems. This was tested: the first case with that binder elaborated.
  - Write "a closed smooth oriented manifold `S`" in both docstrings and in README 10.5.
  - Alternatively, own a topological-manifold umkehr map as a target with a locator.

## R04 (P2) — Genus-zero stable-map compactness has two owners: 7.C.2d and AnalyticStableMaps Layer 3

- **Location.** `README.md:93–95` claims ownership of "unforced genus-zero stable maps with marked points over a compact family of tame almost complex structures, their Gromov topology, Gromov compactness". `:2605–2715` builds them. `:176` says AnalyticStableMaps' compactness "contains its compactness statement at genus zero".
- **Claim.** AnalyticStableMaps owns the same theorem and lists DGFloer as its consumer. It is earlier in the merge order, so this roadmap re-plans it.
- **Witness.** At the AnalyticStableMaps head (#987, 41557ba), `TauCetiRoadmap/AnalyticStableMaps/README.md` has:
  - `:647`: compactness for "a compact smooth tame family `J_p`", by Ivashkovich–Shevchishin Theorem 1.1 and Remark 2, with graph bounds `#ghost ≤ 2g − 2 + n + 2a` and `#edges ≤ 3a + 3g − 3 + n`. At `g = 0` these are 7.C.2d's bounds;
  - `:609`: the energy threshold for compact families;
  - `:1128`: "DGFloer consumes … the genus-zero compactness of Layer 3".
- **Repair.** Settle one owner, and say which in the row at `:176`.
  - **Preferred, following the merge order.** Delete 7.C.2d's construction. Consume AnalyticStableMaps §3.4 and §3.7 through a declared gap under `## Exact supplier contracts`: "What AnalyticStableMaps must provide (gap:genus-zero-stable-map-compactness): for closed `(X, ω)`, compact metrizable `P` and continuous `p ↦ J_p` into tame structures, compactness, Hausdorffness and metrizability of the `k`-marked genus-zero stable maps of each class, with proper projection to `P`, uniqueness of limits and class conservation". Put the same slug in the plan's `gaps`.
  - **Otherwise.** Keep 7.C.2d, and have #987 cite it at genus zero and drop DGFloer from its `:1128`.

## R05 (P2) — Layer 10 item 4: Proposition 5.11 is restated without the hypothesis of its second part

- **Location.** `README.md:3591–3593`: "prove Proposition 5.11: the kernel of `i_{Q*}` contains an infinite cyclic group, a copy of `π_k(Q)`, or a class that is not `d`-torsion, according to the first nonvanishing higher homotopy group".
- **Claim.** The third alternative does not depend on the first nonvanishing group. It needs `d ≥ 2`, `k > 2` (so `π₂(Q) = 0`), and some `π_ℓ(Q)` with `ℓ > 2` that is not annihilated by `d^m` for any `m`. Theorem 5.10's condition 2 uses exactly that implication.
- **Witness.** `bdho-cotangent` lines 4154–4161 (Proposition 5.11, parts 1–2) and lines 4255–4258 (its use under condition 2 of Theorem 5.10).
- **Repair.** State the three cases with their hypotheses:
  - `k = 2`: `ker i_{Q*}` contains a copy of ℤ;
  - `k > 2`: it contains a subgroup isomorphic to `π_k(Q)`;
  - for `d ≥ 2`, `k > 2` and some `π_ℓ(Q)`, `ℓ > 2`, not `d^m`-torsion for any `m`: `ker i_{Q*}` is not `d`-torsion.

  Tested on `Q = S³`, `d = 2`: `k = 3`, `π₃ = ℤ`, and the kernel contains `H₁(Ω²S³) = ℤ`, which is not 2-torsion.

## R06 (P3) — A dependency cycle between Layer 5 item 6 and Layer 9 item 3

- **Location.** `README.md:1796`: "Layer 9 item 3 (the weak equivalence of the colimit)", in 5.6's *Needs:*. Also `:3471`: 9.3's *Needs:* includes "Layer 5 item 6".
- **Claim.** 5.6 needs 9.3 and 9.3 needs 5.6, so Layers 5 and 9 form a cycle.
- **Witness.** What 5.6 uses, the compact-family approximation lemma (`:3474–3493`), needs only Moore loops, convex balls and Layer 1 item 2.
- **Repair.** Move the compact-family approximation lemma into 5.6, or into a new item before it, and have 9.3 cite it. Then fix `:1796` and `:1836`.

## R07 (P3) — The 8.4 Check uses the source's continuation direction, against 7.1 and 7.4

- **Location.** `README.md:3347–3349`: "A monotone homotopy `∂_s H ≤ 0` preserves the action filtration; a general homotopy shifts it by `∫ max_X ∂_s H ds`".
- **Claim.** 7.1 fixes negative-end input. There `𝒜_{H₊}(x₊) = 𝒜_{H₋}(x₋) − E − ∫∫∂_sH`, so the homotopies that preserve the filtration are those with `∂_sH ≥ 0`. 7.4's Check (`:2304–2308`) says the same.
- **Witness.** The source's Corollary 3.24 has positive-end input, `FC(H₊) → FC(H₋)` with `∂_sH ≤ 0` (`bdho-cotangent` lines 2133 and 2180–2184). For `H + ε(s)` with `ε` nondecreasing, 7.4 gives a shift of `−δ`, while 8.4's Check predicts a rise.
- **Repair.** Restate the Check in the standing convention: "`∂_sH ≥ 0` preserves the filtration; a general homotopy raises it by at most `∫ max_X(−∂_sH) ds`". Alternatively, label it as the source's convention and give the translation.

## R08 (P3) — The 10.1 Check misreads Theorem L on the ball

- **Location.** `README.md:3545–3546`: "For `W` the ball, every nonzero class of `SH^{<c}` is zero and the criterion gives nothing".
- **Claim.** On the ball the criterion applies. The Check is self-contradictory as written.
- **Witness.** Theorem 5.1 (`bdho-cotangent` lines 3843–3846) needs `j_{U!}(α) ≠ 0` and `i_{W*}(α) = 0`. Since `SH_*(D²ⁿ) = 0`, `α = [W, ∂W]` has `i_{W*}α = 0` and `j_{U!}α = [U, ∂U] ≠ 0`.
- **Repair.** "For the ball, `SH = 0` and `α = [W, ∂W]` satisfies the criterion, so every closed hypersurface in the ball has the contractible almost existence property, consistent with finite `c_HZ`. A criterion asking `i_{W*}α ≠ 0` would give nothing."

## R09 (P3) — The 9.1 Check on `ℝP²` gets the monodromy of `η₀` wrong

- **Location.** `README.md:3439–3440`: "For `Q = ℝP²`, `w = −1` on the loops reversing orientation, and `η₀` has monodromy `−1` on the loop of loops that rotates such a loop once around itself."
- **Claim.** The monodromy is `+1`.
- **Witness.** By `:3421` (and `bdho-cotangent` lines 2995–3007), `w = −1` makes `ev₀^*(o^{−1}) ⊗ ev₀^*(o^{1})` trivial, so `η₀ = σ`. The rotation's adjoint `(θ, t) ↦ γ(θ + t)` factors through `S¹`, so `w₂` evaluates to `0` and the σ-monodromy is `+1`.
- **Repair.** "… `η₀ = σ` there, and the rotation loop has monodromy `+1`, whereas `ev₀^*o^{−1}` alone (dropping `õ`) has `−1`. This shows the `õ` factor is needed."

## R10 (P3) — A 7.3 Check gives the wrong reason

- **Location.** `README.md:2279–2280`: "the two trajectories carry opposite signs, and `∂² = 0` holds over `ℤ` only with those signs."
- **Claim.** `∂² = 0` holds for every choice of signs, because the complex is `C₁ → C₀`.
- **Witness.** With signs `(+1, +1)`, `∂(max) = 2·min`, which gives homology `0` and `ℤ/2`. With `(+1, −1)` it gives `ℤ` and `ℤ`, which is `H_*(S¹)`.
- **Repair.** "… only with opposite signs is the homology `H_*(S¹)`. Equal signs give `H₁ = 0` and `H₀ = ℤ/2`."

## R11 (P3) — A 6.1 Check is not discriminating

- **Location.** `README.md:2063–2064`: "A bridge that negated the form instead of the Hamiltonian would give `−p ∂_q` for the standing convention here."
- **Claim.** The two bridges give the same field, so the Check separates nothing.
- **Witness.** `ι_X(−ω) = dH ⟺ ι_X ω = −dH`, so `X_{−ω,H} = X_{ω,−H}`. On `(ℝ², dq ∧ dp)` with `H = p²/2`, both are `−p ∂_q`.
- **Repair.** Use the wrong model that does differ: "a missing bridge (`X^{src}_{ω,H} = X_{ω,H}`) would give `p ∂_q` for the source's field", and note that the form-negating bridge coincides with the correct one.

## R12 (P3) — The 7.2 locator does not cover corner compactifications in every dimension

- **Location.** `README.md:2251–2253`: "(Salamon §§2.6, 3.1 and 3.3; Audin–Damian Chapters 6–9), with topological manifolds-with-corners compactifications in every dimension".
- **Claim.** Salamon and Audin–Damian construct compactness, transversality and gluing only for the 0- and 1-dimensional spaces the differential uses. The all-dimensional corner structure is Barraud–Cornea's.
- **Witness.** `bdho-cotangent` lines 1615–1617 cite [BC07a, Appendix A] for the compactified Floer spaces as topological manifolds with corners. Salamon §3.3 (`salamon-lectures` lines 1236–1339) glues to describe the ends of 1-dimensional spaces.
- **Repair.** Add "Barraud–Cornea, Appendix A; the source §3.3.1" as the locator for the all-dimensional corners.

## R13 (P3) — Layer 11 item 2: `π₃(K) ≠ 0` has no locator

- **Location.** `README.md:3696–3699`: "choose a root `SU(2)` subgroup … and prove that its map on `π₃` has nonzero image … hence `π₃(K) ≠ 0`".
- **Claim.** The source's Example 6.30 gets the torus criterion from the structure theorem, with no `π₃` argument. Bröcker–tom Dieck Chapter V does not compute `π₃`.
- **Witness.** `bdho-cotangent` lines 5031–5036 cite only the classification (BtD §V.8, Theorem 8.1) and conclude "aspherical iff torus".
- **Repair.**
  - Cite a source for the root `SU(2)` map on `π₃` (Bott 1956, or Mimura's survey).
  - Or replace the route: a nontrivial compact simply connected `K` is a closed manifold of positive dimension with nonzero mod-2 top homology. It is therefore not weakly contractible, hence not aspherical. This needs only the pinned fundamental class.

## R14 (P3) — Twenty items of 7.C and 7.T have no Checks

- **Location.**
  - `README.md:2504–2574`: 7.C.2b and its sub-items (0) to (vii);
  - 7.C.3 (`:2717`), 7.C.3c, 7.C.4, 7.C.5, 7.C.6, 7.C.6b, 7.C.6c, 7.C.7;
  - 7.T, 7.T.0, 7.T.3.
- **Claim.** These items construct carriers and sections and select data, so they are definitions. Each needs at least three discriminating Checks.
- **Witness.** A count of `**Checks.**` bullets per `###` item gives 0 for all twenty.
- **Repair.** Give each item three Checks (a computed value, a degenerate case, a non-example). Alternatively, merge the selection sub-items into fewer items that each carry Checks.

## R15 (P3) — Downstream consumers omits five roadmaps on main

- **Location.** `README.md:3739–3764`.
- **Claim.** Roadmaps on main that consume Layer 1 are not listed.
- **Witness.** On main:
  - `TauCetiRoadmap/MorseNovikov/README.md:161, :405` (Layer 1 item 1);
  - `TopologicalKTheory/README.md:55`;
  - `SeibergWittenTheory/README.md:22`;
  - `ReductiveGroups/README.md:2111`;
  - `SmoothBundlesConnections/README.md:1936`.
- **Repair.** List them. For MorseNovikov, which this roadmap also consumes (N1, N4), add that it can take the degree-one Hurewicz isomorphism from Tau Ceti directly, as `:3745–3747` says for AlgebraicTopology.

## R16 (P3) — A conflicting open revision of this roadmap with no stated order (previous R10, not repaired)

- **Location.** The pull request description. Its merge-order paragraph does not mention #963.
- **Claim.** #963 (@t4v1) also changes `TauCetiRoadmap/DGFloer/README.md` and `Suggested.lean`, and the two heads conflict.
- **Witness.** `roadmaps overlaps DGFloer`: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`".
- **Repair.** State which of #963 and #1798 is rebased on the other before either merges.

## Verified sound

**Gate and dependency check** (both rerun this round):

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

The depcheck output has no UPWARD, CYCLE or `moved:` line. The MorseNovikov ↔ DGFloer citations are acyclic at item level: Layer 1 item 1 consumes only Tau Ceti.

**Elaboration.** A scratch copy of `Suggested.lean` was elaborated with `lake env lean` from the worktree root. It added `#check @name` for all 4 declarations, plus the R02 and R03 probe statements.
- The only warnings are `sorry`.
- The elaborated types agree with `signatures.md`.
- No binder is lost: `[FiniteDimensional ℝ E]` and `[ConnectedSpace Q]` remain in both Theorem A statements.

**One-tactic probes.** They were run in a separate scratch file without the declarations in scope, and all fail, so there is no padding:
- the mod-2 theorem: `simp` makes no progress and `exact?` fails;
- the torus criterion: `exact?` fails;
- Theorem A: `simp [hasContractibleAlmostExistence_iff]` leaves the goal open.

**Headline theorems.**
- Stated: mod-2 vanishing (1.4), Theorem A in both cases (10.5), and the torus criterion (11.3).
- Not statable, with correct reasons: Theorems J, K, L and M, the fibration theorem, the Arnold bound, the Serre spectral sequences and the Floer–Novikov torsion.
- Theorem C is statable (R02).

**Seeded sample** (15 targets):

| Target | Locator checked | Result |
|---|---|---|
| 1.4 | Theorem 5.12 at `bdho-cotangent` line 4204; the class definition at 4197–4200; Hatcher Proposition 4.30 and Lemma 4.31 (`hatcher-at` lines 15928, 15931) | supported; the source's [Ser52] is dated 1952 (Source issues) |
| 1.6 | Palais 1960 | not verifiable; Checks computed below |
| 2.1 | no item locator | false statement (R01) |
| 2.3 | the source line 4179 (`P_{⋆→Q}𝓛₀Q = Map_*(S², Q) = Ω²Q`) | supported |
| 6.0 | book sources | not verifiable; all six Checks recomputed |
| 6.3 | magnetic Ψ at line 284; Corollary D at 265–268 | supported; Source issues |
| 7.2 | Salamon §§2.6, 3.1, 3.3 (table of contents, lines 26–31); Audin–Damian Chapters 6, 8, 9 (contents, lines 70–99) | partly supported (R12) |
| 7.3 | Lemma 3.1 (line 1464), Proposition 3.3 (line 1705) | supported; Check reason wrong (R10) |
| 7.4 | Checks recomputed | sound |
| 8.4 | Proposition 3.22 (line 2131), Corollaries 3.24 and 3.25 (lines 2180, 2185) | supported; Check convention (R07) |
| 8.7 | Propositions 3.44–3.46 (lines 2924, 2927, 2931); Theorem 3.49 (line 2956) | supported |
| 9.1 | §4.1 (`η = σ⊗µ⊗õ`, lines 2992–3017); §4.2 (lines 3055–3093) | definition matches; Check false (R09) |
| 10.1 | Theorem 5.1 (3843), Proposition 5.5 (3883), Lemma 5.7 (3907), Proposition 5.8 (3924) | supported; Check false (R08) |
| 10.4 | Proposition 5.11 (4154–4161), Proposition 5.13 (4229); Lemma 3.41 at the pin | hypothesis dropped (R05) |
| 11.2 | Example 6.30 (lines 5015–5036) | statement true; no locator (R13) |

The 7.C.2d locators also match the texts:
- Salamon Remark 4.1(ii), Definitions 4.3–4.5 and Theorems 4.8–4.10 at `salamon-lectures` lines 1606, 1780, 1822, 1831, 1943, 1946 and 1949;
- Ivashkovich–Shevchishin Definition 1.6, Theorem 1.1 and Remark 2 at `ivashkovich-shevchishin` lines 257, 299 and 314.

**Adversarial table.** `ω = dq ∧ dp`, with `ι_X ω = dH` unless stated otherwise.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| mod-2 vanishing (Lean) | a point; `M(ℤ/3, 2)`; `S³` | point: `π = 0`, squaring bijective. `M(ℤ/3, 2)`: `ℤ/3 ⊗ 𝔽₂ = Tor = 0` and doubling on `ℤ/3` is bijective. `S³`: `H₃(;𝔽₂) = 𝔽₂`, so it is excluded, and on `π₃ = ℤ` doubling is not surjective | holds |
| class `{G ⊗ ℤ/2 = 0}` | `ℤ ⊂ ℚ` | `ℚ ⊗ ℤ/2 = 0`, `ℤ ⊗ ℤ/2 = ℤ/2` | not Serre, as stated |
| `isKilledBySomePower d` | `ℤ/4` | an extension of `ℤ/2` by `ℤ/2`; killed by `2²`, not by `2` | only "some power" is closed |
| fibre placement (1.4) | `S²`, `n = 3` | `0 → ℤ → 0` cannot be exact | holds |
| `K(ℤ[1/2], 1)` colimit | `S¹ →(z²) S¹ → ⋯` | `S¹/μ_{2^∞}` with a dense subgroup is indiscrete | holds |
| 1.3 reindexing | homological `(p, q)` | `(a, b) = (1−2p−q, p−1)`, `a + b = −(p+q)`, and `d¹` goes to `(a+2, b−1)`, which is `(p−1, q)` | holds |
| 1.2 sequences | double cover; Hopf | the kernel of `∂` is `2ℤ`; `∂ : π₂S² ≅ ℤ`; `E²` for the swap action gives `ℤ, ℤ` | holds |
| 1.6 | `S¹`; two points; `S¹ ⊔ S²` | rotation section; `Diff = S₂`, `H = 1`; `O` is one component | holds |
| 2.1 (R01) | `B × S¹` | fibre over the duration-0 loop is a point; over duration 1 it is `≃ ℤ` | false |
| 2.3 | `S²`, `Tⁿ`, `S³`, `S¹` | `π₀Ω²S² = ℤ`; `π_jΩ²Tⁿ = 0`; `H₁Ω²S³ = ℤ`; `Ω²S¹ ≃ pt` | holds |
| 6.0 | `c₀`; `ℝ²`; rotation | `ι_{(0,−a)}ω = a = df` while the pinned field is `0`. `X_{qp} = q∂_q − p∂_p`, `ι = d(qp)`, `{q, p} = 1`. `R′ = AR` with `A = [[0,1],[−1,0]]`. `Φ = (q, p − (t²−s²)/2)` | holds |
| 6.1 bridge (R11) | `H = p²/2` | `X_{−ω,H} = X_{ω,−H} = −p∂_q` | not discriminating |
| 6.3 | `Ψ′_σ = τ_{−σ}` | `Ψ′^*ω = ω + π^*dσ`; `νΨ_σν⁻¹(q, p) = (q, p − σ)`; pinned `τ_α^*ω = ω − π^*dα` (`Fiberwise.lean:114`) | holds |
| 7.1 | `ε(q² + p²)/2`, `n = 1` | `CZ = −sign(S)/2 = +1 = n − ind` | holds |
| 7.3 Check (R10) | `S¹` height function | `(+,+)`: `0, ℤ/2`; `(+,−)`: `ℤ, ℤ` | reason wrong |
| 7.4 | `T²` height function; `H + ε(s)` | CZ values `−1, 0, 0, 1` give `FH = H_{*+1}`, ranks `1, 2, 1`; the shift is `−δ` | holds |
| 8.4 Check (R07) | `H + ε(s)` | standing: shift `−δ`; Check: a rise | conflict |
| 7.C.2 | `S_mat = diag(1, −1)` | `C_J = [[0,−2],[−2,0]]`, `z = (1,−1)`, `LJz = (−4,−4)` | holds |
| 7.C.2c | `J_ε` on `ℝ⁴` | `ω(J_εe₃, J_εe₄) = 1 − 4ε²` | holds |
| 7.C.2d | `z + ε/z`; constant class | the limit is `z` with bubble `1/w`, `2L` conserved; `c ≤ k−2+2a`, edges `≤ k−3+3a`, `M̄₀,₄ ≅ ℂP¹` | holds (R04 is ownership) |
| 7.T.5 | one simple flow | `Σ e^{mA}/m = −log(1−e^A)`, so `ζ = (1−e^A)⁻¹` | holds |
| 8.7 | `D²ⁿ` | `E² = SH(D²ⁿ; H_q) = 0` | holds |
| 9.1 Check (R09) | `ℝP²` rotation | `Γ_*[T²] = 0`; on `w = −1`, `η₀ = σ`; monodromy `+1` | Check false |
| 9.4 | `ℝP²` | `H₂(ℝP²; o) = ℤ`, while `H₂(ℝP²; ℤ) = 0` | holds |
| 10.1 Check (R08) | `D²ⁿ` | `i_{W*}[W, ∂W] = 0`; `j_{U!}[W, ∂W] = [U, ∂U]` | criterion applies |
| 10.4 | two points; `S²`; `S³` | not path-connected; `π₀Ω²S² = ℤ`; `H₁Ω²S³ = ℤ` | R05 |
| Theorem A, case 1 | `S²` zero section; `T²`; `T² ⊔ T²`; point; `S = ∅` | `d = 1` holds (worked example 8). `T²` is aspherical. `T² ⊔ T²` is excluded by connectedness. The point is aspherical. `S = ∅` gives `0 = d[Q]`, impossible for a unit | holds; R03 on `S` |
| Theorem A, case 2 | `S²`, `d = 2`; `T²` | `π₂ = ℤ` is not torsion; for `T²` every `π_{≥2} = 0` is torsion, so it is excluded | holds |
| Theorem C (R02 probe) | `ℝP²`; `S = Q ⊔ Q` | `H₂(;𝔽₂)` map `= id ≠ 0`; the doubled `S` has `deg₂ = 0` but a nonzero map, and one component gives the conclusion | statable |
| torus criterion | `T^r`; `SO(3)`; trivial group; `ℕ → S¹` | both sides true for `T^r`; for `SO(3)`, `π₃ = ℤ` and both sides false; trivial group has `r = 0`; `(ℤ/2)^ℕ` is uncountable, so `ℕ → S¹` is excluded by the Lie instance | holds |
| 11.1 | `U(n)`; `SO(3)` | kernel `{(ζ, ζ⁻¹I)}` of order `n`; `SU(2) → SO(3)` | holds |

**Pinned declarations opened** (Tau Ceti 2fd255d):
- `Geometry/Symplectic/Hamiltonian/AlmostExistence.lean:96, :167, :186`;
- `Geometry/Manifold/RegularValue.lean:92`;
- `AlgebraicTopology/EilenbergMacLane/Basic.lean:59`;
- `AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75`;
- `AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204, :275`;
- `AlgebraicTopology/Homotopy/Hurewicz/TwoDivisible.lean:43`;
- `AlgebraicTopology/Homotopy/Hurewicz/One/Comparison.lean:160` (the sign of 1.1);
- `AlgebraicTopology/Homotopy/LoopSpace/Aspherical.lean:229`;
- `AlgebraicTopology/Homotopy/DegreeRaising.lean:71`;
- `AlgebraicTopology/Singular/Fibration/LocalSystem.lean:102`;
- `Geometry/Diffeomorphism/Diffeotopy/Homogeneity.lean:253`;
- `Geometry/Symplectic/Cotangent/Bundle/Fiberwise.lean:114`;
- `Topology/Homotopy/HomotopyGroup/IteratedLoopSpace/Basic.lean:44`;
- `Topology/PathSpace/Moore/Comparison/FundamentalGroup.lean:69`;
- `Topology/PathSpace/Moore.lean:753, :774`;
- `Topology/Homotopy/HurewiczFibration/Basic.lean:114`.

That is 21 declarations. `roadmaps resolve` finds no unresolved name.

**Cross-roadmap citations resolved.**
- On main:
  - HeegaardFloer F2.1: the contraction inverse (`README.md:2453`) and the Moser lemma (`:2468`);
  - PseudoholomorphicCurveAnalysis PH1–PH7 (`:211–1221`);
  - SymplecticGeometry S0 and its sub-roadmaps HamiltonianReduction and CotangentLagrangian;
  - MorseTheory M4 (`:481`);
  - MorseNovikov N1 and N4;
  - RepresentationTheory/LieGroups Layers 5 and 6 (`:358`, `:383`), and CompactGroups;
  - Completed/UniversalCovers;
  - DGAInfinity and TaubesGromov.
- At open heads:
  - AnalyticStableMaps (#987) `:609`, `:647`, `:1128`;
  - HamiltonianSystems (#480) Layers 1–2;
  - DGFloerPartII (#1799) `:358`, `:399`, `:785`, `:829`.

**Ownership.** The following were searched by object at the pins, on main and at the open heads with `roadmaps grep` and `show`: stable-map compactness, the Hamiltonian formalism, the torus criterion and mod-2 vanishing. The only overlaps found are R04 and the HamiltonianSystems point under the previous findings.

## Not verifiable

These are books or paywalled texts, cited by locator; none was read:
- Palais 1960 (1.6);
- Serre 1953, Théorème 1 (1.4);
- Weibel 5.5.1 and 5.5.10;
- Whitehead Chapter I;
- Massey Chapters II and VII;
- McDuff–Salamon §3.1, Abraham–Marsden Chapter 3, Chernoff–Marsden LNM 425 and Hartman Chapter V, Theorem 3.1 (6.0);
- Hofer–Zehnder Chapters 1, 3 and 4, and Struwe 1990 (6.5);
- Bröcker–tom Dieck Chapter V (11);
- Floer–Hofer–Salamon Lemma 6.5;
- Piunikhin–Salamon–Schwarz §4;
- Hofer–Salamon §4.

The constructions of 7.C, 7.G and 7.T were read for their Checks, not proof by proof.

## Source issues

- **Misprint** in bdho-cotangent at Corollary D, printed p. 7 (lines 265–268): the source says `Q` is closed orientable and that Theorems A, B and C hold; Theorem C concerns non-orientable `Q`; it should read "`Q` closed, orientable for Theorems A and B"; affects a stated result.
- **Misprint** in bdho-cotangent at the bibliography entry [Ser52], printed p. 133 (lines 5795–5796): the source dates Serre's paper in Ann. of Math. 58 to 1952; that volume appeared in 1953; affects nothing.
