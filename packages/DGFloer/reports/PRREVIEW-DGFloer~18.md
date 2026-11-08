# Review of DGFloer (pull request #1798 at f28741c)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at f28741c. The folder changed by 1408 lines since 95dc935, the head the previous review read. Nothing outside the folder changes.

The gate fails on one style rule (R02), so this head cannot be accepted. There are eight findings, one of them blocking:

- **R01 (P2).** The general forms that README 10.5 names as its targets are statable at the pins but absent from `Suggested.lean`.
- **R02–R08 (P3).** The gate's dropped name; the return of the Layer 6 API catalogue to `Suggested.lean`; a false Check in 10.3; Layer 11 citing a LieGroups section that only an open revision defines; the unstated interfaces of 1.5; a 9.2 locator; the unstated order with #963.

## Previous findings (review at 95dc935)

- **R01, the unrestricted Moore loop map is not a fibration: repaired.** `README.md:1428–1442` now restricts to positive durations ("rescaling … is a homeomorphism `Ω^{>0}_x X ≅ (0, ∞) × Ω^{[0,1]}_x X`"). `:1444–1449` says the unrestricted map "is in general neither a Hurewicz nor a Serre fibration". `:1460–1465` adds the `B × S¹` negative control.
- **R02, Theorem C statable: repaired.** It is `Suggested.lean:569`, and the "not statable" bullet is gone. R01 below asks for its general form.
- **R03, smooth `S`: repaired.** `[IsManifold 𝓘(ℝ, E) ∞ S]` is at `Suggested.lean:520`, `:544` and `:572`. `README.md:3914–3916` says "`S` is a closed **smooth** manifold".
- **R04, two owners of genus-zero stable-map compactness: repaired.** 7.C.2d no longer constructs stable maps ("This roadmap does not construct stable maps or their topology", `:2827–2828`). It consumes gap:genus-zero-stable-map-compactness from AnalyticStableMaps (`:810–839`). The sections it cites exist at the #987 head (41557ba): §3.2 at `:581`, §3.3 at `:597`, §3.4 at `:609`, §3.7 at `:645` and §11.1 at `:998`.
- **R05, Proposition 5.11 without the hypothesis of its second part: repaired.** `:3872–3877` gives the three cases with their hypotheses ("If `k > 2` (so `π₂(Q) = 0`), `d ≥ 2` …, and some `π_ℓ(Q)` with `ℓ > 2` is annihilated by no power `d^m`").
- **R06, the 5.6 ↔ 9.3 cycle: repaired.** 5.6's *Needs:* (`:1859–1861`) no longer cites 9.3. The compact-family approximation lemma sits in 5.6 (`:1881–1896`), and 9.3 consumes it (`:3761–3767`).
- **R07, the direction in the 8.4 Check: repaired.** `:3624–3632` states the standing direction: "a monotone homotopy with `∂_s H ≥ 0` preserves the action filtration".
- **R08, the 10.1 ball Check: repaired** (`:3821–3825`).
- **R09, the `ℝP²` monodromy in 9.1: repaired** (`:3722–3727`: "`η₀` has monodromy `+1`").
- **R10, the reason in the 7.3 Check: repaired** (`:2456–2458`: "it is the homology, not `∂² = 0`, that the signs decide").
- **R11, the 6.1 bridge Check: repaired** (`:2233–2236`).
- **R12, the 7.2 locator: repaired.** `:2426–2428` cites Barraud–Cornea Appendix A through `bdho-cotangent` lines 1615–1617, which say this.
- **R13, `π₃(K) ≠ 0` without a locator: repaired.** 11.2 (`:4019–4039`) cites Bott §1 at `bott-lie-groups` lines 92–93, which state that `π₃` of a compact simply connected Lie group is free, and `ℤ` for a simple one. It adds a Cartan 3-form route. That route's citation of LieGroups is R05 below.
- **R14, items without Checks: repaired in substance.** The 7.C.2b block carries four shared Checks, for its steps (i), (ii), (iv) and (v) (`:2754–2779`). Every other item the finding listed now has three. 7.C.7 and 7.T.0 have none, but they are interface and supplier items, not definitions.
- **R15, Downstream consumers: repaired.** TopologicalKTheory, SeibergWittenTheory, ReductiveGroups and MorseNovikov are listed (`:4109–4117`). The previous review's SmoothBundlesConnections entry was a misreading: `SmoothBundlesConnections/README.md:1936` on main describes DGFloer as *consuming* B1.4, not the reverse.
- **R16, order with #963: not repaired** (R08 below).

