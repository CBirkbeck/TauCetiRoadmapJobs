# Review of DGFloer (pull request #1798 at 63e59c6)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DGFloer/` at 63e59c6. The folder changed by 1069 lines since f28741c, the head the previous review read. Nothing outside the folder changes (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty).

The gate passes on this head. There are four findings, two of them blocking:

- **R01 (P2).** Layer 11 items 1–2 now own the invariant inner product, the splitting, the negative Killing form and the root `SU(2)` homomorphisms, which LieGroups Layer 5A and Layer 6 on main already own: two owners.
- **R02 (P2).** 1.6 and the ownership table cite GeometricTopology Layer 3 for the compact-embedding restriction bundle onto the `Diff` orbit, which Layer 3 on main does not state.
- **R03 (P3).** Four targets carry no text locator: 1.2's spectral-sequence paragraphs, 3.1, 7.1 and 7.4.
- **R04 (P3).** The conflicting open revision #963 still has no stated order with #1798 (previous R08, not repaired).

## Previous findings (review at f28741c)

- **R01, Theorems 5.10 and 5.15 statable but absent: repaired.** `Suggested.lean:112` states `hasContractibleAlmostExistence_of_degree_ne_zero` with the three alternatives of Theorem 5.10 as one disjunction, and `:198` states `hasContractibleAlmostExistence_of_mod_two_degree_ne_zero` with `Nontrivial (π_ 2 Q q) ∨ ∃ n, ¬ Function.Surjective (fun a : π_ (n + 3) Q q ↦ a ^ 2)`. README 10.5 (`README.md:3998–4028`) names all six statements.
- **R02, the dropped name: repaired.** `README.md:4263` now reads "**StableHomotopyKTheory** consumes Layer 1 items 1–4; **StringOrientation** consumes Layer 11's finite cover and torus criterion". The gate rerun reports `dropped=0`.
- **R03, the Layer 6 API catalogue: repaired.** `Suggested.lean` has 7 declarations; the Layer 6 section and its four imports are gone, and 6.0 (`README.md:1987–2234`) carries no backticked name of this roadmap's own (gate `readme-ids-missing=0`).
- **R04, 10.3's hypotheses and false Check: repaired.** `README.md:3905–3912` states Proposition 5.9 with "`Q` a closed orientable smooth `n`-manifold", "`Σ ⊂ T*Q` a closed hypersurface bounding a relatively compact open set `U`" and "No hypothesis places the zero section in `U`"; `:3926–3934` is the `S³` example.
- **R05, Layer 11's citation of a LieGroups section only #1051 defined: repaired as asked, and overtaken.** The head took the second option and owns the four Lie-algebra facts (`README.md:97–100`, `:4121–4131`, `:4168–4183`). Since then #1051 has merged: main (94294cd) has LieGroups Layer 5A. That is R01 below.
- **R06, 1.5's unstated interfaces: repaired.** `README.md:1373–1390` states the shriek map as the collapse onto `Th(ν)` followed by the inverse suspension isomorphism and the effect on fundamental classes as `[M] ⌢ c^*u_k = (−1)^{nk} i_*[N]`, with the `T²` Check at `:1406–1416` and locators into Hatcher and BDHO (verified below).
- **R07, the 9.2 locator: repaired.** `README.md:3757–3770` cites the source's §1.5 theorem (`bdho-cotangent` lines 679–681) for the local-coefficient statement and keeps Abbondandolo–Schwarz Theorem 3.1 for the untwisted case.
- **R08, the order with #963: not repaired.** R04 below.

## R01 (P2) — Layer 11 items 1–2 restate what LieGroups Layer 5A and Layer 6 own on main

