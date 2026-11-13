# FIX-PKG-NonordinaryCMSpecialValues~5

This round settles the two findings of `REV-PKG-NonordinaryCMSpecialValues~4`. I checked both against the cached sources and against a direct computation. Both are correct, and both are applied as the review asks.

Changed file: `packages/NonordinaryCMSpecialValues/README.md`, in §4.2, §2.5, the scope list, the supplier contracts and the Layer 2 dependencies.

Unchanged:

- `Suggested.lean`: neither repaired statement is a headline, and no Lean name changed.
- `metadata.toml` and `sources.toml`: no new source was needed.
- The `gaps` list of `design/plan.json`: the new input has a named owner earlier in the merge order, so no gap is needed.

## REV-PKG-NonordinaryCMSpecialValues~4/F01 (P1) — applied

**Verified.** For `ϑ ∈ T_{r,b}` with `b ⊇ a`, the integrand `|(A_uϑ)(0)|² = e^{−2πr√D|u|²}|ϑ(u)|²` is `b`-periodic. So the integral over `ℂ/a` is `[b:a]` times the integral over `ℂ/b`. Since `N(a) = [b:a]N(b)`, the inclusion `i` is an isometry for the scalar products (5).

For `l ∈ b`, the operator `ψ(l)A_l` fixes `T_{r,b}`, so `t_b∘i = [b:a]·id`. An isometry satisfies `i*i = id`, hence `i* = [b:a]⁻¹t_b`. FINIS06 lines 238–240 (p.772) make the same error.

The Shintani operators must keep the unnormalised trace. Take two transverse `N(c)`-subgroups inside `T_{r,ac̄}`; only the identity term survives in `tr(P_a P_{ab})`, which gives `rDN(a)/N(c)`. Normalised projections would therefore make `E(b⁻¹)E(b)` equal to `N(c)⁻¹` on average, whereas unnormalised traces give `N(c)`, Finis's identity.

**Old → new.** "the adjoint of this inclusion is the trace `t_b`" becomes: `i` is isometric, `b ⊆ a*`, `ψ(l)A_l` is a unitary action of `b/a`, `t_b∘i = [b:a]·id`, and `i* = [b:a]⁻¹t_b` is the orthogonal projection. `t_b` stays onto and keeps its kernel; Shintani operators use `t_b` itself. A new Check covers the index-25 case (`1` against `25`).

**Pattern.** "Adjoint" occurs nowhere else in the README. The primitive-space bullet ("orthogonal complement … kernels of `t_{ac⁻¹}`") stays true, because `ker t_b = ker i*`. The dimension `175 − 7 = 168` is unchanged.

## REV-PKG-NonordinaryCMSpecialValues~4/F02 (P1) — applied

**Verified.** KATO04 lines 5495–5503 (pp.258–259) apply the law to `p`-divisible groups `G(v, 𝔭)` and do not say they are formal. When `p = 𝔭𝔭̄` splits and `v | 𝔭`, an element `x ∈ 𝔭̄ ∖ 𝔭` acts on `Lie` by a unit, so `G(v, 𝔭̄)` is étale.

The reviewer's example holds. For `y² = x³ − x` at 5, `#E(F_5) = 8` and the trace is −2. At `i ≡ 2`, the element `2 + i` has tangent scalar `4`, so `E[2+i]` has five geometric points.

**Old → new.** "Each `G(v,𝔭)` is a height-one formal `O_𝔭`-module" becomes:

- Each `G(v,𝔭)` is a `p`-divisible group of relative height one.
- At inert and ramified `p` it is connected, by an `O_𝔭`-rank argument.
- At split `p` the components are connected of dimension 1 and étale of dimension 0.
- On the étale component both sides of the law vanish (`Fil⁰D_dR = 0`, `coLie = 0`).
- Lubin–Tate theory is used only on the connected components.

**Also changed.** A split Check (`f=(8)`, `g=(40)`, `p=5`) and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.9 and R07.1.12–R07.1.14 are added to the *Needs* line, the scope list, a new supplier contract and the Layer 2 dependencies. The Lubin–Tate contract now says that it applies only to connected groups.

**Pattern.** The README has no other all-prime formal claim. §3.5 and the line-201 remark concern inert `p` only, and the inert Check of §2.5 is correct as it stands.

## Checks

**Elaboration.** `lake env lean packages/NonordinaryCMSpecialValues/Suggested.lean`, run from the content checkout, exits 0. The only warnings are three `declaration uses 'sorry'`, at lines 130, 140 and 166. Both Tau Ceti imports already had object files, so no targeted build was needed.

**Binder check.** On a scratch copy I ran `#check @name` for all ten declarations (`conductorModulus`, `IsAnticyclotomic`, `IsEquivariantTypeOneZero`, `IsPAnticyclotomic`, `eulerFactor`, `HasCentralValue`, `rohrlichCount`, `rohrlichCount_eq_zero`, `rohrlichCount_lt`, `centralValue_parity_dichotomy`). It exits 0. Every elaborated type keeps its README hypotheses: CM, quadratic, `p ≠ 2`, the inert prime ideal, both unramifiedness conditions, the odd finite-order anticyclotomic twist and normalised uniformizers. No binder was lost, and nothing changed.