## R01 (P2) — Theorems 5.10 and 5.15, the stated targets of 10.5, are statable but `Suggested.lean` states only their corollaries A and C

- **Location.** `README.md:3912–3913`: "Prove **Theorems A and C** in their general forms (Theorems 5.10 and 5.15)". `Suggested.lean:518`, `:541` and `:569` state only Theorem A (two cases) and Theorem C.
- **Claim.** The Lean statements are narrower than the README's target, although the general forms are statable at the pins.
  - Theorem 5.10 has `d ≠ 0` together with one of three hypotheses: `π₂(Q) ≠ 0`; or the first nonzero `π_k`, `k ≥ 3`, has an element not killed by `d`; or some `π_ℓ`, `ℓ ≥ 3`, is killed by no `d^m`. Theorem A needs `d = ±1`, or a non-torsion `π_ℓ`.
  - Theorem 5.15 accepts `π₂(Q) ≠ 0` with `π₂ ⊗ ℤ/2 = 0` (say `π₂ = ℤ/3`). The Lean Theorem C excludes this case unless some higher `π_ℓ ⊗ ℤ/2 ≠ 0`.
- **Witness.** `bdho-cotangent` lines 4140–4147 (Theorem 5.10) and 4293–4296 (Theorem 5.15). The source derives A and C from them (lines 4260–4264 and 4330). Both general forms elaborated in a scratch copy with `lake env lean`; the only warnings were `sorry`.
- **Repair.** Keep A and C. Add the two general forms to `Suggested.lean` and name them in 10.5. The tested binders are below; the remaining binders are exactly those of the existing statements.

```lean
-- Theorem 5.10: as `hasContractibleAlmostExistence_of_not_isTorsion_homotopyGroup`, with `hQ` replaced by
    (hd₀ : d ≠ 0)
    (hQ : Nontrivial (π_ 2 Q q) ∨
      (∃ k : ℕ, (∀ j < k, Subsingleton (π_ (j + 3) Q q)) ∧ ∃ a : π_ (k + 3) Q q, a ^ d ≠ 1) ∨
      ∃ ℓ : ℕ, ∀ m : ℕ, 1 ≤ m → ∃ a : π_ (ℓ + 3) Q q, a ^ (d ^ m) ≠ 1)
-- Theorem 5.15: as `hasContractibleAlmostExistence_of_mod_two_degree_ne_zero`, with `hQ` replaced by
    (hQ : Nontrivial (π_ 2 Q q) ∨ ∃ n : ℕ, ¬ Function.Surjective (fun a : π_ (n + 3) Q q ↦ a ^ 2))
```

## R02 (P3) — Gate: a name from the dropped-names list

- **Location.** `README.md:4104`: "**HomotopySpheres** consumes Layer 1 item 4's Hurewicz modulo a Serre class".
- **Claim.** The gate fails on rule `dropped`: no name from the project's dropped-names list may appear.
- **Witness.** The gate rerun on f28741c reports `dropped=1 … FAIL`, with `dropped: line 4104`. Every other check is 0.
- **Repair.** Delete the HomotopySpheres clause from that consumer bullet and keep the StableHomotopyKTheory and StringOrientation entries. Rerun the gate.

## R03 (P3) — `Suggested.lean`'s Layer 6 section is an API catalogue again