- **Location.** `README.md:97–100`: "the invariant inner product, the semisimplicity of the derived ideal and the negative Killing form of the Lie algebra of a compact Lie group, the rank-one `SU(2)` homomorphisms of its roots". Also `:186`, `:4121–4131` ("own the existence of an `Ad`-invariant inner product", "own that `[𝔤, 𝔤]` is a direct sum of simple ideals", "own the sign of the Killing form"), `:4168` ("*Root homomorphisms*, owned here"), and `:812–815` (the splitting from HamiltonianReduction R5).
- **Claim.** All four objects have an owner on main, earlier in the merge order, so this roadmap must cite them, not restate them; and the splitting is cited from a gauge-theory section while its owner is LieGroups.
- **Witness.** On main (94294cd), `RepresentationTheory/LieGroups/README.md:641–656` ("Layer 5A: compact Lie-algebra metric and splitting") constructs `B_G` by Haar averaging, proves "`𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` orthogonally, that `s=[𝔤,𝔤]` is a centerless semisimple ideal, and that its Killing form is negative-definite"; `:751` ("Rank-one representatives") builds `SU(2)→G` for each root through Layer 4's integration.
- **Repair.**
  - In 11.1 consume LieGroups Layer 5A for the invariant inner product, the orthogonal splitting, the semisimplicity of `[𝔤, 𝔤]` and the negative-definite Killing form on it; keep only the one-line corollary that `B` is negative semidefinite on `𝔤` with kernel `𝔷` (Meinrenken Proposition 8.33), the integration to `ℝʳ × K`, the finiteness of `Z(K)`, the lattice argument and the cover `T × K → G`.
  - In 11.2 consume LieGroups Layer 6's compact real roots and rank-one representatives for `𝔰𝔲(2)_α` and `f : SU(2) → K`; keep the Cartan 3-form, the computation `f^*ω(e₁, e₂, e₃) = B(df e₁, df e₁) < 0`, the smoothing of a null-homotopy and `π₃(K) ≠ 0`, which LieGroups does not state.
  - Delete the four "owned here" clauses from `README.md:97–100` and the clause "the invariant inner product, … are Layer 11 items 1–2" from `:186`; add "LieGroups Layer 5A" and "Layer 6's rank-one representatives" to `:791–795`, the `*Needs:*` lines at `:4140` and `:4192`, and the Dependencies at `:4239`; drop the HamiltonianReduction R5 row (`:180`) and bullet (`:812–815`), which are no longer consumed.

## R02 (P2) — 1.6 cites GeometricTopology Layer 3 for a restriction bundle that Layer 3 on main does not build

- **Location.** `README.md:1422–1424`: "GeometricTopology Layer 3's orthogonal sphere action and compact-embedding restriction bundle onto the `Diff` orbit. Specialize that restriction construction to a point"; `:184`: "The restriction bundle of embeddings, collars and tubular neighbourhoods | GeometricTopology Layers 1, 3 and 7 | consumed by Layer 1 items 5–6".
- **Claim.** On main, GeometricTopology Layer 3 builds the group `Diff(M)`, its `C^∞` topology, the smooth-families map and the inclusion `O(n+1) → Diff(Sⁿ)`, and nothing about embedding spaces or a restriction bundle. The restriction bundle exists only at the open revision #903 of GeometricTopology, which revises an existing roadmap and is never a dependency. 1.6 is then a specialization of a construction nobody supplies.
- **Witness.** `GeometricTopology/README.md:357–408` on main (94294cd), "What to build": the four bullets at `:371–389` (group, topology, smooth-families map, `O(n+1) → Diff(Sⁿ)`); no line of Layer 3 contains "restriction", "orbit" or "embedding". `roadmaps list` shows #903 (`@kim-em`, 9f470e6) open.
- **Repair.** 1.6 already carries the point-case proof (local sections from compactly supported vector fields, `g ↦ (g(x₀), s(g(x₀))⁻¹ g)`, Palais 1960): make it own that construction outright. Delete "and compact-embedding restriction bundle onto the `Diff` orbit. Specialize that restriction construction to a point, identify its `C^∞` embedding space with `M` through the evaluation and inverse maps" from `:1422–1425`, and cite Layer 3 only for `Diff(M)`, its topology, the smooth-families map and `O(n+1) → Diff(Sⁿ)`. In `:184` replace "The restriction bundle of embeddings, collars and tubular neighbourhoods" by "`Diff(M)` with its `C^∞` topology, collars and tubular neighbourhoods"; add "the local triviality of `Diff(M) → O`" is already in the owned list at `:73`.

## R03 (P3) — Targets without a text locator

- **Location.** `README.md:1037–1115` (the homological, arbitrary-base and cohomological Serre spectral sequences of 1.2); `:1626–1633` (basepoint change, 3.1); `:2409–2429` (7.1); `:2486–2497` (7.4: "Define the complex, continuation maps and homotopies; prove that the action filtration is preserved by monotone homotopies and shifted by at most the Hofer-norm bound").
- **Claim.** None of these cites a theorem or page. The layer-level Dependencies name Hatcher §§4.1–4.3, 4.D and 4.J for Layer 1, and none of those sections contains the Serre spectral sequence; Serre 1951 is in the References but assigned to "Layer 0 and Layer 1 item 4". Layer 7's Dependencies name Salamon's lectures and Audin–Damian by chapter only.
- **Witness.** `README.md:1467–1469` (Layer 1 sources), `:4443–4445` (the Serre 1951 entry), `:3586–3588` (Layer 7 sources). The statements exist at: `salamon-lectures` line 342 (§1.4, the action), 734 (§2.4, the Conley–Zehnder index), 1343 (§3.4), 1202 (Theorem 3.6), 1379 and 1387 (Lemmas 3.10–3.11, continuation chain maps and homotopies); `bdho-cotangent` lines 2131–2138, 2180–2184 and 2185–2191 (Proposition 3.22, Corollaries 3.24–3.25, whose Remark 3.23 at 2168–2172 calls the filtration estimate classical); `bdho-morse-dg` line 2867 (§6.4, twisted complexes at different basepoints).
- **Repair.** Cite Serre 1951 Chapter II at the homological sequence paragraph (and reassign the References entry to 1.2 and 1.4); cite BDHO §6.4 at 3.1's basepoint change; cite Salamon §1.4 and §2.4 at 7.1; cite Salamon §3.4 (Theorem 3.6, Lemmas 3.10–3.11) and the source's Proposition 3.22 with Corollaries 3.24–3.25, read with classical coefficients, at 7.4.

