# Review of DGFloer (pull request #1798 at 7d8ad27)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at 7d8ad27. The folder changed by 614 lines since 3166898, the head the previous review read. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty, and the gate passes.

Three findings follow, two of them blocking:

- **R01 (P2).** The ordinary topology now handed to AlgebraicTopology sits at stage numbers that exist only in open AlgebraicTopology revisions. No merge order names those revisions, and both main's AlgebraicTopology and the open #1652 hand the same targets back to this roadmap.
- **R02 (P2).** The cotangent criterion (10.3), Proposition 6.7 (10.2) and Corollary 4.17 (9.4) are stated for every DG local system, but their route goes through Theorem K, which 9.3 proves only when `H_*(𝓕)` is bounded below.
- **R03 (P3).** The order with the conflicting open revision #963 is still unstated, and the two heads now move the Serre spectral sequences in opposite directions.

## Previous findings (review of 3166898)

- **Previous R01 (P2), two owners for Layer 1 items 2–4: partly repaired.**
  - Repaired in the README: `:160–161` "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there". 1.2–1.4 now consume Stages 4.8, 5.0, 5.5, 8.8c and 8.8d, and the consumers list (`:4244–4250`) redirects the old citations.
  - Not repaired: the merge-order paragraph still names no AlgebraicTopology revision. That part is carried into R01 below.
- **Previous R02 (P3), the order with #963: not repaired.** The merge-order paragraph is unchanged. See R03.
- **Previous R03 (P3), `πℤ` in 7.5: repaired.** `:2470–2473` "the Reeb periods are `kπ` … slope `a ∉ πℤ`".
  - Recomputed: `X_{a|z|²} = 2a(p∂_q − q∂_p)` has 1-periodic orbits exactly when `a ∈ πℤ`.
- **Previous R04 (P3), the primitive in the 6.2 ball Check: repaired.** `:2199–2203` "`λ = ½ Σ (q dp − p dq)` … `dλ = Σ dq ∧ dp`".
- **Previous R05 (P3), convergence in the 8.7 ball Check: repaired.**
  - `:3663–3667` states conditions (A) and (B) of Theorem 3.49(ii), and the ball Check is restricted to them.
  - The unbounded `𝓕 = ⊕_k ℤ[k]` is now a Check, with the tensor-identity reason.
- **Previous R06 (P3), the `S¹ ∨ S¹` witness in 1.1: repaired.** `:982–987` "homologous to `a + b − a − b = 0` by the relations … No single singular square … has the commutator as its boundary loop".

## R01 (P2) — Layer 1 items 2–4 are handed to AlgebraicTopology stages that only open revisions define, with no stated order

**Location.** `TauCetiRoadmap/DGFloer/README.md`:
- `:163–175`, the numbering note, e.g. "Layer 1 item 2's homological, cohomological and multiplicative Serre spectral sequences … AlgebraicTopology Stage 5.5";
- `:784–806` (From TauCetiRoadmap.AlgebraicTopology);
- `:996`, `:1008`, `:1098`, `:1139` and `:1155`;
- the pull-request description, whose merge-order paragraph ends "#987 (AnalyticStableMaps) → **this pull request**" and whose body says "Layer 1 items 1–6 are unchanged".

**Claim.** This roadmap consumes the following and no longer owns them:
- CW approximation and the connected-map comparison (Stage 4.8);
- the filtered-complex adapters and convergence theorems (Stage 5.0);
- the fibration exact sequence and the Serre spectral sequences (Stage 5.5);
- `K(A, n)` (Stage 8.8c);
- Hurewicz modulo a Serre class (Stage 8.8d).