- **Location.** `Suggested.lean:102–496`: 40 theorems and 3 definitions on Hamiltonian vector fields, brackets, symplectic maps and linearized flows. The docstring bullet at `:24–35` presents them as headline material.
- **Claim.** None of these is a headline theorem of this roadmap; they are the API of Layer 6 item 0. Four of them close in one tactic or term from the pinned libraries. The review at 72a3f12 raised the same catalogue as its R07, and 03807f2 reduced the file to four declarations. This head adds it back.
- **Witness.** In a scratch copy, elaborated with `lake env lean`:
  - `isSymplecticMap_id` closes by `simp [IsSymplecticMap, mfderiv_id]`;
  - `isSymplecticMap_subtype_val` closes by `fun x v w ↦ (SmoothForm.eval₂_mpullback _ _ _ x v w).symm`;
  - `hamiltonianVectorField_congr_of_eventuallyEq` closes by `simp only [hamiltonianVectorField_def, h.mvfderiv_eq]`;
  - `hamiltonianVectorField_mul` closes by `simp [hamiltonianVectorField_def, mvfderiv_mul hf hg]`.
- **Repair.**
  - Delete the Layer 6 section (`:102–496`) and its docstring bullet from `Suggested.lean`; the README keeps every statement.
  - In README 6.0 (`:1936–2209`), drop the backticks from the roadmap's own Lean names so the statements stay as prose.
  - Remove the imports used only by that section (`Flow.Basic`, `Flow.TimeDependent`, `Hamiltonian.Integrable`, `SymplecticTransport`), then rebuild.

## R04 (P3) — 10.3 states none of Proposition 5.9's hypotheses, and one of its Checks adds a hypothesis the source does not have

- **Location.** `README.md:3855`: "Prove the cotangent criterion (Proposition 5.9)." The Check at `:3861–3862`: "The criterion is stated for a bounded open `U` containing the zero section; for `U` not containing the zero section the transfer map is not available and the criterion is silent."
- **Claim.** Proposition 5.9 needs only:
  - `Q` smooth, closed and orientable;
  - `Σ = ∂U` for a relatively compact open `U ⊂ T*Q`;
  - `ker i_{Q*} ⊄ ker π_{U!}` for some `𝓕`.

  `j_{U!}` is the codimension-zero shriek of `U ⊂ W`, which exists for every such `U`. So the Check is false.
- **Witness.** `bdho-cotangent` lines 4107–4117 (Proposition 5.9) and 3843–3846 (Theorem 5.1, `U ⊂ W` arbitrary). Counterexample to the Check: take `Q = S³`, `φ = λα` for a nowhere-zero one-form `α`, and a tube `U` around `φ(S³)` that misses the zero section. Theorem 5.10 then applies with `d = 1`, since `π₃ = ℤ`.
- **Repair.**
  - State Proposition 5.9 in 10.3 with the three hypotheses above.
  - Replace the Check with this `S³` example: the criterion applies to a `U` that misses the zero section.

## R05 (P3) — Layer 11 cites a LieGroups section that only the open revision #1051 defines

- **Location.** `README.md:4026`: "negative definite since `K` is compact semisimple (LieGroups Layer 5A)". Also `:4000–4002` (the centre and derived-ideal splitting) and `:4029` (root homomorphisms).
- **Claim.** On main, LieGroups has no Layer 5A. Its Layer 5 covers universal covers and the enveloping algebra, and its Layer 6 maximal tori and the Weyl group; neither gives the splitting, the negative-definite Killing form or the rank-one subalgebras. Those are added only by the revision #1051, and neither the description nor its merge-order paragraph names it.
- **Witness.** On main, `RepresentationTheory/LieGroups/README.md:358` and `:383` are the Layer 5 and 6 headings, and there is no "5A". At #1051 (6bf626d), `README.md:641` reads "### Layer 5A: compact Lie-algebra metric and splitting" and `:751` reads "Rank-one representatives".
- **Repair.** Either:
  - name #1051 in the pull request's merge-order paragraph and cite "LieGroups Layer 5A and Layer 6 (rank-one representatives)" as at that head; or
  - cite LieGroups as on main and own the splitting `𝔤 = 𝔷 ⊕ [𝔤, 𝔤]`, the negative-definiteness of the Killing form and the root `SU(2)` homomorphisms in 11.1–11.2, each with a locator.

## R06 (P3) — 1.5 promises two interfaces without stating them, and has no locator