## R04 (P3) — A conflicting open revision of this roadmap with no stated order (previous R08, not repaired)

- **Location.** The pull request description; its merge-order paragraph does not mention #963.
- **Claim.** #963 (`@t4v1`, 62109eb) changes `TauCetiRoadmap/DGFloer/README.md` and `Suggested.lean` and the two heads conflict: its Layer 11 is "manifolds abundant with 2-spheres, and knotted hypersurfaces" (its `README.md:1657`), which this head moves to DGFloerPartII, and both state mod-2 vanishing.
- **Witness.** `roadmaps overlaps DGFloer`: "#963 and #1798 conflict in `TauCetiRoadmap/DGFloer/README.md`, `TauCetiRoadmap/DGFloer/Suggested.lean`"; `roadmaps list` shows #963 open.
- **Repair.** State in the description which of #963 and #1798 is rebased on the other before either merges.

## Verified sound

**Gate and dependency check** (both rerun on 63e59c6):

```text
gate DGFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

The dependency check prints no UPWARD, CYCLE or `moved:` line. The worker's record has `build=0`. `PROGRESS.md` and `STATUS.md` are the generated status files that every roadmap on main carries (gate `stray-files=0`).

**Elaboration.** A scratch copy of `Suggested.lean` with `#check @name` for all 7 declarations was elaborated with `lake env lean` from the worktree root: 7 `sorry` warnings, no error, no other warning. Each elaborated type was compared with its README statement:
- Theorems 5.10 and A keep `[ConnectedSpace Q]`, `[IsManifold 𝓘(ℝ, E) ∞ S]`, both `HomologicalOrientation`s, `d ≠ 0` (respectively `IsUnit d`), the three-way disjunction of `README.md:4005–4008`;
- Theorems 5.15 and C keep `IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))` and the mod-2 degree as a nonzero map on `singularHomologyFunctor (ModuleCat ℤ) n` at `ZMod 2`, as `README.md:4040–4045` says;
- the torus criterion keeps `[LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G]`. Its model `E` is any real normed space, but a Lie group in Mathlib's sense is a topological group, hence Hausdorff once locally Hausdorff, and `ModelWithCorners` forces `range I₀ ⊆ closure (interior (range I₀))`, so a compact `G` contains an open subset homeomorphic to an open subset of `E`, which is locally compact only when `E` is finite-dimensional. The statement therefore admits no infinite-dimensional instance, and nothing changed.
- No section binder is lost (`scratch/signatures.md` agrees).

**One-tactic probes.** Every `sorry` replaced by `first | rfl | simp | infer_instance | assumption` in a scratch copy: all 7 fail to close (7 errors), and none restates a definition, mirrors a Check or computes a value. Nothing is padding.

**Headline theorems.** Listed in the README (`:17–21`): the fibration theorem (5.4), the DG Floer comparison and Theorem J (8.6), Theorem K (9.3), Theorems L and M (10.1–10.2), Theorems A and C with their general forms 5.10 and 5.15 (10.5), mod-2 vanishing (1.4) and the torus criterion (11.3). Stated: mod-2 vanishing, 5.10, A (two cases), 5.15, C, the torus criterion. Not statable, with the missing carrier named in the docstring: J, K, L, M, the fibration theorem, the Arnold bound, the Serre spectral sequences, the Floer–Novikov torsion; Corollary D's magnetic form needs the exterior derivative of a one-form on `T*Q`, which DifferentialGeometry Layer 1 builds and the pin lacks (`mextDeriv` occurs at the pin only in `Analysis/Green/`). No statable headline is absent.

**Seeded sample** (15 targets; "the source" is `bdho-cotangent`):

