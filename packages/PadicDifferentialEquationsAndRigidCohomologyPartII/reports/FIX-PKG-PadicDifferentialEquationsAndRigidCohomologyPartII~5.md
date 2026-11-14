# Repair report: PadicDifferentialEquationsAndRigidCohomologyPartII (package, round 5)

This round settles the two findings of `REV-PKG-PadicDifferentialEquationsAndRigidCohomologyPartII~4`. Both are correct, and both are applied.

Files edited:
- `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/README.md`
- `packages/PadicDifferentialEquationsAndRigidCohomologyPartII/sources.toml`: the TSU `cited_for` range is now `MS.2.1-MS.2.9`.

Files not changed:
- `Suggested.lean`: it declares nothing, and no headline changed.
- `metadata.toml`.
- `design/plan.json`: no new supplier gap is needed.

## F01 (P1) — applied

**Old.** MS.4.1 took "the maximally PBQ convergent subobject" of the kernel `H = ker(N → P)`, citing MS.2.5. But MS.2.1 and MS.2.5 define PBQ, and the filtration, only for overconvergent objects.

**New.** A new target, MS.2.9 *Convergent PBQ objects and their filtration*, states:
- the definition of PBQ for a convergent object;
- independence of the choices;
- existence and uniqueness of the filtration, with grades of strictly decreasing maximal slopes;
- agreement with MS.1.1 generically and with MS.1.5 at every interior point.

Nothing is required at the boundary. MS.4.1 now uses `L = P_1(H)` from MS.2.9.

**Verification.**
- TSU line 1357–1362 (proof of Proposition 6.1, p. 26) introduces `L` as "the maximally PBQ convergent F-subisocrystal" of `H`. It asserts that the convergent filtration "exists similarly to Theorems 3.19 and 3.27".
- TSU line 991–1000 (Definition 3.26, Theorem 3.27) are stated for overconvergent `M†` only, as are TSU line 1052–1097 (Lemma 3.33).
- The reviewer's witness reproduces. On the ordinary locus `U` of the Legendre `L†`, `H = ker(L|_U → Top(L|_U))` is the unit-root line: rank 1, slope 0. It is not overconvergent: by §RD.5.8 and exactness, an overconvergent structure would make it a proper nonzero subobject of `L†|_U`, which is irreducible by §RD.5.112. So MS.2.5 cannot supply `L`.

**What the repair consists of.**
- **MS.2.2, new clause (4).** For a finite projective `Â_(C,K)`-module `H_C`, `H_C = ⋂_(α∈C) (H_η ∩ H_(0,α))`. It follows from (1) by the same direct-summand argument that gives (3) from (2). The first Check gains one sentence on the convergent unit.
- **MS.2.9, new target.** Its proof route mirrors Tsuzuki's Theorem 3.27 and Lemmas 3.32–3.33 without boundary data:
  - Uniqueness: on affine `C`, `L_C = H_C ∩ L_η`, because `H_C/L_C` is finite projective.
  - Interior gluing: rank one through the convergent half of the existing supplier request unit-root-correspondence-perfect-base, after the twist of MS.0.3 and with MS.2.2(4); rank `s` through `∧^s`.
  - Existence through MS.1.3 and MS.1.5.
  - Zariski gluing (§RD.3.40) for general `C`.
  - It has a full API list and five Checks: the unit; `O(−1) ⊕ O(0)`; the Legendre kernel `H` as the negative control for the overconvergent theory; the zero object (no nonzero grades); and proper `C`.
- **MS.4.1, restated.**
  - New explicit hypothesis `slope(P) = λmax(N)`, which is the first assertion of MS.4.2, proved there before MS.4.1 is used. Tsuzuki's "by our hypothesis" at TSU line 1360 relies on it.
  - A one-line derivation of `λmax(L_η) = slope(P)`.
  - Boundary equality `E_α ⊗ L†_α = E_α ⊗ L_C`.
  - Explicit generic, interior and boundary gluing data, and the reason the interior data are saturated.
  - *Needs:* now MS.0.10; MS.1.3; MS.1.4; MS.2.3; MS.2.9; MS.3.5; §RD.1.37. MS.2.5 is removed: MS.4.1 does not use it.
  - Two Checks were added or extended: the equal-rank Legendre case, where `L = H` has no overconvergent structure, and the `O(−1) ⊕ O(0)` slope control.

**Other places repaired (same pattern).**
- MS.4.2's proof route uses the overconvergent `P_1(N†)` without listing MS.2.5; its *Needs* now has MS.2.5.
- Layer MS.4 *Dependencies* now has MS.1 and names MS.2.9.
- Layer MS.2 *Dependencies* now has §§RD.0.17, RD.3.33, and MS.2.9 as a user of unit-root-correspondence-perfect-base.
- MS.2 Examples, the layer table, the Summary, Scope and ownership, "How to read the build", the supplier contracts (a new §RD.3.33/§RD.3.34 bullet; §RD.3.40 now covers convergent objects) and the parent import list (§§RD.3.33, RD.3.40) were all updated.
- No other target uses a PBQ filtration of a convergent object: MS.2.7 and MS.6.2 use overconvergent filtrations.