**Witness.**
- **Main, AlgebraicTopology README.** There is no Stage 4 item 8 (items 1–7, `:505–817`), no Stage 5 item 0, and no 8.8c or 8.8d. Main's Stage 5.5 hands the objects back to this roadmap: `:915` "Consume DGFloer Layer 1 item 2's homotopy LES and `arbitraryCWSerreSpectralSequence`". So does `:102`: "DGFloer Layer 1 item 4 owns the single functorial abelian K(A,n) family".
- **The four open CBirkbeck revisions** define these stages: #1797 (ad233ac), #1807 (ec7b876), #1808 (b71fe82) and #1854 (473bbf7). For example, #1854's AlgebraicTopology README has Stage 4 item 8 at `:1129`, Stage 5 item 0 at `:1181`, the Serre spectral sequence at `:1342` and 8.8c/8.8d at `:2587`/`:2661`.
- **The open #1652** (kim-em, 946a78a) also revises AlgebraicTopology. Its `README.md:659–665` consumes "item 2 (CW approximation, … the fibration homotopy long exact sequence and the homological and cohomological Serre spectral sequences …), consumed by 5.5 …; item 3 …; item 4 (the functorial abelian K(A,n) family …)" from DGFloer. It also uses "4.8" for compact generation, not CW approximation.
- **Consequence.** If this pull request merges before the AlgebraicTopology revision, main's Stage 5.5 consumes DGFloer 1.2 while DGFloer's note sends 1.2 back to Stage 5.5. The Serre spectral sequence then has no owner.
- **The overlap tool missed this.** `overlaps.md` reports no revision-only id because it does not parse "Stage 4.8"-style ids. Each id above was resolved by hand.