| Target | Locator read | Result |
|---|---|---|
| 1.2 | Hatcher Theorem 4.41 (`hatcher-at` 16327), Proposition 4.48 (16461), remark on Huebsch–Hurewicz (16463–16466), Propositions 4.13 (15375) and 4.21 (15508) | supported for the exact sequence and CW approximation; the spectral sequences have no locator (R03) |
| 1.4 | Hatcher Proposition 4.30 (15928), Lemma 4.31 (15931); the source's Theorem 5.12 (4204–4206), citing Serre's Theorem 1 | supported; Serre 1953 and Weibel not verifiable |
| 2.2 | Hatcher 16463–16466; BDHO §7.1 (`bdho-morse-dg` 3053–3056, citing [DK69, Proposition 5.5] for the transitive replacement) | supported; Whitehead Chapter I not verifiable |
| 3.1 | the source's Definition 1.8 (481–490); BDHO §6.4 (2867–2882) treats twisted complexes at two basepoints | supported in substance; no locator at the item (R03) |
| 5.2 | BDHO §3.1 (900), §5.2 (1412), Chapter 6 (1914–2965); Proposition 5.2.6 with (5.12) (1638–1650), Proposition 5.2.8 (1699) | supported; the sign `(−1)^{|x|−|z|}` matches 5.1's Check |
| 6.4 | the source's Corollary E (304–312): restricted contact type with complete Liouville field, symplectization by the Liouville flow | supported; Hofer–Zehnder Chapter 4 uncertified |
| 7.2 | the source 1615–1617 (Barraud–Cornea Appendix A for the corner compactification); Salamon §§2.6, 3.1, 3.3 (TOC 26–31); Audin–Damian Chapters 6–9 (TOC 71–101) | supported |
| 7.4 | Salamon §3.4 (1343), Theorem 3.6 (1202), Lemmas 3.10–3.11 (1379, 1387) | the statements exist; no locator at the item (R03) |
| 8.3 | Definition 3.12 (1823–1831), Proposition 3.13 (1836–1840) | supported |
| 8.4 | Definition 3.15 (1943), Proposition 3.16 (1947), Definition 3.17 (2066), Proposition 3.18 (2072), Definition 3.21 (2109–2118), Proposition 3.22 (2131–2138), Corollary 3.24 (2180–2184), Corollary 3.25 (2185–2191), Corollary 3.28 (2251), Proposition 3.29 (2519) | supported; the direction Check agrees with 2133 and 2181 |
| 10.1 | Theorem L (735–739), Theorem 5.1 (3843–3846), Remark 5.2 (3847–3849), Proposition 5.5 (3883–3885), Lemma 5.7 (3907–3909), Proposition 5.8 (3924–3930) | supported |
| 10.2 | Theorem M (753–757), Theorem 6.4 (4382–4385), Proposition 6.6 (4394–4396), Proposition 6.7 (4429–4432), Definition 6.1 (4340–4346) | supported |
| 10.3 | Proposition 5.9 (4107–4117), its proof (4118–4137), the mod-2 remark (4299–4302), the one-form remark (256–260); Hatcher Theorem 4D.10 (19073–19074), Exercise 7 (19262–19263) | supported; hypotheses now stated |
| 10.4 | Lemma 3.41 (2753–2757), Proposition 5.11 (4154–4161), Proposition 5.13 (4229–4242), the proof of 5.10 (4246–4258); BDHO Proposition 10.6.1 (7091–7094) | supported |
| 10.5 | Theorem 5.10 (4140–4150), Theorem 5.15 (4293–4298), its proof (4299–4329), Theorem A (214–222), Theorem C (249–255), the derivations (4260–4265, 4330) | supported; the Lean statements match |

Also read: 1.5's locators, BDHO Remarks 9.2.4–9.2.5 (`bdho-morse-dg` 4090–4100) and Proposition 11.3.2 (7870–7880), Hatcher's cap product (10391–10395), Example 3.31 (10459–10480), the cup–cap relation (10777–10779), Corollary 4D.9 (19035–19046) and §4.D Exercise 8 (19264–19267); 9.2's Abouzaid Theorem 4.1.1 and Remark 4.1.2 (`abouzaid-viterbo` 3595–3605), Theorem 5.1.1 (4610–4612), Corollary 6.1.2 (6465–6468), Abbondandolo–Schwarz Theorem 3.1 (1771–1789); 5.6's Abouzaid Proposition 3.2.4, Lemma 3.2.6, Exercise 3.2.7, Definition 3.2.8 (2902, 2946, 2949, 2952); Layer 11's Meinrenken Theorem 7.8 (1592), Corollary 8.16 (1892–1903), Theorem 8.22 (1946–1959), Proposition 8.33 (2131–2140), Definition 11.11 (3189–3205), Theorem 12.4 (3466–3472), Proposition 12.5 (3526–3534), Remark 12.6 (3537–3543), Bott §1 (`bott-lie-groups` 92–93), the source's Example 6.30 (5015) and Proposition 6.31 (5037); 7.C.2d's Salamon Definitions 4.3–4.4 (1780, 1822) and Ivashkovich–Shevchishin Theorem 1.1 with Remark 2 (299–316).