- **Location.** `README.md:1354–1357`: "Own the independence of the collapse from the tube …, its effect on fundamental classes, and its compatibility with shriek maps."
- **Claim.** Neither the effect on fundamental classes nor the compatibility with shriek maps is stated, and 1.5 cites no text. DGFloerPartII 1.5 (#1799, `:741–743`) consumes "the effect on fundamental classes" from this item.
- **Witness.** Take `N = S¹ × {pt} ⊂ T²`, `k = 1`. The collapse `c : T² → S¹` has `c_*[T²] ∈ H₂(S¹) = 0`, so a homological reading says nothing. Read in cohomology, `c^*u₁ = PD[N]` is nonzero in `H¹(T²) = ℤ²`.
- **Repair.**
  - State, for `M` and `N` oriented compatibly with the framing, that `c^*u_k = PD_M[N]`, where `u_k ∈ H^k(S^k; ℤ)` is the orientation class.
  - State that `i_!` is the collapse onto `Th(ν) = N₊ ∧ S^k` followed by the Thom isomorphism of the framing.
  - Give a textbook locator for both, and add the `T²` computation as a Check.

## R07 (P3) — The 9.2 locator does not contain the statement with local coefficients

- **Location.** `README.md:3733–3735`: "For every classical local system `L` … `SH_*(T*Q; Π^*L) ≅ H_*(𝓛Q; L ⊗ η₀)` … (Abbondandolo–Schwarz Theorem 3.1 and its corrigendum, as organized in Abouzaid Chapters 5–6)".
- **Claim.** Abbondandolo–Schwarz Theorem 3.1 is untwisted: it gives a chain isomorphism between the Morse complex of the energy functional and the Floer complex of a Legendre-transform Hamiltonian. The statement with local coefficients is the source's, which attributes it to Abouzaid's proof.
- **Witness.** `abbondandolo-schwarz` lines 1771–1777 (untwisted, conditions (H0)–(H2) and (L0)–(L2)); `bdho-cotangent` lines 671–681 ("Abouzaid's proof … implies a Viterbo isomorphism with arbitrary (classical) local coefficients").
- **Repair.** Cite "the source §1.5, Theorem (Viterbo isomorphism with local coefficients), `bdho-cotangent` lines 679–681, after Abouzaid Chapters 5–6" for the statement. Keep Abbondandolo–Schwarz Theorem 3.1 for the untwisted case and for the hybrid moduli method.

## R08 (P3) — A conflicting open revision of this roadmap with no stated order (previous R16, not repaired)

- **Location.** The pull request description. Its merge-order paragraph does not mention #963.
- **Claim.** #963 (@t4v1, 62109eb) also changes `TauCetiRoadmap/DGFloer/README.md` and `Suggested.lean`, and the two heads conflict. Both state mod-2 vanishing, for instance (#963 `Suggested.lean:49`).
- **Witness.** `roadmaps overlaps DGFloer` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`". `roadmaps list` shows #963 open.
- **Repair.** State in the description which of #963 and #1798 is rebased on the other before either merges.

## Verified sound

**Gate and dependency check** (both rerun on f28741c):

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=1 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

The dependency check prints no UPWARD, CYCLE or `moved:` line. The worker's gate record has `build=0`.

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 47 declarations was elaborated with `lake env lean` from the worktree root.
- There are 44 `sorry` warnings (the 3 definitions have real bodies), no errors and no other warnings.
- Each elaborated type was compared with its README statement:
  - the Layer 6 binders match the 6.0 bullets (`[CompleteSpace E]` exactly where the README says "Banach", `[FiniteDimensional ℝ E] [I₀.Boundaryless] [T2Space M]` for the linearized flows, `n ≠ 0` for symplectomorphisms);
  - Theorems A and C keep `[ConnectedSpace Q]` and both `IsManifold` instances;
  - no section binder is lost, and nothing changed.

**One-tactic probes.** Besides the four in R03, these fail to close in one tactic, so they are not padding:
- `IsHamiltonianVectorField.add`, `.mul` and `.const_smul` (`simp_all` through `isHamiltonianVectorField_iff` leaves goals);
- `isSymplectomorphism_constSmooth` (`simp_all` leaves goals);
- `poissonBracket_mul_left` from the `mul` rule (`simp` leaves goals);
- mod-2 vanishing, Theorems A and C and the torus criterion: the previous round's probes are unchanged.

**Headline theorems.**
- Listed in the README: the fibration theorem (5.4), Theorem J and the DG Floer comparison (8.6), Theorem K (9.3), Theorems L and M (10.1–10.2), Theorems A and C and their general forms (10.5), mod-2 vanishing (1.4) and the torus criterion (11.3).
- Stated: mod-2 vanishing, Theorem A (two cases), Theorem C and the torus criterion.
- Not statable, with correct reasons in the docstring: J, K, L, M, the fibration theorem, the Arnold bound (grep finds no first Chern class at the pinned Tau Ceti), the Serre spectral sequences and Floer–Novikov torsion.
- Statable and absent: R01.

**Seeded sample** (15 targets):

| Target | Locator read | Result |
|---|---|---|
| 1.1 | Hatcher Theorem 2A.1, p. 175 (`hatcher-at` lines 7230–7233): loops as singular 1-cycles; for path-connected `X`, an isomorphism from `π₁ᵃᵇ` onto `H₁` | supported |
| 1.5 | no locator | R06 |
| 2.1 | no locator; the proof is complete through the pinned `MooreLoopSpace.map` (`Moore.lean:774`), `IsHurewiczFibration.loopMap` (`LoopSpaceFibration.lean:54`), `comp_homeomorph` (`HurewiczFibration/Basic.lean:107`) and `isHurewiczFibration_fst` (`:114`) | sound |
| 2.2 | Hatcher, remark after Proposition 4.48, p. 388 (lines 16463–16466: Huebsch–Hurewicz over paracompact bases); BDHO §7.1 (`bdho-morse-dg` lines 3053–3056 cite [DK69, Proposition 5.5] for the replacement) | supported; Whitehead Chapter I not verifiable |
| 5.1 | BDHO Theorem 5.2.1 (line 1461), Proposition 5.2.6 with (5.12) (lines 1638–1650), Proposition 5.2.8 (line 1699) | supported; the sign `(−1)^{|x|−|z|}` matches the Check |
| 5.4 | BDHO Theorem 7.2.1 (lines 3101–3111): Hurewicz fibration, iso of the index and Leray–Serre spectral sequences, `H_*(X; F) ≅ H_*(E)` | supported |
| 6.2 | Seidel §(2a), equations (2.2)–(2.3) (`seidel-biased` lines 74–97): collar `e^r α`, cone `[0, ∞) × ∂M` | supported; README's radial coordinate is `e^r` |
| 7.3 | Lemma 3.1 (`bdho-cotangent` line 1464), Proposition 3.3 (line 1705) | supported |
| 7.5 | Abouzaid §§1.5–1.6 (table of contents, lines 17–18); Seidel §3 (line 192) | supported |
| 8.2 | Definition 3.7, Propositions 3.8 and 3.9 (lines 1790–1810) | supported; the twisting sign matches Tau Ceti's `TwistingCocycle` (README `:494`) |
| 9.1 | §4.1, `η = σ ⊗ µ ⊗ õ` (lines 2992–3007) | supported |
| 9.2 | Abbondandolo–Schwarz Theorem 3.1 (line 1771) | untwisted only (R07) |
| 9.4 | Proposition 4.1 (lines 3026–3045), `i_Q^*η ≃ |Q|` (line 3025), Corollary 4.17 (line 3772) | supported |
| 10.3 | Proposition 5.9 (lines 4107–4117) | hypotheses missing, false Check (R04) |
| 11.1 | Example 6.30 (lines 5031–5036, citing [BtD95, §V.8, Theorem 8.1]) | supported; Bröcker–tom Dieck not verifiable |

Also read:
- BDHO Proposition 10.6.1 (`bdho-morse-dg` lines 7091–7094; 5.3 and 10.4);
- Proposition 5.11 (lines 4154–4161), Proposition 5.13 (lines 4229–4242) and the proof of Theorem 5.10 (lines 4246–4258), against 10.4;
- Theorem 5.1 (lines 3843–3846), against the 10.1 Check;
- Abouzaid Proposition 3.2.4, Lemma 3.2.6, Exercise 3.2.7 and Definition 3.2.8 (lines 2902, 2946, 2949, 2952), against 5.6;
- Bott §1 (lines 92–93), against 11.2.

**Adversarial table.** `ω = dq ∧ dp` with `ι_X ω = dH` unless stated otherwise.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 | `S¹`; `S¹ ⊔ pt`; `S¹ ∨ S¹` | `π₁ = ℤ = H₁`. For `S¹ ⊔ pt`, `H₁ = ℤ` but `π₁(pt) = 0`. `[a, b] ↦ 0` in `ℤ²` | holds; path-connectedness needed |
| 1.4 mod-2 vanishing (Lean) | point; `M(ℤ/3, 2)`; `S³` | point: trivial. `M(ℤ/3, 2)`: `π₂ = ℤ/3`, doubling bijective. `S³`: `H₃(;𝔽₂) ≠ 0`, excluded | holds |
| 1.5 | framed point in `Sⁿ`; `∅`; two points in `S¹`; `S¹ × pt ⊂ T²` | degree `±1`; constant; degree 2 or 0. `c_*[T²] = 0` while `c^*u₁ = PD[N] ≠ 0` | Checks hold; interface unstated (R06) |
| 2.1 | `B × S¹`; `X = pt` | fibre over duration 0 is a point; over duration 1 it has `π₀ = ℤ`. `Ω^{>0}(pt) ≅ (0, ∞)` | holds as restricted |
| 2.2 | double cover | transport swaps the fibre: `ℤ²` permutation module | holds |
| 5.1 | index difference 2 | `(−1)^{1} = −1` | holds |
| 5.3 | double cover of `S¹`; collapse `T² → S²` | `f_*f_! = 2` in degrees 0 and 1; `f_! f_*` kills `H₁(T²)` | holds |
| 5.4 | path-loop fibration over `Sⁿ`; double cover | `H_*(pt)`, against `H_*(Sⁿ) ⊗ H_*(ΩSⁿ)` for the trivial action; `H_*(S¹; ℤ[ℤ/2]) = ℤ, ℤ` | holds |
| 6.0 Leibniz and bracket | `(ℝ², dq ∧ dp)` | `X_q = −∂_p`, `X_p = ∂_q`, `X_{qp} = q∂_q − p∂_p` with `ι = d(qp)`; `{q, p} = dq(X_p) = 1` | holds |
| 6.0 `isHamiltonian_eval₂` sign | `f = q²/2`, `g = p` | `X_f = −q∂_p`, `ω(X_f, X_g) = q`, `[X_f, X_g] = ∂_p`, so `−[X_f, X_g] = X_q` | holds |
| 6.0 Jacobi without nondegeneracy | `dω = 0` | pinned `mlieBracket` (`Bracket.lean:115`) turns `dω(X, Y, Z) = 0` into `−2Σ_cyc ω([X, Y], Z) = 0` | holds |
| 6.0 uniqueness and zeros | `ω = 0` on `ℝ²` | every field is Hamiltonian for constant `f`; `∂_q ≠ 0` with `df = 0` | weak nondegeneracy needed |
| 6.0 preconnected times | `H = p` on `(0, 1) ∪ (2, 3)` | values 0 and 5 | preconnected `T` needed |
| 6.0 transport | `ℝ² ↪ ℝ⁴`, `h = q₂` | `X_{h∘φ} = 0`, `X_h = −∂_{p₂}` | invertible `dφ` needed |
| 6.0 symplectic flows | `X = q∂_q`; `H_t = tq` | the flow pulls `ω` back to `e^t ω`. `X_{H_t} = −t∂_p` and `Φ_{s,t} = (q, p − (t² − s²)/2)` preserves `ω` | holds |
| 6.0 variational equation | `H = (q² + p²)/2` | `R′ = AR`, `A = [[0, 1], [−1, 0]]` | holds |
| 6.2 | `D²ⁿ`, `λ = ½Σ(p dq − q dp)` | `dλ = Σ dp ∧ dq`, `ι_Z dλ = λ` for `Z = ½(q∂_q + p∂_p)`; a closed manifold has `∫ωⁿ = 0` | holds |
| 7.1 | `εH`, `H = (q² + p²)/2`, `n = 1` | `X = ε(p∂_q − q∂_p)`, `CZ = −sign(−εI)/2 = +1 = n − ind` | holds |
| 7.3 | `S¹` height function | signs `(+, −)`: `ℤ, ℤ`; `(+, +)`: `0, ℤ/2` | holds |
| 7.4, 8.4 | `H + ε(s)`, `ε: 0 → δ` | the shift is `−δ`; the bound `∫ max(−∂_sH) = 0` | consistent |
| 7.C.2b checks | `R_K` for `K = H dt`; `J₀` on `ℝ⁴` | the stationary cylinder gives `δ − δ = 0` (with `−∂_sH`, `2δ`); tame dimension `2n² = 8`, compatible `n(n+1) = 6`; the block `diag(1, −1)` anticommutes with `J₀` | holds |
| 7.T | `(S²)⁴`, areas `1, 3, 1, 1` | `c₁ = 2`, `ω = −1` | holds |
| 9.1 | `ℝP²` rotation; shift `n = p = 1` | `η₀ = σ` on `w = −1`, monodromy `+1`; Koszul factor `−1` | holds |
| 9.2 | `S¹`; `pt` | `ℤ[ℤ]` in degrees 0 and 1; `ℤ` | holds; locator R07 |
| 9.4 | `ℝP²` | `H₂(ℝP²; o) = ℤ`, `H₂(ℝP²; ℤ) = 0` | holds |
| 10.1 | `D²ⁿ` | `i_{W*}[W, ∂W] = 0`, `j_{U!}[W, ∂W] = [U, ∂U]` | holds |
| 10.3 | `S³`, tube missing the zero section | Theorem 5.10 with `d = 1` (`π₃ = ℤ`) applies the criterion | Check false (R04) |
| 10.4 | two points; `S²`; `S³`, `d = 2`; `ℤ/4` | not path-connected; `H₀(Ω²S²)` of rank `ℵ₀`; `H₁(Ω²S³) = ℤ` not 2-torsion; `ℤ/4` killed by `2²` | holds |
| Theorem A (Lean) | `S²` zero section; `T²`; `T² ⊔ T²`; point | `d = 1` works; `T²` is aspherical; `T² ⊔ T²` is excluded by `ConnectedSpace`; the point is aspherical | holds |
| Theorem C (Lean) | `ℝP²`; Klein bottle; `ℝP² ⊔ ℝP²`; `ℝP⁴` | `H₂(;ℤ/2)` map is `id`, and `π₂ = ℤ` doubling is not onto. The Klein bottle has `π_{≥2} = 0`, so it is excluded. For `ℝP² ⊔ ℝP²`, `(a, b) ↦ a + b ≠ 0`. `π₄(ℝP⁴) = ℤ` and `H₃(ΩS⁴; 𝔽₂) ≠ 0` | holds |
| Theorems 5.10/5.15 (probe) | binders of R01 | both elaborate; 5.15 accepts `π₂ = ℤ/3`, which C excludes | statable (R01) |
| 11.1 | `U(n)`; `SO(3)`; `T^r` | kernel `μ_n`; `r = 0` with `SU(2)`; the identity | holds |
| 11.2 | root `f : SU(2) → K`; torus | `f^*ω(e₁, e₂, e₃) = B(df e₁, df e₁) < 0`; the Killing form is 0 on a torus | holds; citation R05 |
| torus criterion (Lean) | `T^r`; `SO(3)`; `ℕ → S¹` | both sides true; both false (`π₃ = ℤ`); `(ℤ/2)^ℕ` is uncountable, so it is excluded by the Lie instance | holds |
| 7.C.2d | `z + ε/z`; constant class; `T⁴`, irrational periods | class `2[S²]` and energy `2L` conserved; `M̄_(0,4) ≅ ℂP¹` meets both bounds; only `A = 0` carries maps | holds |

**Pinned declarations opened** (Tau Ceti 2fd255d, 23 in all):
- `Hamiltonian/Manifold.lean:124` (`IsHamiltonianVectorField`), `:179` (`hamiltonianVectorField = (σ.flat x).inverse (mvfderiv …)`), `:195`, `:440` and `:468–519`;
- `Hamiltonian/Bracket.lean:73` and `:115`;
- `Manifold/TwoForm.lean:76` (`IsNondegenerate`);
- `Manifold/Flat.lean:77`;
- `DifferentialForm/Pullback/Smooth.lean:249`;
- `PathSpace/Moore.lean:774`;
- `HurewiczFibration/Basic.lean:107` and `:114`;
- `LoopSpaceFibration.lean:54`;
- `LoopSpace/Aspherical.lean:229`;
- `LocalHomology/FundamentalClass.lean:275`;
- `Hamiltonian/AlmostExistence.lean:167`;
- `Hurewicz/TwoDivisible.lean:43`;
- `EilenbergMacLane/Basic.lean:59`.

From Mathlib: `mvfderiv_add` and `mvfderiv_mul` (`MFDeriv/NormedSpace.lean:684` and `:740`).

**Cross-roadmap citations resolved.**
- On main (3b3f7ef):
  - HeegaardFloer F2.1's contraction inverse (`:2453`) and Moser lemma (`:2468`);
  - DifferentialGeometry 5.3 Stokes and 5.4 homotopy operator (`:518`, `:524`);
  - SmoothBundlesConnections B6.0 (`:1306`);
  - LieGroups Layers 5–6 (`:358`, `:383`), whose gaps are R05;
  - Completed/UniversalCovers, and the existence of the other supplier roadmaps on main (DGAInfinity, CharacteristicClasses, MorseNovikov, MorseTheory, PseudoholomorphicCurveAnalysis, SymplecticGeometry with HamiltonianReduction and CotangentLagrangian, TaubesGromov).
- At open heads: AnalyticStableMaps (#987) §§3.2–3.7 and 11.1; DGFloerPartII (#1799), whose 24 distinct DGFloer ids all resolve here, `Layer 4 item 5` through the numbering note at `:162`.
- `roadmaps resolve`: none of its 26 unresolved names is a defect; each is a declaration of `Suggested.lean`.

**Ownership.** The following were searched by object at the pins, on main and at the open heads (`roadmaps grep`):
- the Hamiltonian formalism of 6.0: only HamiltonianSystems, which is on the dropped list, states it. This roadmap is therefore the owner, and no fully qualified name collides;
- genus-zero stable-map compactness: AnalyticStableMaps owns it, and it is consumed here through the gap;
- the torus criterion and mod-2 vanishing: only this roadmap and its conflicting revision #963 state them (R08).

**Gap.** gap:genus-zero-stable-map-compactness is precise and names its supplier, and the sections it cites exist at #987. The board has no `design/plan.json` for this package, so the intake has no record of the slug. The worker should register it.

## Not verifiable

These are books or paywalled texts, cited by locator; none was read:
- Whitehead Chapter I (2.2) and Palais 1960 (1.6);
- Serre 1953, Théorème 1, and Weibel 5.5.1 and 5.5.10 (1.3–1.4);
- Massey Chapters II and VII;
- McDuff–Salamon §3.1, Abraham–Marsden Chapter 3, Chernoff–Marsden LNM 425 and Hartman Chapter V, Theorem 3.1 (6.0);
- Hofer–Zehnder Chapters 1, 3 and 4, and Struwe 1990 (6.5);
- Bröcker–tom Dieck Chapter V (11.1);
- Floer–Hofer–Salamon Lemma 6.5, Piunikhin–Salamon–Schwarz §4 and Hofer–Salamon §4 (7.C);
- the Abbondandolo–Schwarz corrigendum.

The constructions of 7.C, 7.G and 7.T were read for their Checks, not proof by proof.

## Source issues

- **Error** in bdho-cotangent at the proof of Theorem 5.15, printed p. 99 (lines 4322–4324): the source says the abelian groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; it should use a genuine Serre class or a mod-2 vanishing theorem, since `ℚ` is in the class and its subgroup `ℤ` is not; affects the proof.