**Repair.**
1. In the merge-order paragraph, name the AlgebraicTopology revision that will carry Stages 4.8, 5.0, 5.5, 8.8c and 8.8d (one of #1797, #1807, #1808, #1854; all four define them) as a predecessor of this pull request.
2. Replace "Layer 1 items 1–6 are unchanged" with a sentence saying that items 2–4 now consume that revision's stages.
3. Add: "#1652 (AlgebraicTopology) consumes DGFloer Layer 1 items 2–4 and is rebased on <that revision> before it merges."

**Test.** At every point of the stated order, the homological Serre spectral sequence has exactly one owner on main, and no README on main cites its owner back.

## R02 (P2) — The cotangent criterion, Proposition 6.7 and Corollary 4.17 omit Theorem K's bounded-below hypothesis

**Location.** `TauCetiRoadmap/DGFloer/README.md`:
- `:3885`, 10.3: "If for some DG local system `𝓕` on `𝓛₀Q` the kernel of the direct map";
- `:3893`: "the zero-energy diagram of Layer 9 item 4 with Theorem K identifies `i_{(D*Q)*}` with `i_{Q*}`";
- `:3858–3860`, 10.2, Proposition 6.7: "a DG local system `𝓕` on `𝓛₀Q` and `α ∈ H_*(Q; i_Q^*𝓕)`";
- `:3800–3801`, 9.4: "Construct the transfer of DG local systems `𝓛Q → 𝓛T*Q` (Corollary 4.17)".

**Claim.** All three are stated for every DG local system `𝓕`. Each route uses Corollary 4.17's diagram, in which the Viterbo map `Ψ̃` is an isomorphism. The step that sends `i_{Q*}(α) = 0` to `i_{(D*Q)*}(π_!α) = 0` needs `Ψ̃` injective.

**Witness.**
- 9.3 (`:3757`) proves Theorem K only "For a DG local system `𝓕` on `𝓛Q` with `H_*(𝓕)` bounded below".
- So does the source: `bdho-cotangent` lines 688–689 state the hypothesis, and lines 3763–3767 use it for convergence.
- The source's Corollary 4.17 (line 3772) drops it. Its proofs of Proposition 5.9 (line 4118) and Proposition 6.7 (lines 4436–4437) apply Corollary 4.17 to arbitrary `𝓕`.
- For the README's own `𝓕 = ⊕_k ℤ[k]` (8.7, `:3676`), neither convergence condition holds, so the route proves nothing.

**Repair.**
- Add "with `H_*(𝓕)` bounded below" to:
  - 10.3's hypothesis;
  - Proposition 6.7 in 10.2;
  - Corollary 4.17 in 9.4.
- Add one Check: `𝓕 = C_*(Ω𝓛₀Q)` and `𝓕 ⊗ ℤ/2`, the systems 10.5 uses, have homology in degrees `≥ 0`.

**Tested.** With the hypothesis, every use in 10.5 still qualifies, and each route's Theorem K step is the statement 9.3 proves.

## R03 (P3) — The order with the conflicting open revision #963 is still not stated (previous R02, not repaired)

**Location.** The pull-request description: the merge-order paragraph does not mention #963.

**Witness.**
- `overlaps.md` reports: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`".
- At #963's head (62109eb), `README.md:555` reads "Own `arbitraryCWSerreSpectralSequence` for every path-connected CW base", and `:222` reads "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets".
- This head hands the same target to AlgebraicTopology (`:167–170`). The two heads change the same targets in opposite directions.

**Repair.** Add one sentence to the description, for example: "#963 (DGFloer) changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its Layer 1 item 2 ownership, before it merges." State the reverse if that is the intended order.

## Verified sound

### Gate, dependency check, elaboration, signatures and padding

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 235 roadmaps, 2258 edges, 0 problem(s)
```

- **Dependency check.** No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean` ran in 8.6 s and gave 7 `sorry` warnings, at lines 83, 109, 142, 165, 195, 218 and 244, and nothing else.
- **Signatures.** A scratch copy with `#check @name` for all 7 declarations elaborated. All 7 types equal `scratch/signatures.md`; the only difference is that `∞` prints as `(↑⊤)`. No binder was lost:
  - 5.10 and both A theorems keep `[ConnectedSpace Q]`, both `HomologicalOrientation`s, and `d ≠ 0` (respectively `IsUnit d`);
  - 5.15 and C keep `IsEmpty (HomologicalOrientation …)`;
  - the torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`.
- **Padding probe.** Every `sorry` was replaced by `first | rfl | simp | infer_instance | assumption | trivial | decide | aesop`. All 7 fail (7 errors), so nothing is padding.
- **Library names.** All 339 Lean-shaped backticked tokens of the README were matched against the declarations of the pinned Mathlib (1b1ccf4) and Tau Ceti (2fd255d). Every library name resolves. `TauCeti.IsHurewiczFibration` is at `TauCeti/Topology/Homotopy/HurewiczFibration/Basic.lean:58`. The only misses were file names and notation.
- **Pinned definitions opened.**
  - `TauCeti.degreeRaising` (`…/DegreeRaising.lean:71`) is in `ModuleCat.{0} R` with ring coefficients, as 2.3 says.
  - `piIteratedLoopSpaceMulEquiv` covers degrees `m + 1` only, and `zerothHomotopyEquivFundamentalGroup` is the `k = 1` Moore form.
  - The filtered spectral sequence has first page "numbered `2`", with `H^{p+q}(F_{q+1}/F_q)` at `(p, q)` (`…/Filtered/SpectralObject.lean:30–33`), as 1.3 says.
- **Name collisions.** No readable `Suggested.lean` other than this one, #963 and main declares in `TauCetiRoadmap.DGFloer`.

### Headline theorems

`README.md:17–21` lists:

- the fibration theorem (5.4);
- the DG Floer comparison and Theorem J (8.6);
- Theorem K (9.3);
- Theorems L and M (10.1–10.2);
- Theorems A and C (10.5);
- the torus criterion (11.3).

`Suggested.lean` states mod-2 vanishing, 5.10, A in two forms, 5.15, C and the torus criterion. Its docstring names J, K, L, M, the fibration theorem, the Arnold bound and the torsion invariant as not statable, each with the carrier it lacks. The Serre bullet was removed because the sequences are now AlgebraicTopology's.

### Seeded sample, read at the locators

- **1.3.**
  - The pinned conventions are as stated (above).
  - The regrading recomputes: for the homological sequence at `(a, b) = (1 − 2p − q, p − 1)`, the target `(p − r, q + r − 1)` maps to `(a + r + 1, b − r)`; the cohomological `(2p + q + 1, −p − 1)` maps the same way.
  - Weibel: see Not verifiable.
- **1.4.**
  - `bdho-cotangent` line 4204 (Theorem 5.12) and lines 4322–4324 (the non-Serre class).
  - `hatcher-at` lines 15928 (Proposition 4.30), 15931 (Lemma 4.31) and 15375 (Proposition 4.13).
  - #1854's 8.8c/8.8d (`:2587–2711`) state what 1.4 consumes: the `K(A, 1)` axiom for both classes, `hurewicz_isCIso`, uniqueness and the loop identification.
- **2.3.** The pinned declarations, as above.
- **5.2.** `bdho-morse-dg` lines 1368–1373 (the rooted tree), §§3.1 and 5.2 (table of contents lines 45 and 56), Chapter 6 (lines 62–65), Theorem 5.2.1 (1461), and Propositions 5.2.6 (1638) and 5.2.8 (1699).
- **5.5.** `bdho-cotangent` lines 1092 (Definition 2.3), 1111 (Proposition 2.5), 1184–1192 (Proposition 2.6, with a single top cell), 1202 (Lemma 2.9), 1209 (Remark 2.10), 1221 (Proposition 2.12), 1237–1241 (Corollary 2.13) and 1290 (Lemma 2.14).
- **5.6.**
  - `bdho-morse-dg` lines 8753, 8777, 8848, 8852 and 8864.
  - `abouzaid-viterbo` lines 2902 (Proposition 3.2.4, homotopy equivalence), 2946 (Lemma 3.2.6), 2949 (Exercise 3.2.7), 2952–2954 (Definition 3.2.8) and 2960 (Remark 3.2.9, `δ/2 < δᵢʳ < δ`).
- **6.4.** The pinned `exists_homeomorph_isMIntegralCurve_comp` exists. Hofer–Zehnder is uncertified (see Not verifiable).
- **6.5.** `bdho-cotangent` lines 4340–4346 (Definition 6.1), 4354–4359 (monotonicity and `c°_HZ(V, Z) ≤ c°_HZ(V)`), 4366–4368 (Proposition 6.3) and 3863 (Definition 5.3).
- **8.2.** `bdho-cotangent` lines 1787 (`m_{x,y} ∈ C_{|x|−|y|−1}(ΩLX)`), 1790 (Definition 3.7), 1796–1801 (Proposition 3.8) and 1803–1810 (Proposition 3.9).
- **9.4.** `bdho-cotangent` lines 3024–3028 (Proposition 4.1, `i_Q^*η ≃ |Q|`) and 3772–3786 (Corollary 4.17; see R02).
- **10.1.** `bdho-cotangent` lines 735–739 (Theorem L), 3843–3846 (Theorem 5.1), 3847–3849 (Remark 5.2), 3883 (Proposition 5.5), 3907 (Lemma 5.7) and 3924 (Proposition 5.8).
- **10.3.**
  - `bdho-cotangent` lines 4107–4117 (no zero-section hypothesis), 4118–4137, 4299–4302 and 256–260.
  - `hatcher-at` line 19073 (Theorem 4D.10).
- **10.4.** `bdho-cotangent` lines 4154–4161 (Proposition 5.11, both cases), 4229–4242 (Proposition 5.13, `(π∘φ)_* (π∘φ)_! = d · Id`) and 4252–4258.
- **11.1.** `meinrenken-lie` lines 2131–2140 (Proposition 8.33). Bröcker–tom Dieck is uncertified.
- **11.2.**
  - `meinrenken-lie` lines 3466, 3526 and 3537 (Theorem 12.4, Proposition 12.5, Remark 12.6).
  - `bott-lie-groups` lines 92–93 (`π₃` free, and `ℤ` for simple `G`).
- **Further locators.**
  - `hatcher-ssat` lines 433–438, 806–814, 984–994, 1414–1419, 1508–1512 and 1539–1541: each says what 1.2 attributes to it.
  - `bdho-cotangent` line 688 (Theorem K), 4140–4150 (Theorem 5.10), 4293 (Theorem 5.15) and 249–251 (Theorem C, non-orientable `Q`).

Apart from the dropped hypothesis of R02, every sampled statement is supported by its source as the README writes it. No locator is flagged unverified in the README.

### Adversarial table

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Mod-2 vanishing (Lean, 1.4) | point; `M(ℤ/3,2)`; `K(ℚ,2)`; `S³` | `π₂ = ℤ/3`, and `a ↦ 2a` is bijective (`2·2 ≡ 1`); `ℚ` is uniquely 2-divisible; `H₃(S³;𝔽₂) = 𝔽₂` excludes `S³`, where doubling on `ℤ` is not onto | holds |
| 1.4 one-step lemma | `Z = M(ℤ/3,2)`, `n = 2`; negative control `S²`, `n = 3` | `H̃_*(K(ℤ/3,1);𝔽₂) = 0` (3 is a unit mod 2); `0 → ℤ → 0` is not exact | holds |
| 1.4 Serre-class Checks | `ℤ/4`; `ℤ ⊂ ℚ` | `ℤ/4` is not killed by 2 but is an extension of `ℤ/2` by `ℤ/2`; `ℚ⊗ℤ/2 = 0`, `ℤ⊗ℤ/2 = ℤ/2` | hold |
| 1.4 surjection `H₁(ℤ) → H₁(ℤ/2)` | coefficient sequence | the next map is `×2` on free `H₀`, which is injective, so the map is onto with kernel `2H₁` | holds |
| 1.1 `S¹∨S¹` (repaired) | commutator | `σ_{aba⁻¹b⁻¹} ∼ σ_a+σ_b−σ_a−σ_b = 0` (`hatcher-at` 7250–7255) | holds |
| 1.2 consumed Serre sequence Checks | double cover; Hopf | swap action: `H₀ = ℤ` (coinvariants), `H₁ = ℤ` (invariants); trivial action gives `ℤ², ℤ²`; `d²: E²_{2,0} ≅ E²_{0,1}` leaves `(0,0)` and `(2,1)` | hold |
| 1.3 regrading | homological and cohomological | `(p−r, q+r−1) ↦ (a+r+1, b−r)`; `(p+r, q−r+1) ↦ (a+r+1, b−r)` | holds |
| 2.3 | `Map_*(S²,S²)`, `Ω²Tⁿ`, `Ω²S³`, `Map_*(S²,S¹)` | `π₀ = ℤ`; `π_j = π_{j+2}(Tⁿ) = 0`; `H₁ = π₃(S³) = ℤ`; contractible | hold |
| 5.2 | height function on `S¹` | half-loops give `1, t`; `d = 1 − t` on `ℤ[t,t⁻¹]` has kernel `0` and cokernel `ℤ` = `H_*(pt)` | holds |
| 5.5 | Hopf; `ℝP²` over `ℤ` | `i_![S³] = [S¹]`; `H₂(ℝP²;ℤ) = 0`, so the twisted class is needed | holds |
| 5.6 | `S¹`, `r = 1`; Kragh | `𝓛¹S¹` = constants; generic `δ` needed (Exercise 3.2.7) | holds |
| 6.2 (repaired) | `D²ⁿ` | `d(½(q dp − p dq)) = dq∧dp`; `ι_Z(dq∧dp) = λ`; flow `e^{t/2}z`, so `r = |z|²` | holds |
| 6.4 / 6.5 | `S*Q`; annulus; `B²(2)` | `p∂_p` scales the radius by `eᵗ`; radial orbits wind once, so the capacity is `∞`; `c_HZ = 4π` | hold |
| 7.5 (repaired) | `H = a|z|²` | Reeb period `π`; orbits at `a ∈ πℤ`; at `a = π` the whole plane is 1-periodic | holds |
| 7.1 CZ | `ε(q²+p²)/2` | `JS` with `S = −εI`; `CZ = −sign(S)/2 = +1 = n − ind` | holds |
| 8.2 | index difference 2 | `(−1)^{|x|−|z|} = −1`, so `∂m = −Σ m m` | holds |
| 8.7 (repaired) | `⊕_k ℤ[k]` | (A) and (B) fail; `𝓕⊗FC(H)` with Künneth gives 0 | holds |
| 9.4 | `ℝP²` | `SH^{=0}_2 = H₂(ℝP²;o) = ℤ` against `H₂(ℝP²;ℤ) = 0` | holds |
| 9.4 / 10.2 / 10.3 (R02) | `𝓕 = ⊕_k ℤ[k]`; `𝓕 = C_*(Ω𝓛₀Q)` | Theorem K needs bounded below (9.3, source 689); the first fails it, the second (degrees `≥ 0`) meets it | hypothesis missing |
| 10.1 Theorem L | `W = D²ⁿ` | `i_{W*}[W,∂W] = 0` since `SH = 0`; `j_{U!}[W,∂W] = [U,∂U] ≠ 0` | holds |
| 10.3 | graph of `λα` on `S³` | `d = 1`, so `ker π_{U!} = 0`; `ker i_{Q*} ⊇ H₁(Ω²S³) = ℤ` | holds |
| 10.4 | `S²`; `S³`, `d = 2`; `ℤ/4` | `π₀Ω²S² = ℤ`; `ℤ` not `2^m`-torsion; `ℤ/4` is `2²`-torsion | holds |
| 5.10 (Lean) | `π₃ = ℤ/3` or `ℤ/2`, `d = 2`; `d = −2`; `T³` | `a² = a⁻¹ ≠ 1`; `a² = 1`; `a^{(−2)^m} ≠ 1 ⇔ a^{2^m} ≠ 1`; every disjunct is false on `T³` | holds |
| A (Lean) | `S²` with `d = ±1`, `d = 3`; `T²⊔T²` | not aspherical; `π₂ = ℤ` not torsion; excluded by `ConnectedSpace` | holds |
| 5.15 / C (Lean) | `ℝP²`; `ℝP²⊔ℝP²`; `K`; `π₂ = ℤ/3` | doubling on `ℤ` is not onto; `(a,b) ↦ a+b ≠ 0`; `π_{≥2}(K) = 0`; 5.15 accepts `ℤ/3`, C does not | holds |
| Torus criterion (Lean) | `T^r`; `SO(3)`; `r = 0`; `(S¹)^ℕ` | both sides hold; `π₃ = ℤ`; trivial group; `(S¹)^ℕ` is excluded by `LieGroup` | holds |
| 11.1 / 11.2 | `U(n)`; `𝔰𝔲(2)`; `SU(3)` | `B(iI,iI) = −2n²+2n² = 0`; `−2`; `6·tr(¼diag(−1,−1,0)) = −3` | hold |

### Ownership, citations and overlaps

- **AlgebraicTopology's targets.**
  - The ids 4.8, 5.0, 5.5, 8.8c and 8.8d were resolved at #1797, #1807, #1808 and #1854. #1854's Stage 4 item 8, items 5.0 and 5.5 and 8.8c/8.8d state every property 1.2–1.4 consume, including Serre preimage excision, the `(−1)^{q p'}` product and strong convergence. See R01 for the order.
  - These revisions say DGFloer Layer 2 item 3 consumes their 8.11b, while this README (`:807`) consumes nothing from 8.9–8.12. That is a claim on their side in the allowed direction, and it creates no cycle.
- **DGFloerPartII (#1799, ba8a414).** Every citation of DGFloer resolves. Citations of Layer 1 items 2–4 go through the numbering note, and "Layer 4 item 5" through the note's mapping.
- **AnalyticStableMaps (#987, 41557ba).** It has §§3.2–3.4, 3.7 and 11.1. Its bound `(0,4,0)`: `#ghost ≤ 2`, `#edges ≤ 1` matches `k − 2 + 2a = 2` and `k − 3 + 3a = 1`. Main's DGFloer already consumes it; this head recasts that consumption as a gap.
- **Suppliers on main.** HeegaardFloer, LieGroups and CompactGroups (under `RepresentationTheory/`), HamiltonianReduction, UniversalCovers (`Completed/`), DGAInfinity and the other named suppliers exist on main.
- **Forbidden suppliers.** None is cited.
- **Ownership against open pull requests.** Checked through the sibling heads and `roadmaps show`: #963, #1652, #1797, #1807, #1808, #1854, #1799 and #987. The conflicts found are R01 and R03.

## Not verifiable

- **Serre 1951 and 1953**, *Homologie singulière des espaces fibrés* and *Groupes d'homotopie et classes de groupes abéliens*, Theorem 1. They are paywalled and not in the cache.
- **Weibel, Theorems 5.5.1 and 5.5.10** (1.3). No legal copy is in the cache.
- **Hofer–Zehnder Chapters 1, 3 and 4, Struwe 1990, Palais 1960, Bröcker–tom Dieck Chapter V, Massey and Whitehead.** All are settled as uncertified and cited by locator.
- **Not in the manifest or the cache**, and not sampled:
  - McDuff–Salamon §3.1, Abraham–Marsden Chapter 3, Chernoff–Marsden and Hartman Chapter V (6.0);
  - Floer–Hofer–Salamon Lemma 6.5 and Piunikhin–Salamon–Schwarz §4 (7.C).

## Source issues

- **Gap** in bdho-cotangent at Corollary 4.17, p. 87 (line 3772), used by Propositions 5.9 (p. 94) and 6.7 (p. 102): the source says the commutative diagram with the isomorphism `Ψ̃` holds for every DG local system; it should require `H_*(F)` bounded below, Theorem K's hypothesis (p. 16, line 689); affects a stated result.
- **Error** in bdho-cotangent at Theorem 5.15, proof, p. 99 (lines 4322–4323): the source says the groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; it should not, since `ℚ` lies in it while its subgroup `ℤ` does not; affects the proof.