**Adversarial table.** `ω = dq ∧ dp` with `ι_X ω = dH` unless stated otherwise.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 1.1 | `S¹`; `S¹ ⊔ pt`; `S¹ ∨ S¹` | `π₁ = ℤ = H₁`; `H₁ = ℤ` but `π₁(pt) = 0`; `[a, b] ↦ 0 ∈ ℤ²` | holds; path-connectedness needed |
| 1.4 mod-2 vanishing (Lean) | point; `M(ℤ/3, 2)`; `S³` | trivial; `π₂ = ℤ/3`, doubling bijective; `H₃(S³; 𝔽₂) ≠ 0` excludes it, `π₃ = ℤ` not 2-divisible | holds |
| 1.5 `[M] ⌢ c^*u_k = (−1)^{nk} i_*[N]` | `T²`, `N = S¹ × {y₀}`; two points in `S¹`; `∅` | square cut on the diagonal: `σ₁ = [v₀₀, v₁₀, v₁₁]` (det `+1`), `σ₂ = [v₀₀, v₀₁, v₁₁]` (det `−1`), `[T²] = σ₁ − σ₂`; `β = Δy` kills `σ₁`'s front edge and gives `−[v₀₁, v₁₁] = −a` on `σ₂`; `(−1)^{1·1} a = −a` (Hatcher 10478: `[M] ⌢ ψ = −a`). Two points: `deg c = 2 = 2[pt]`, resp. `0 = 0`. Empty: `0 = 0` | holds; the unsigned formula gives `+a` and is excluded |
| 1.5 shriek | `b = [pt × S¹]`, `a`, `[T²]` | `b ↦ [pt]`, `a ↦ 0`, `[T²] ↦ [N]` by both descriptions | holds |
| 2.1 | `B × S¹`; point | fibre over duration `0` a point, over duration `1` `Ω^{[0,1]}S¹` with `π₀ = ℤ`; `Ω^{>0}(pt) ≅ (0, ∞)` | holds as restricted |
| 2.2 | double cover | transport swaps the fibre: `ℤ²` permutation module, not the sign | holds |
| 5.1 | index difference 2 | `(−1)^{1} = −1` against (5.12) | holds |
| 5.3 | double cover; collapse `T² → S²` | `f_* f_! = 2` in degrees 0, 1; `f_! f_*` kills `H₁(T²)` | holds |
| 5.4 | path-loop over `Sⁿ`; double cover | `H_*(pt)` versus `H_*(Sⁿ) ⊗ H_*(ΩSⁿ)` for the trivial action; `H_*(S¹; ℤ[ℤ/2]) = ℤ, ℤ` | holds |
| 6.0 Leibniz and bracket | `(ℝ², dq ∧ dp)` | `ι_{a∂_q + b∂_p} ω = a dp − b dq`, so `X_q = −∂_p`, `X_p = ∂_q`, `X_{qp} = q∂_q − p∂_p`; `{q, p} = ω(−∂_p, ∂_q) = 1 = dq(X_p)` | holds |
| 6.0 weak versus strong | `c₀ × ℓ¹` | `ω♭` injective, image `(q', β) ↦ a(q') + β(q)`, a bidual functional outside `c₀` not hit; `(0, −a)` is Hamiltonian for `a(q)`, pinned field `0` | holds |
| 6.0 symplectic flows | `X = q∂_q`; `H_t = tq` | pullback `e^t ω`; `X_{H_t} = −t∂_p`, `Φ_{s,t} = (q, p − (t² − s²)/2)` | holds |
| 6.0 variational equation | `H = (q² + p²)/2` | `R′ = AR`, `A = [[0, 1], [−1, 0]]` | holds |
| 6.2 | `D²ⁿ`, `λ = ½Σ(p dq − q dp)` | `ι_Z dλ = λ` for `Z = ½(q∂_q + p∂_p)`; closed manifold: `∫ωⁿ = 0` | holds |
| 6.4 | `S*Q`, `λ = −λ_can` | `Z = p∂_p` flows `S*Q` to radius `eᵗ`, conjugating cogeodesic foliations | holds |
| 7.1 | `εH`, `H = (q² + p²)/2` | `a = εp`, `b = −εq`: `X = ε(p∂_q − q∂_p)`, `S = −εI`, `CZ = +1 = n − ind` | holds |
| 7.3 | `S¹` height function | signs `(+, −)`: `ℤ, ℤ`; `(+, +)`: `0, ℤ/2` | holds |
| 7.4, 8.4 | `H + ε(s)`, `ε: 0 → δ` | shift `−δ`; bound `∫ max(−∂_sH) = 0`; source's `∂_s H ≤ 0` with `FC(H₊) → FC(H₋)` (2133, 2181) corresponds under `s ↦ −s` | consistent |
| 7.C.2b | `K = H dt`; `J₀` on `ℝ⁴` | stationary cylinder `δ − δ = 0` (with `−∂_sH`: `2δ`); tame `2n² = 8` versus compatible `n(n+1) = 6` | holds |
| 7.T | `(S²)⁴`, areas `1, 3, 1, 1` | `c₁ = 2`, `ω = −1` | holds |
| 9.1 | `ℝP²` rotation | `η₀ = σ` on `w = −1`, monodromy `+1`; `ev₀^*(o_Q^{−1})` alone `−1` | holds |
| 9.2 | `S¹`; point | `ℤ[ℤ]` in degrees 0, 1; `ℤ` | holds |
| 9.4 | `ℝP²` | `H₂(ℝP²; o) = ℤ`, `H₂(ℝP²; ℤ) = 0` | holds |
| 10.1 | `D²ⁿ` | `i_{W*}[W, ∂W] = 0`, `j_{U!}[W, ∂W] = [U, ∂U] ≠ 0` | holds |
| 10.2 | `Q = S²`, degree-0 class | `j_!` has degree `−2`, `H_{−2}(𝓕 ⊗ |Q|) = 0` for the nonnegative `𝓕 = C_*(ΩL₀Q)` | holds |
| 10.3 | `S³`, tube missing the zero section | `d = 1`: `ker π_{U!}` is 1-torsion `= 0`; `ker i_{Q*} ⊇ H₁(Ω²S³) = ℤ` | holds |
| 10.4 | two points; `S²`; `S³`, `d = 2`; `ℤ/4` | not path-connected; `H₀(Ω²S²)` of rank `ℵ₀`; `H₁(Ω²S³) = ℤ` not 2-torsion; `ℤ/4` killed by `2²` | holds |
| Theorem 5.10 (Lean) | `S³`, `d = 2`; `T³`, `d = 1`; `π₃ = ℤ/2` first, `d = 2`; `ℝP³`; point | `k = 0`, generator `a` with `a² = a⁻¹ ≠ 1`: applies; every `π_{j+3}` subsingleton: silent; `a² = 1` for all `a` and `ℤ/2` is `2`-torsion: silent; `π₃ = ℤ`: applies; `c` regular forces `F(pt) ≠ c`, vacuous | holds |
| Theorem A (Lean) | `S²` zero section; `T²`; `T² ⊔ T²`; point | `d = 1` works; aspherical; excluded by `ConnectedSpace`; aspherical | holds |
| Theorem 5.15 (Lean) | `ℝP²`; Klein bottle; `ℝP⁴`; `π₂ = ℤ/3` | doubling on `ℤ` not onto, `H₂(;ℤ/2)` map `id ≠ 0`: applies; `π_{≥2} = 0`: excluded; `π₄ = ℤ` (`n = 1`): applies; `Nontrivial π₂` admits it, as the source's `π₀(Ω²Q)` argument (4313–4314) requires | holds |
| Theorem C (Lean) | `ℝP² ⊔ ℝP²` as `S`; `ℓ = 2` | `(a, b) ↦ a + b ≠ 0` though the total degree is `0`; `n = 0` gives `π₂` | holds |
| 11.1 Killing form | `U(n)`; `𝔰𝔩(2, ℝ)`; `𝔰𝔲(2)` | `B(X, X) = 2n tr X² − 2(tr X)²`: `−2n² + 2n² = 0` at `iI`, `−2nΣ|x_{ij}|² < 0` on `𝔰𝔲(n)`; `B(h, h) = 4·2 = 8`; `(ad e₁)² = −1` on the `e₂e₃`-plane, trace `−2` | holds |
| 11.1 cover | `U(n)`; `SO(3)`; `T^r` | kernel `μ_n`; `r = 0`, `K = SU(2)`; `K = 1` | holds |
| 11.2 | `SU(3)`, `α = ε₁ − ε₂` | `ē_α = −E₁₂^* = −E₂₁`, `f_α = E₂₁`, `h_α = E₁₁ − E₂₂`, `α(h_α) = 2`; `e − f = E₁₂ − E₂₁` anti-Hermitian; the other sign gives the Hermitian `E₁₂ + E₂₁` | holds |
| 11.2 3-form | root `f : SU(2) → K`; torus | `f^*ω(e₁, e₂, e₃) = B(df e₁, df[e₂, e₃]) = B(df e₁, df e₁) < 0`; `B = 0` on a torus | holds |
| torus criterion (Lean) | `T^r`; `SO(3)`; `ℕ → S¹`; trivial group | both sides true; `π₃ = ℤ`, both false; 2-torsion `(ℤ/2)^ℕ` uncountable, no Lie structure; `r = 0`, both true | holds |
| 7.C.2d | `z + ε/z`; `M̄_(0,4)`; `T⁴` irrational periods | class `2[S²]`, energy `2L` conserved; three boundary points meet `k − 2 + 2a = 2`, `k − 3 + 3a = 1`; only `A = 0` carries maps | holds |