**Dependency check.**

```text
depcheck: 237 roadmaps, 2149 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The one new edge goes to FiniteFlatGroupsAndIntegralPadicHodgeTheory, at merge-order line 66; this package is at line 345.

**Citation resolver.** It reports one lead, the same as before: LubinTateFormalModulesAndQuasiCanonicalLifts §2.1. This is a false positive. That roadmap is a board package placed immediately before this one (line 344), and its §§2.1–2.2 are at lines 605 and 635 of its README. The new FiniteFlatGroupsAndIntegralPadicHodgeTheory ids (§R07.1.8, §R07.1.9, §R07.1.12–§R07.1.14) resolve at the head of that open roadmap, and the cited headings match it.

## Adversarial pass (changed statements)

| Statement | Instances tried | Computed values | Result / change |
| --- | --- | --- | --- |
| §4.2 inclusion isometric | `Q(√−7)`, `r=25`, `a=O_K`, `b=(5)⁻¹`; the case `b=a` | both norms `(50/√7)∫_{ℂ/b}`; for `b=a`, `t_a=A_0=id=i*` | Holds; the degenerate case is consistent |
| §4.2 `b ⊆ a*` | `r=25`, `D=7`, `a=O_K` | `a*=(175)⁻¹O_K ⊇ (5)⁻¹O_K`; `rN(a)D=175 ∈ (5)` | Holds |
| §4.2 `t_b i=[b:a]` and `i*=t_b/[b:a]` | index-25 case; wrong model `i*=t_b` | `t_b ih=25h`; pairings `25` vs `1`; `(t_b/25)` gives `1=1` | Wrong model excluded; Check added |
| §4.2 primitive space after the factor | `d=25`, `a=O_K` | `ker t_b = ker i*`; dimension `175−7=168` | Unchanged |
| §4.2 semi-character law on `b` | `l l̄_2 = N(b)(m+nδ)/2`, `D` odd, `m≡n mod 2` | `rD(u+v)=rN(b)D(m+n)/2 ∈ Z` | `ψ(l)A_l` is an action of `b/a` |
| §4.2 Shintani with unnormalised trace | split `2` in `Q(√−7)`, `N(c)=2` | `tr(P_aP_{ab}) = rDN(a)/N(c)`; average `N(c)²/N(c)=2` vs normalised `1/2` | `E(b⁻¹)E(b)=N(c)=2` needs `t_b`; the γ Check stands |
| §2.5 inert component | `p=5`, `Q(√−7)`, `O_𝔭=W(F_25)` | connected `Z_p`-rank ∈ {0,2}; it is nonzero since `dim=1`, so it is `2` | Connected, height 2 over `Z_p`; agrees with §3.5 |
| §2.5 ramified component | `p=2` in `Q(i)`; `p=7` in `Q(√−7)` | `[O_𝔭:Z_p]=2`, so the same rank argument applies | Connected (supersingular) |
| §2.5 split component | `p=5`, `Q(i)`, `v|(2−i)` | trace `−2`; `2+i ≡ 4` (unit), so `E[2+i]` has 5 geometric points; `2−i ≡ 0`, so `E[2−i]` has 1; dimensions `(1,0)`, heights `(1,1)` | Étale component; Check added |
| §2.5 split, `h_K>1` | `Q(√−23)`, `p=2` | `x=(3±√−23)/2` of norm `8` generates `𝔭̄³`, `x ∉ 𝔭` | The generator `x` exists |
| §2.5 étale vanishing | `r=1`, `T` unramified | `D_dR(T⁻¹(1)) = D_dR(T⁻¹)t⁻¹`, so `Fil⁰=0`; `coLie=0` | Both sides `0`; agrees with the §2.4 Check |
| §2.5 wrong model "both formal" | split `p=5` | formal height 2 would need trace `≡ 0 mod 5`, but the trace is `−2` | Excluded |

## Ownership, sources and notes for the maintainer

- **Ownership.** Nothing new is owned here. The connected/étale analysis belongs to the proof of §2.5. The general carriers are cited from FiniteFlatGroupsAndIntegralPadicHodgeTheory, which owns them; it is an open roadmap, read at its head through `roadmaps show`. The overlap report lists no conflicting head and no dropped id.
- **Sources.** No new source was needed. The FINIS06 p.772 error is now recorded in the README as a source-error note. BOXALL92 remains waived and was not requested.
- **Cross-roadmap effects.** No Lean name or section id changed. Downstream consumers of §§2.1–2.6 (ModularIwasawaMainConjecturesPartII) now get a correct all-prime statement. The new supplier edge to FiniteFlatGroupsAndIntegralPadicHodgeTheory is earlier in the order, so no move is needed.