**Ownership.** `roadmaps grep -i 'PBQ|pure bounded quotient|maximally bounded quotient'` finds no match on main or in any open roadmap pull request. The board packages show only this package. Its parent (#1002) has no PBQ construction. This roadmap is the owner, as the reviewer also concluded.

## F02 (P1) — applied

**Old.** MS.5.3: "Induce an `F^n`-object to `⊕_(i<n) F^(i*)M` …; its first slope step is `⊕_(i<n) F^(i*)S_min(N)`". This attaches the subobject formula to the ambient object.

**New.** MS.5.3 now introduces two separate objects:
- the ambient `M′ = ⊕ F^(i*)M`;
- the subobject `N′ = ⊕ F^(i*)N ⊆ M′`.

It states:
- `Hull†_(M′)(N′) = ⊕ F^(i*)Hull†_M(N)`;
- `S_min(N′) = ⊕ F^(i*)S_min(N)`;
- `S_min(Hull†_(M′)(N′)) = ⊕ F^(i*)S_min(Hull†_M(N))`;
- `MS(M′)` applied to `N′`, read off at the summand `i = 0`, gives `MS(M)`;
- the ambient formula, with `M` on both sides: `S_min(M′) = ⊕ F^(i*)S_min(M)`.

**Verification.**
- DAD line 452–457 (Lemma 4.1.4, p. 12) defines `M′` and `N′` separately.
- The printed chain at DAD line 455–456 starts with a sum that lacks `S_1`. The intended first term is `⊕ F^(i*) S_1(Hull†_M(N))`.
- The reviewer's witness reproduces. For `n = 1`, the unit `M` and `N = 0`, the old text gives rank 1 on the left and rank 0 on the right.

**Other places repaired (same pattern).**
- The justification "`F^*` is an autoequivalence" now gives its reason: on `F^n`-isocrystals the Frobenius structure identifies `F^(n*)` with the identity. MS.5.3's *Needs* gains §§RD.3.25 and RD.3.34, where `F_σ^*` is defined.
- Two Checks were added: the unit ambient with the zero subobject, ranks `n = n` and `0 = 0` for `n = 1, 2`; and `N = M = L_0 ⊕ L_1` at `n = 2`, rank 4, slopes `(0,0,1,1)`, first step rank `2 = 2`. The `n = 1` Check now says that `M′ = M` and `N′ = N`.
- The "Corrections to the sources" entry for DAD Lemma 4.1.4 said only "the induced first slope step is `⊕ F^(i*) S_1(N)`". It now names the misprinted term, distinguishes `M′` from `N′`, and gives the rank Check.
- MS.5.5 ("the generic analogue of MS.5.3") and MS.6.7 (cyclic coefficient slots) do not use the induction formula.

## Checks run

- **Elaboration.** `lake env lean packages/PadicDifferentialEquationsAndRigidCohomologyPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. There are no `TauCeti.*` imports, so nothing needed building.
- **`#check` inventory.** `Suggested.lean` declares nothing, so the `#check @name` comparison has nothing to compare and no elaborated type changed. The file is unchanged: single `import Mathlib`, the module docstring, an empty namespace, no `sorry`, no `set_option`. MS.2.9 is an intermediate target, not a headline, and like every other target it needs carriers that are absent at the pins: convergent F-isocrystals, `E_η` and `(φ,∇)`-modules. The docstring needs no change.
- **Dependency direction** (the prescribed `gate --depcheck … --movable` command):

```text
depcheck: 237 roadmaps, 2140 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name "found nowhere". The newly cited parent sections RD.3.25, RD.3.33, RD.3.34 and RD.3.40 were opened at the head of #1002 and say what is used.
- **Sources.** No source was fetched and no request was filed. Every locator added is in the cached TSU and DAD texts:
  - TSU line 991–1000 (Definition 3.26, Theorem 3.27, p. 18);
  - TSU line 1035–1110 (Lemmas 3.32–3.33 and the proof of 3.27, pp. 19–21);
  - TSU line 1357–1400 (proof of Proposition 6.1, pp. 26–27);
  - DAD line 451–457 (Lemma 4.1.4, p. 12).

## Adversarial pass

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| MS.2.2(4) | `H_C = 0`; free rank one on `G_m` with `f = Σ pⁿx^(pⁿ)`; `A¹` with `f = Σ pⁿx^(−n)` | `0 = 0`. `f` lies in every interior `K_α[[x_α]]₀` and in `Â`, while `|pⁿ|r^(−pⁿ) → ∞` keeps it out of `E†_∞`, so no boundary condition is imposed. `Σ pⁿx^(−n) ∈ E_η` has negative powers at `α = 0`, so it is excluded | The interior condition matters and the boundary is free; true as stated |
| MS.2.9 PBQ definition | zero, unit, `O(−1)⊕O(0)`, Log on `G_m`, Legendre `H` | Bounded slope sets `∅, {0}, {1,0}, {0}, {0}` give PBQ `F, T, F, T, T` | Discriminates. The zero object is excluded |
| MS.2.9 filtration | same five objects | Lengths `0, 1, 2, 1, 1`. Split grade maxima `(1,0)`, nested maxima `(1,1)`. Legendre `H` has generic rank 1, rank 1 at every interior point, `B` rank 1, slope 0 | Correct. `H` is outside MS.2.5 (not overconvergent) and inside MS.2.9 |
| MS.2.9 step 2 (uniqueness) | `H = O²`, `L` the diagonal; wrong model `x·O ⊂ O` on `A¹` | `L_C = {(a,a)} = H_C ∩ E_η(1,1)`. `∇(x·1) = dx ∉ x·K⟨x⟩dx`, so `x·O` is not a subobject | Subobjects are saturated; `L_C = H_C ∩ L_η` holds |
| MS.2.9 step 3 (exterior powers) | `H = O²` with `s = 0, 1, 2` | `s = 0`: the kernel of `O ⊗ H → H` (identity) is 0, so `L = 0`. `s = 1`, `L = ⟨e₁⟩`: `ker(h ↦ e₁∧h) = ⟨e₁⟩`, rank 1. `s = 2`: the target `∧³ = 0`, so `L = H` | Correct in all degrees |
| MS.2.9 rank-one twist | constant line with Frobenius `q` | slope 1; after the twist by `b`, `|b| = |q|`, slope 0; untwisting returns slope 1 | Twist needed, as in MS.2.3 |
| MS.2.9 boundary statement | unit on `G_m` at `α = ∞` | `E_∞ ⊗ P_• = (0 ⊂ E_∞)`, over `E_∞` not `E†_∞` | Correct carrier |
| MS.2.9 proper `C` | `C = P¹`, unit | No boundary; `Isoc = Isoc†` (§RD.3.33); filtration `0 ⊂ O`, the same as MS.2.5 | Agrees |
| MS.4.1 (restated) | Legendre `N = L†|_U`, `P = Top`; `O(−1)⊕O(0) → O(0)`; unit² → unit by `(a,b) ↦ a+b` | Legendre: ranks `1 = 1`, hypothesis not met, `L = H`. Split: `λmax = 1 ≠ 0`, `H = O(−1)` of slope 1, and the sections of `O(−1)` are killed. Sum map: `rank Top = 2 > 1`, `H` is the antidiagonal (slope 0, overconvergent), the boundary kernels match, the glued object is the antidiagonal and is killed in `P` | The strict case produces exactly the subobject that contradicts injectivity in MS.4.2. The slope hypothesis is needed for `λmax(L_η) = slope(P)` |
| MS.4.1 saturation of interior data | `N/L` as an extension of `P` by `H/L` | ranks: `P` and `H/L` are both convergent, so `N_C/L_C` is finite projective | Saturated, as MS.2.3 requires |
| MS.4.2 route with MS.2.5 | unit identity; Log on `G_m` → unit | `P_1 = N†`, slopes `0 = 0`. For Log the section kernel has rank 1, so the hypothesis fails | Correct |
| MS.5.3 induction | `n = 1, 2`; `M` unit, `N = 0`; `N = M = L₀⊕L₁` | Unit: `M′` rank `n`, `Φ′` a cyclic permutation (eigenvalues `n`-th roots of 1, slope 0), `S_min(M′)` rank `n = n`; `N′ = 0`, ranks `0 = 0`; the old text gave `n ≠ 0`. `L₀⊕L₁`: `Φ′ = [[0,q²],[1,0]]` on the induced `L₁` has eigenvalues `±q`, slope 1; rank 4; first step rank `2 = 2` | Old formula false, new formula correct |
| MS.5.3 hull identity | `n = 1`; `n = 2` with `N` the unit-root line of the ordinary Legendre object | `n = 1`: `Hull(N′) = Hull(N)`. `n = 2`: hull ranks `4 = 2·2`, `N′` rank 2, `S_min` ranks `2 = 2` | Consistent with MS on curves |
| `F^*` autoequivalence | `n = 1`; general `n` | `F^* ≅ id` through `Φ`; quasi-inverse `F^((n−1)*)`, because `F^(n*) ≅ id` through `Φ` | Elementary, as stated |
| DAD correction entry | the chain at DAD line 455–456 | four terms; the first lacks `S_1`; the intended first term is `⊕F^(i*)S_1(hull)` | Entry rewritten |

## For the maintainer

- **No identifier was renumbered or removed.** MS.2.9 is appended after MS.2.8. The package now has 69 numbered targets.
- **MS.4.1 has a new explicit hypothesis.** `slope(P) = λmax(N)` is made explicit. It is supplied inside MS.4.2 before MS.4.1 is used, so no consumer changes.
- **Ownership against open pull requests** was checked with `roadmaps grep` over main and all 439 indexed open heads, and in the board packages. The overlaps report lists no conflicting head and no dropped or revision-only id.
- **Supplier gaps.** No new gap. MS.2.9 uses the convergent half of the existing request unit-root-correspondence-perfect-base, whose README line and plan entry already state the convergent equivalence. Neither was changed.
- **Untrusted text.** Nothing in the review asked for actions outside the package.