**Pinned declarations opened** (Tau Ceti 2fd255d, Mathlib 1b1ccf4). Every backticked `TauCeti.*` name of the README and the Lean file (223 distinct names) was grepped at the pin as a declaration head; all 223 exist. Opened in full:
- `AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75` (`HomologicalOrientation`: a coherent family of local orientations, so `IsEmpty` is non-orientability);
- `AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:204`, `:275` (`fundamentalClass`, `mapFundamentalClass`);
- `Geometry/Symplectic/Hamiltonian/AlmostExistence.lean:167` (`HasContractibleAlmostExistence`: `∃ ε > 0, ∀ᵐ c' ∈ (c − ε, c + ε)`, regular `c'` carries a contractible closed characteristic), `:186` (`hasContractibleAlmostExistence_smul_iff`, `a ≠ 0`, finite dimension);
- `Geometry/Manifold/RegularValue.lean:92` (`IsRegularValue`: surjective `mfderiv` at every preimage);
- `AlgebraicTopology/Homotopy/LoopSpace/Aspherical.lean:229` and `:306` (Lemma 3.41, path-connected `X`);
- `Geometry/Symplectic/Hamiltonian/Bracket.lean:73` (`IsHamiltonianVectorField.mvfderiv_eval₂`, closed form), `Hamiltonian/CommutingFlow.lean:149` (`mpullback_globalFlow`), `Hamiltonian/Complete.lean:74` (`IsFirstIntegral.apply_maximalIntegralCurve`), `Symplectic/Manifold/Opens.lean:64` (`IsSymplectic.mpullback_subtype_val`), `Symplectic/Capacity/Levels.lean:247` (`exists_mem_Ioo_hasContractibleClosedCharacteristic`);
- `Topology/Homotopy/LoopSpaceFibration.lean:91` (`loopMap_loopMap`), `Topology/Homotopy/HurewiczFibration/RelativeLifting.lean:47` (`exists_lift_of_ndrPair`), `Topology/MappingSpace/Fibration.lean:41` (`isHurewiczFibration_restrict`), `Topology/PathSpace/Moore/Replacement/Equiv.lean:220` (`isHurewiczFibration_target`), `Topology/Homotopy/SerreFibration/FiberBundle.lean:365` (`mem_serreFibrations_of_exists_trivialization`), `Topology/MappingSpace/Evaluation.lean:64` (`mappingSpaceEval_comp_const'`).

**Cross-roadmap citations resolved** on main (94294cd): LieGroups Layers 4, 5, 5A, 6 (`RepresentationTheory/LieGroups/README.md:463`, `:518`, `:641`, `:673`; R01); CompactGroups Layer 0 (`:205`, Haar and averaging); HamiltonianReduction R1a.2 (`:97`) and R5 (`:305`, `:340` has the splitting for compact `K`); AlgebraicTopology Stages 2, 4, 4.4, 4.5, 5.1, 5.5, 6.3, 6.5, 8.3 (`:1684–1690`: the general Hurewicz map, "DGFloer Layer 1 item 1 owns the theorem that this exact map is an isomorphism"), 8.8a (`:1831`), 8.10 (`:1913`); HeegaardFloer Lane M with M.3 (`:367`), F0, F1.3–F1.5 (`:2152`, `:2195`, `:2340`, with `CZ=−μ_RS` at `:2364`), F2.1 (`:2437`, contraction inverse `:2453`, domain-local Moser lemma `:2468`), F2.2a–c (`:2742`), F2.3–F2.5, F2.6a–d (`:2750–2975`); GeometricTopology Layers 1 (tubular neighbourhoods `:218–222`, with Hirsch's isotopy uniqueness 5.3/6.5 in its reference entry at `:1002–1003`), 3 (R02) and 7 (`:627`); MorseNovikov N1 and N4 (`:176`: "Layers 1–7 retain the names N1–N7"); MorseTheory M1, M4, M5, M6 (`:110`, `:481`, `:857`, `:895`); SymplecticGeometry S0–S2 (`:84–104`); CotangentLagrangian C2.0–C2.1 (`:79`, `:109`); RiemannianGeometry R2–R3 (`:300`, `:347`); SmoothBundlesConnections B6.0 (`:1306`); DGAInfinity Layers 1, 4, 5 (`:293`, `:394`, `:431`); CharacteristicClasses C3.2 and `connectedMapHomologyComparison` (`:80`, `:612`); DifferentialGeometry Layers 0, 1, 3, 5 and 0.4 (`:268`, `:311`, `:371`, `:503`, `:294`); PseudoholomorphicCurveAnalysis PH1–PH7 with 2.2, 3.1, 3.4, 4.2, 5.1, 5.2, 6.3, 7.2 (`:399`–`:1271`); GeneralizedCohomology G2.10 and G5 (`:405`, `:1373`); TopologicalKTheory T1.5 (`:56`); SeibergWittenTheory SW3.3a (`:22`); Completed/UniversalCovers. At open heads: AnalyticStableMaps #987 (41557ba) §§3.2–3.4, 3.7, 11.1 for the gap; DGFloerPartII #1799 (aeddaae) cites DGFloer Layers 0–2, 4 item 5 (resolved by the numbering note at `README.md:164`), 5 items 4–6, 6, 10 and 11, and its 2.4 is the "Layer 2 item 4" cited at `README.md:1741`. `roadmaps resolve` and the worker's `citations.md` list nothing unresolved.

**Ownership** (by object, `roadmaps grep` over main and the 466 open heads): the torus criterion, the finite cover and `π₃(K) ≠ 0` are stated only here, in #963 (R04) and as a consumer in DGFloerPartII; the Lie-algebra inputs are LieGroups' (R01); the Pontryagin–Thom collapse's effect on fundamental classes is stated only here, and DGFloerPartII 1.5 consumes it; mod-2 vanishing and the Serre-class Hurewicz theorem have no second owner (ChromaticHomotopyTheory, StringOrientation, GeneralizedCohomology and AlgebraicTopologyPartII cite Layer 1 item 4); the Serre spectral sequences `arbitraryCWSerreSpectralSequence` and `arbitraryBaseSerreSpectralSequence` are cited from here by AlgebraicTopology on main (`:916–917`) and by GeneralizedCohomology; the Brown resolution has no second owner; genus-zero stable-map compactness is AnalyticStableMaps' through the declared gap. No `Suggested.lean` of a readable roadmap declares a name of `TauCetiRoadmap.DGFloer`.

**Gap.** gap:genus-zero-stable-map-compactness (`README.md:824–846`) is precise and minimal: six bullets with the family hypothesis, the Hausdorff-graph topology, the energy threshold, the graph bounds and the evaluation maps, none of which HeegaardFloer F2.6c supplies (its minimal-area compactness is the single-component case). The board has no `design/plan.json` for this package, so the slug is declared in the README only.

## Not verifiable

These are books or paywalled texts, cited by locator; none was read:
- Whitehead Chapter I (2.2); Palais 1960 (1.6); Serre 1953 Theorem 1 and Serre 1951 Chapter II; Weibel 5.5.1 and 5.5.10 (1.3–1.4); Massey Chapters II and VII;
- McDuff–Salamon §3.1, Abraham–Marsden Chapter 3, Chernoff–Marsden, Hartman Chapter V Theorem 3.1 (6.0); Hofer–Zehnder Chapters 1, 3, 4 and Struwe 1990 (6.5);
- Bröcker–tom Dieck Chapter V (11.1); Floer–Hofer–Salamon Lemma 6.5, Piunikhin–Salamon–Schwarz §4, Hofer–Salamon §4 (7.C); the Abbondandolo–Schwarz corrigendum; Oh, Chapter 21 (named by the source's Remark 3.23).

The constructions of 7.C, 7.G and 7.T were read for their Checks and their locators, not proof by proof.

## Source issues

- **Error** in bdho-cotangent at the proof of Theorem 5.15, printed p. 99 (lines 4322–4324): the source says the abelian groups `G` with `G ⊗ ℤ/2 = 0` form a Serre class; it should use a genuine Serre class or the mod-2 vanishing argument, since `ℚ` is in the class and its subgroup `ℤ` is not; affects the proof.
